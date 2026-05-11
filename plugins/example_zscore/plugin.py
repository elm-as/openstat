"""Plugin exemple : détection d'outliers par Z-score."""

from __future__ import annotations

import time
from typing import Any

import numpy as np
import pandas as pd

from openstats.analytics.result import (
    AnalysisResult,
    Diagnostic,
    Metric,
    Provenance,
    Table,
)
from openstats.charts import Chart, Series
from openstats.plugins.base import OpenStatsPlugin


class ZScoreOutlierPlugin(OpenStatsPlugin):
    """Détecte les outliers d'une colonne numérique via Z-score."""

    def validate(self, df: pd.DataFrame, params: dict[str, Any]) -> tuple[bool, str]:
        col = params.get("column")
        if not col:
            return False, "Paramètre 'column' requis."
        if col not in df.columns:
            return False, f"Colonne '{col}' absente."
        if not pd.api.types.is_numeric_dtype(df[col]):
            return False, f"Colonne '{col}' non numérique."
        return True, "OK"

    def analyze(self, df: pd.DataFrame, params: dict[str, Any]) -> AnalysisResult:
        started = time.perf_counter()
        col = params["column"]
        threshold = float(params.get("threshold", 3.0))

        s = pd.to_numeric(df[col], errors="coerce").dropna()
        mean = float(s.mean())
        std = float(s.std(ddof=1)) if len(s) > 1 else 0.0
        if std == 0:
            zs = np.zeros_like(s.values)
        else:
            zs = (s.values - mean) / std
        is_outlier = np.abs(zs) > threshold

        outlier_rows = [
            [int(idx), f"{val:.4f}", f"{z:.4f}"]
            for idx, val, z, flag in zip(s.index, s.values, zs, is_outlier)
            if flag
        ][:50]

        tbl = Table(
            title=f"Outliers détectés (|Z| > {threshold})",
            columns=["Index", "Valeur", "Z-score"],
            rows=outlier_rows,
            notes=f"Total : {int(is_outlier.sum())} outliers sur {len(s)} observations.",
        )

        # Histogramme
        counts, edges = np.histogram(s.values, bins=30)
        centers = ((edges[:-1] + edges[1:]) / 2).tolist()
        chart = Chart(
            id="zscore_hist",
            type="histogram",
            title=f"Distribution — {col}",
            x_label=col,
            y_label="Fréquence",
            x=centers,
            series=[Series(name="Fréquence", data=counts.astype(int).tolist())],
            meta={
                "mean": mean,
                "std": std,
                "outlier_threshold_low": mean - threshold * std,
                "outlier_threshold_high": mean + threshold * std,
            },
        )

        duration_ms = int((time.perf_counter() - started) * 1000)

        return AnalysisResult(
            analysis_type="plugin:zscore_outliers",
            title=f"Z-score outliers — {col}",
            tables=[tbl],
            charts=[chart],
            metrics=[
                Metric("n_outliers", "Outliers détectés", int(is_outlier.sum())),
                Metric("mean", "Moyenne", mean),
                Metric("std", "Écart-type", std),
                Metric("threshold", "Seuil", threshold),
            ],
            diagnostics=[
                Diagnostic(
                    "outlier_proportion",
                    "ok" if is_outlier.mean() < 0.05 else "warning",
                    f"{is_outlier.mean() * 100:.2f}% d'outliers détectés.",
                )
            ],
            interpretations=[
                f"{int(is_outlier.sum())} valeurs aberrantes identifiées avec |Z| > {threshold}.",
            ],
            provenance=Provenance(
                parameters={"column": col, "threshold": threshold},
                duration_ms=duration_ms,
            ),
        )
