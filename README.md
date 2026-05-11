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
| **UI** | PySide6 (Qt 6) + QML |
| **Charts** | QtCharts *(transition vers PyQtGraph prévue — voir roadmap)* |
| **Core engine** | Python 3.11+ (asyncio, QThreadPool) |
| **Storage** | DuckDB + Parquet + Apache Arrow |
| **Analytics** | pandas, polars, statsmodels, linearmodels, arch, scikit-learn, shap, scipy |
| **Résultat unifié** | `AnalysisResult` standardisé (tables, charts, metrics, diagnostics, interpretations, artifacts, provenance) |
| **LLM (BYOK)** | Clients HTTP (httpx) vers providers tiers — aucune dépendance lourde |
| **Auth** | SQLite chiffré local (cryptography / Fernet) |
| **Plugin sandbox** | RestrictedPython + subprocess isolé + permissions zero-trust |
| **Reproductibilité** | `Provenance` (paramètres, versions librairies, seed, dataset version, durée) |
| **Packaging** | PyInstaller + Qt Installer Framework (Windows MSI) |

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

- **Bootstrap projet** — structure, pyproject, gitignore, tests pytest
- **Storage layer** — DuckDB + Parquet versionné + Arrow + `DatasetRegistry`
- **Core engine** — ingestion (CSV/TSV/Excel/JSON/JSONL/Parquet), profilage 14 stats/colonne
- **Shell UI Qt** — sidebar 11 sections, menu, toolbar, statusbar, high-DPI
- **Vue Données** — import, liste datasets, table virtualisée, profil colonnes
- **DataTableView** — `QAbstractTableModel` + `df.iat`, virtualisation Qt native
- **Analytics descriptive** — numérique (mean, std, quartiles, skew, kurtosis, CV, IC95), catégoriel, datetime
- **Analytics corrélation** — Pearson / Spearman / Kendall + matrice p-values + top pairs
- **Tests d'hypothèses** — 11 tests : t (1/2/pairé), Mann-Whitney, Wilcoxon, ANOVA, Kruskal, Chi², normalité (Shapiro/D'Agostino/Anderson), Levene, Bartlett — chacun avec tailles d'effet & interprétation FR auto
- **`AnalysisResult` standardisé** — tables, charts, metrics, diagnostics, interpretations, artifacts, logs, provenance
- **ChartWidget QtCharts** — histogram, bar, line, scatter, box, heatmap (palette divergente)
- **Vue Analyses** — dataset selector, type d'analyse, form dynamique tests, rendu unifié résultats + charts
- **LLM BYOK** — 9 providers builtin + custom, keystore Fernet chiffré
- **Plugin contract** — manifest Pydantic, `PLUGIN_API_VERSION`, permissions zero-trust, signature ed25519 (métadonnées)

### 🟡 En cours

- ACP enrichie + visualisations multivariées (cercle corrélation, biplot, scree, KMO, Bartlett, Varimax, Promax)
- Régressions avancées (linearmodels : IV/2SLS, robust SE, clustered, HAC, quantile)
- Données de panel (FE, RE, GMM, Hausman, IPS, LLC, Pedroni, Kao, Westerlund)

### 🔵 Planifié

#### Infrastructure
- **Migration QtCharts → PyQtGraph** (perf scientifique, datasets >1M points)
- **Job system** (`/core/jobs/`) : queue, worker pool, progress events, cancellable tasks, result store — indispensable pour ne pas freezer l'UI sur grosses analyses
- **Virtualisation explicite des DataFrames** : virtual scrolling, lazy row loading, column virtualization, pagination memory-aware (au-delà de la virtualisation Qt actuelle)
- **Plugin loader + sandbox runner** (RestrictedPython → subprocess isolé → microVM)
- **Workflow DAG engine** : composition reproductible Cleaning → Transform → FE → Model → Eval → Report
- **Projects, sessions, snapshots** : persistance multi-fichiers + reprise après fermeture

#### Séries temporelles
- ARIMA, SARIMA, Holt-Winters, ARDL
- VAR, VECM, BVAR, Granger, IRF, FEVD, Johansen

#### Machine Learning
- 15+ algorithmes (régression + classification)
- Entraînement compétitif avec ranking + SHAP

#### Distribution
- Packaging Windows MSI signed + auto-update
- AppImage Linux + DMG macOS
- Marketplace plugins en ligne

### ⚪ Long terme (v2+)

- **Rust + PyO3** pour kernels analytiques critiques (PCA massif, ML, streaming)
- **GPU compute** optionnel (cuDF / RAPIDS / Numba CUDA) pour preprocessing
- **OpenStats Cloud** : sync, collaboration, marketplace plugins, IA distante (complémentaire au desktop)

### ⚠️ Limites connues (v0.1.x)

- **GIL Python** : se sentira sur PCA massive / gros ML / preprocessing parallèle. Mitigations futures : `multiprocessing`, `polars`, `numba`, kernels Rust.
- **Pas encore de job scheduler async** : analyses lourdes bloquent le thread UI — priorité haute en planning.
- **QtCharts limité** : pas de boxplot natif Python jusqu'à récemment, performances sur scatterplots massifs → PyQtGraph en migration.

---


**OpenStats Desktop** — *Elmas Labs* — 2026

