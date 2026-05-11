<div align="center">

# 🌌 OpenStat Core
[<img src="https://readme-typing-svg.herokuapp.com?font=Fira+Code&pause=1000&color=a855f7&width=435&lines=OpenStat+Core;SYSTEM+INITIALIZED;ACCESS+RESTRICTED" alt="Typing SVG" />](https://git.io/typing-svg)

![Banner](https://placehold.co/1200x300/0a0a0a/a855f7?text=OpenStat+Core+//+PURPLE_VOID)

[![Status](https://img.shields.io/badge/Status-Beta-a855f7?style=for-the-badge&logo=statuspage&logoColor=white)](#)
[![Category](https://img.shields.io/badge/Category-Production_Systems-black?style=for-the-badge&logo=micro-soft-academic&logoColor=white)](#)
[![Build](https://img.shields.io/badge/Build-v1.0.4--7F26-gray?style=for-the-badge&logo=githubactions&logoColor=white)](#)

</div>

---

## 🛰️ DEPLOYMENT_TRACE
```text
    _______  _        _______  _______  _______ 
   (  ____ \( \      (       )(  ___  )(  ____    | (    \/| (      | () () || (   ) || (    \/
   | (__    | |      | || || || (___) || (_____ 
   |  __)   | |      | |(_)| ||  ___  |(_____  )
   | (      | |      | |   | || (   ) |      ) |
   | (____/\| (____/\| )   ( || )   ( |/\____) |
   (_______/(_______/|/     \||/     \|\_______) [PURPLE_VOID]
                                 
> Initializing sequence... 7F26232E45A1E8D8
> Environment: PRODUCTION_SHADOW
> Security Protocol: ZERO_TRUST
> Status: BETA
```

---

# OpenStats Desktop

**Plateforme analytique native professionnelle** — calcul local massif, offline-first, extensible.

> Concurrence directe : SPSS, Stata, JMP, JASP, RStudio Desktop.

---

## Vision

OpenStats Desktop est un laboratoire analytique moderne pour data analysts, économètres, chercheurs et étudiants. Il fonctionne **entièrement en local**, sans serveur, sans inscription, sans dépendance cloud.

---

## Stack technique

### Stack actuelle (v0.1.x)

| Couche | Technologie |
|---|---|
| **UI** | PySide6 (Qt 6) + Thème Professionnel (QSS/Tailwind-like) |
| **Icons** | QtAwesome (Font Awesome 5 Vector Icons) |
| **Charts** | PyQtGraph (Performance native) |
| **Core engine** | Python 3.10+ (Architecture Jobs Asynchrones) |
| **Storage** | DuckDB 1.1+ + Parquet + Apache Arrow |
| **Analytics** | pandas, statsmodels, linearmodels, scikit-learn |
| **Résultat unifié** | `ResultStore` standardisé avec export Multi-format (HTML/PDF/Excel) |
| **LLM (BYOK)** | Système de clés chiffrées (Fernet) — DeepSeek, OpenAI, Anthropic |
| **Packaging** | PyInstaller + Windows MSI Framework |

### Évolution architecturale (long terme)

```
UI : Qt 6 + QML  (PySide6 d'abord, Qt C++ futur si besoin perf)
  ↓
Core Engine : Python (v0/v1) → Rust + PyO3 (v2+) pour kernels analytiques
  ↓
Storage : DuckDB + Parquet + Arrow IPC zero-copy
  ↓
Analytics : pandas + statsmodels + linearmodels (CPU)
            polars (vectorisé, optionnel)
            sklearn / xgboost / lightgbm (ML)
```

Le Rust n'est introduit **que lorsque** les benchmarks justifient le coût de complexité (kernels critiques uniquement).

---

## Fonctionnalités cibles

### Analyses statistiques
- Statistiques descriptives + bootstrap CI
- Corrélations (Pearson, Spearman, Kendall, distance correlation)
- Tests d'hypothèses (paramétriques et non-paramétriques)
- Régressions avancées : IV/2SLS, Tobit, Probit, Logit multinomial/ordinal, quantile, Heckman, SUR, SEM
- Erreurs standard robustes : HC0-HC3, clustered, HAC/Newey-West

### Données de panel
- Modèles : Fixed Effects, Random Effects, Between, First Difference, Pooled OLS, Dynamic Panel, GMM (Arellano-Bond, System GMM)
- Tests : Hausman, Breusch-Pagan LM, Wooldridge, Pesaran CD
- Stationnarité : IPS, LLC, Fisher ADF/PP, Hadri
- Cointégration : Pedroni, Kao, Westerlund

### Séries temporelles
- ARIMA, SARIMA, Holt-Winters, ARDL
- VAR, VECM, BVAR
- Granger causality, IRF, FEVD, Johansen cointegration

### Analyse multivariée
- ACP avec rotations (Varimax, Promax)
- KMO, test de Bartlett
- Cercle de corrélation, biplot, scree plot, contributions, cos²
- AFC, ACM
- Clustering (K-means, hiérarchique, DBSCAN)

### Machine Learning
- 15+ algorithmes (régression et classification)
- Entraînement compétitif avec ranking
- SHAP values pour explainability
- Validation croisée + grid search

### Visualisation
- Toute analyse produit automatiquement graphiques + diagnostics visuels
- Export publication-ready (PNG haute résolution, SVG, PDF vectoriel)
- Rendu GPU — actuellement via **QtCharts**, migration planifiée vers **PyQtGraph** pour :
  - performance sur datasets massifs (>1M points)
  - flexibilité scientifique (paramètres fins, custom rendering)
  - usage standard dans la communauté scientifique Python

### IA intégrée — BYOK (Bring Your Own Key)

OpenStats **n'embarque aucun modèle** et **n'envoie aucune donnée** vers un service tiers tant que l'utilisateur n'a pas explicitement configuré son provider IA dans **Paramètres → IA**.

**Providers connus pris en charge nativement** (l'utilisateur fournit uniquement sa clé) :
- OpenAI (GPT-4o, o1)
- Anthropic (Claude 4, Claude 3.5)
- DeepSeek (Chat, Reasoner, Coder)
- Mistral AI (Large, Small, Codestral)
- Google Gemini (compat OpenAI)
- Groq (Llama 3.3, Mixtral)
- OpenRouter (catalogue multi-modèles)
- xAI (Grok)
- Ollama (local, optionnel)

**Provider personnalisé** : si ton provider n'est pas listé (vLLM, LM Studio, Together, Anyscale, serveur interne…), tu fournis :
- URL de base (ex: `https://api.mon-provider.com/v1`)
- Nom du modèle
- Format d'API (`openai_compatible` ou `anthropic_compatible`)

Les clés sont **chiffrées localement** (Fernet, dossier de configuration utilisateur) et ne sont **jamais** synchronisées ailleurs.

**Cas d'usage** :
- Génération de scripts Python à partir de prompts
- Interprétation automatique des résultats statistiques
- Recommandations de modèles ML adaptés au dataset
- Aide à la rédaction de rapports

### Plugin system — Zero-trust & versionné

- **Contrat strict** : tout plugin hérite de `OpenStatsPlugin`, retourne un `AnalysisResult`
- **Versioning d'API** : `PLUGIN_API_VERSION` + `openstats_min_version` vérifiés au chargement → aucun plugin obsolète ne casse l'app
- **Permissions zero-trust** : chaque plugin déclare explicitement ses besoins (`filesystem.read`, `network.http`, `dataset.write`, `llm.call`, etc.) — l'utilisateur valide à l'installation
- **Signature numérique** (ed25519) optionnelle, publishers de confiance
- **Sandbox d'exécution** : RestrictedPython phase 1 → microVM/WASM phase 5
- **Marketplace officielle** : [github.com/elm-as/openstat](https://github.com/elm-as/openstat)
- **Catalogue cible** : survival analysis, spatial econometrics, deep learning, NLP, Bayesian, geospatial, causal inference, bioinformatics

### Pipeline analytique (workflow DAG)

Chaque projet OpenStats peut composer un **workflow** comme une chaîne reproductible :

```
Dataset → Cleaning → Transformation → Feature Engineering
        → Modeling → Evaluation → Reporting
```

Objectif : approche à la KNIME / RapidMiner / Alteryx, même avec une UI simple.
Chaque étape est ré-exécutable et versionnée.

### Reproductibilité (recherche-grade)

Chaque `AnalysisResult` embarque automatiquement une `Provenance` :

- paramètres exacts utilisés
- versions des librairies (`scipy`, `numpy`, `pandas`, `statsmodels`...)
- version Python + plateforme
- ID + version du dataset source
- seed aléatoire
- durée d'exécution

Tout résultat peut être **ré-exécuté à l'identique** — condition sine qua non en économétrie / recherche académique.

### Projets, sessions, snapshots

*Phase 5 — architecture prévue :*

- **Projets** persistants (datasets + workflows + résultats)
- **Sessions** sauvegardées (reprise en l'état après fermeture)
- **Snapshots** à chaque transformation majeure
- **Historique** complet des opérations (audit trail)

---

## Installation (développement)

```bash
# Clone
git clone https://github.com/elm-as/openstat.git
cd openstat

# Environnement virtuel
python -m venv .venv
.venv\Scripts\activate

# Dépendances
pip install -e ".[dev]"

# Lancer l'application
python -m openstats
```

---

## Structure du projet

```
OpenStats-Desktop/
├── pyproject.toml
├── README.md
├── LICENSE
├── src/
│   └── openstats/
│       ├── __init__.py
│       ├── __main__.py              # Entry point
│       ├── app.py                   # Application Qt
│       ├── config.py                # Configuration globale
│       ├── ui/                      # Interface Qt/QML
│       │   ├── main_window.py
│       │   ├── qml/                 # Vues QML
│       │   ├── widgets/             # Widgets Python
│       │   └── charts/              # Charts QtCharts
│       ├── core/                    # Moteur principal
│       │   ├── engine.py            # Orchestrateur
│       │   ├── scheduler.py         # Job scheduler async
│       │   └── events.py            # Event bus
│       ├── storage/                 # Couche persistance
│       │   ├── duckdb_store.py      # DuckDB backend
│       │   ├── parquet_io.py        # Parquet I/O
│       │   ├── arrow_bridge.py      # Arrow IPC
│       │   └── versioning.py        # Versioning datasets
│       ├── data/                    # Ingestion & profilage
│       │   ├── ingestion.py
│       │   ├── profiling.py
│       │   └── cleaning.py
│       ├── analytics/               # Modules analytiques
│       │   ├── descriptive.py
│       │   ├── correlation.py
│       │   ├── hypothesis_tests.py
│       │   ├── regression/          # Régressions
│       │   │   ├── linear.py
│       │   │   ├── robust.py
│       │   │   ├── iv.py
│       │   │   ├── tobit.py
│       │   │   ├── probit.py
│       │   │   ├── quantile.py
│       │   │   └── heckman.py
│       │   ├── panel/               # Données de panel
│       │   │   ├── models.py        # FE/RE/GMM
│       │   │   ├── tests.py         # Hausman, BP, Pesaran
│       │   │   ├── stationarity.py  # IPS, LLC, Fisher
│       │   │   └── cointegration.py # Pedroni, Kao, Westerlund
│       │   ├── timeseries/          # Séries temporelles
│       │   │   ├── univariate.py    # ARIMA, SARIMA, HW
│       │   │   ├── multivariate.py  # VAR, VECM
│       │   │   └── diagnostics.py
│       │   ├── multivariate/        # Analyse factorielle
│       │   │   ├── pca.py           # ACP + rotations
│       │   │   ├── ca.py            # AFC
│       │   │   ├── mca.py           # ACM
│       │   │   └── clustering.py
│       │   └── ml/                  # Machine Learning
│       │       ├── competitive.py
│       │       ├── explainability.py
│       │       └── models.py
│       ├── charts/                  # Génération graphiques
│       │   ├── base.py              # Chart contract
│       │   ├── distributions.py
│       │   ├── correlation_circle.py
│       │   ├── biplot.py
│       │   ├── scree.py
│       │   ├── residuals.py
│       │   └── exporters.py         # PNG/SVG/PDF
│       ├── llm/                     # IA — BYOK (clients HTTP)
│       │   ├── providers.py         # Registre providers connus + custom
│       │   ├── client.py            # Client unifié OpenAI/Anthropic compat
│       │   ├── keystore.py          # Stockage chiffré des clés API
│       │   ├── prompts.py           # Templates prompts
│       │   └── interpreter.py       # Interprétation résultats
│       ├── plugins/                 # Plugin system
│       │   ├── base.py              # OpenStatsPlugin contract
│       │   ├── loader.py            # Chargement dynamique
│       │   ├── manifest.py          # Validation manifest.json
│       │   └── registry.py
│       ├── sandbox/                 # Exécution sécurisée
│       │   ├── runner.py            # Subprocess isolé
│       │   ├── restricted.py        # RestrictedPython
│       │   └── policies.py          # Permissions
│       ├── auth/                    # Auth locale
│       │   ├── store.py             # SQLite chiffré
│       │   └── session.py
│       └── reports/                 # Rapports
│           ├── pdf.py
│           ├── excel.py
│           └── html.py
├── tests/                           # Tests unitaires + intégration
├── plugins/                         # Plugins bundled (exemples)
├── resources/                       # Icônes, traductions, QML assets
└── packaging/                       # Scripts MSI/AppImage/DMG
```

---

## Roadmap

### ✅ Complété

#### Analytics

- **Statistiques descriptives** — numérique (mean, std, quartiles, skew, kurtosis, CV, IC95 Student), catégoriel, datetime
- **Corrélations** — Pearson / Spearman / Kendall + matrice p-values + top pairs
- **11 tests d'hypothèses** — t (1/2/pairé), Mann-Whitney, Wilcoxon, ANOVA, Kruskal, Chi², normalité (Shapiro/D'Agostino/Anderson), Levene, Bartlett — avec tailles d'effet et interprétations FR
- **Multivariée & ACP** — KMO, Bartlett, scree, cercle corrélation, biplot, Varimax, Promax, contributions, cos²
- **Clustering** — K-Means, Hiérarchique (Ward), DBSCAN + métriques de qualité (Silhouette, Davies-Bouldin) et projection ACP 2D
- **OLS** — SE robustes (HC0–HC3, HAC), diagnostics complets
- **Logit / Probit** — odds ratios, pseudo R², LR test
- **Panel** — Pooled, FE, RE, Between, First Differences, Hausman
- **Time Series** — ADF, KPSS, ACF/PACF, ARIMA + forecast
- **ML compétitif** — 6 algos régression / 4 classification, ranking auto

#### Infrastructure

- **Bootstrap projet** — structure, pyproject, gitignore
- **Storage layer** — DuckDB + Parquet versionné + Arrow + `DatasetRegistry`
- **Core engine** — ingestion (CSV/TSV/Excel/JSON/JSONL/Parquet), profilage 14 stats/colonne
- **Data Cleaning** — imputation (mean/median/knn), suppression doublons, standardisation, détection d'outliers (IQR, Z-score)
- **Reporting** — génération de rapports en PDF (ReportLab), HTML (Jinja2) et Excel (OpenPyXL)
- **Shell UI Qt** — sidebar 11 sections, menu, toolbar, statusbar, high-DPI
- **Vue Données** — import, liste datasets, table virtualisée, profil colonnes
- **DataTableView** — `QAbstractTableModel` + `df.iat`, virtualisation Qt native
- **`AnalysisResult` standardisé** — tables, charts, metrics, diagnostics, interpretations, artifacts, logs, provenance
- **ChartWidget QtCharts** — histogram, bar, line, scatter, box, heatmap (palette divergente)
- **Vue Analyses unifiée** — dataset selector + 30+ analyses dans une seule combo, dialog target/features/panel, rendu standardisé résultats + charts
- **Vue Paramètres** — config BYOK provider/clé + ajout custom + test connexion
- **Vue Plugins** — install/uninstall/details (permissions, API version)
- **LLM BYOK** — 9 providers builtin + custom, keystore Fernet chiffré, client unifié OpenAI/Anthropic compatible
- **Plugin system complet** — manifest Pydantic, `PLUGIN_API_VERSION`, permissions zero-trust, signature ed25519, loader, registry, sandbox runner, plugin officiel `example-zscore`
- **Dialog d'analyse avancée** — sélection target/features/entity/time avec validation

#### Régressions avancées (Phase 2)

- **IV / 2SLS** — variables instrumentales avec tests Sargan + Wu-Hausman
- **Régression quantile** — plusieurs niveaux simultanés avec trajectoires des coefficients
- **Tobit** — censure gauche/droite, MLE custom
- **Heckman 2-step** — correction du biais de sélection (Probit + IMR)

#### Panel data avancé (Phase 2)

- **Pesaran CD** — dépendance transversale
- **Wooldridge AR(1)** — autocorrélation panel
- **Breusch-Pagan LM** — RE vs Pooled
- **Stationnarité panel** — IPS, LLC, Fisher-ADF, Hadri
- **Cointegration panel** — Kao, Pedroni, Westerlund

#### Séries temporelles complètes (Phase 2)

- **VAR** — + IRF + FEVD + tests de causalité de Granger
- **Johansen** — trace + max eigen + sélection automatique du rang
- **VECM** — vecteurs de cointegration + ajustement α
- **Holt-Winters** — lissage exponentiel triple + forecast
- **ARDL** — modèle à retards distribués

#### ML étendu (Phase 2)

- **15+ algorithmes** : LR, Ridge, Lasso, ElasticNet, Huber, DT, RF, ExtraTrees, GB, AdaBoost, KNN, SVR/SVM, MLP, NB, **XGBoost**, **LightGBM** (si installés)
- **SHAP** — importance globale via TreeExplainer

#### Infrastructure (Phase 2)

- **Job system** (`core/jobs/`) — queue, worker pool, progress signals Qt, cancellation tokens, result store LRU
- **Workflow DAG engine** (`core/workflow/`) — composition Cleaning → Transform → FE → Model → Eval → Report avec détection de cycles
- **Projects/Sessions/Snapshots** (`core/projects/`) — persistance multi-fichiers, reprise après fermeture, snapshots horodatés
- **Virtualisation explicite DataFrames** (`storage/virtual_dataset.py`) — lecture paginée via DuckDB, jamais tout en RAM
- **VirtualTableModel** — cache LRU de pages, jamais > N pages en mémoire
- **PyQtGraph adapter** (`ui/widgets/chart_widget_pg.py`) — rendu scientifique perf, optionnel via `pip install pyqtgraph`
- **Subprocess sandbox** (`sandbox/subprocess_runner.py`) — isolation OS pour plugins, timeout hard

#### Distribution (Phase 2)

- **Scripts de packaging** : `packaging/windows/build_msi.ps1`, `linux/build_appimage.sh`, `macos/build_dmg.sh`
- **Template WiX** pour MSI signed
- **Auto-update** — architecture documenter (`packaging/README.md`)

### ⚪ Long terme (v2+)

- **Rust + PyO3** pour kernels analytiques critiques (PCA massif, ML, streaming)
- **GPU compute** optionnel (cuDF / RAPIDS / Numba CUDA) pour preprocessing
- **OpenStats Cloud** : sync, collaboration, marketplace plugins en ligne
- **microVM Firecracker** ou **WASM/Pyodide** pour sandbox plugin niveau 3
- **BVAR** — Bayesian VAR (priors Minnesota / Litterman)

### ⚠️ Limites connues (v0.2.x)

- **GIL Python** : se sentira sur PCA massive / gros ML / preprocessing parallèle. Mitigations futures : `multiprocessing`, `polars`, `numba`, kernels Rust.
- **PyQtGraph en option** : installé via `pip install "openstats[charts-pg]"`. Le ChartWidget par défaut reste QtCharts.
- **Subprocess sandbox** : phase 2, isolation OS basique sans limites mémoire/CPU strictes (Linux uniquement avec `resource`). Phase 3 : microVM/WASM.
- **IPS/LLC/Pedroni/Westerlund** : implémentations pédagogiques basées sur les principes des articles d'origine. Pour publications académiques rigoureuses, valider avec un package R/Stata spécialisé.
- **BVAR non implémenté** : VAR / VECM / Johansen suffisent pour 95% des cas ; BVAR sera ajouté selon demande.

---

## Statistiques projet

| | |
|---|---|
| **Modules Python** | 50+ |
| **Lignes de code** | ~10 000 |
| **Tests pytest** | 110+ |
| **Analyses disponibles** | **50+** : descriptive, corrélations, 11 tests d'hypothèses, ACP ×3, OLS ×2, Logit, Probit, **quantile, Tobit, IV/2SLS, Heckman**, Panel ×4, Hausman, **Pesaran CD, Wooldridge, BP-LM, IPS, LLC, Fisher-ADF, Hadri, Kao, Pedroni, Westerlund**, stationnarité, ARIMA, **Holt-Winters, ARDL, VAR+IRF+FEVD+Granger, Johansen, VECM**, ML compétitif (15+ algos), **SHAP** |
| **Providers LLM (BYOK)** | 9 builtin + custom illimité |
| **Permissions plugins** | 9 catégories zero-trust |
| **Charts supportés** | histogram, bar, line, scatter, box, heatmap, qq, residuals (QtCharts + PyQtGraph optionnel) |
| **Sandbox** | in-process + subprocess isolé |
| **Job system** | async ThreadPool, progress signals Qt, cancellation, result store LRU |
| **Workflow** | DAG avec détection cycles + exécution séquentielle |
| **Persistance projets** | multi-fichiers (workflows + sessions + snapshots) |

---


**OpenStats Desktop** — *Elmas Labs* — 2026

