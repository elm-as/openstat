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

| Couche | Technologie |
|---|---|
| **UI** | PySide6 (Qt 6) + QML + QtCharts |
| **Core engine** | Python 3.11+ (asyncio, QThreadPool) |
| **Storage** | DuckDB + Parquet + Apache Arrow |
| **Analytics** | pandas, polars, statsmodels, linearmodels, arch, scikit-learn, shap |
| **LLM local** | llama-cpp-python (modèles GGUF) |
| **Auth** | SQLite chiffré local (cryptography) |
| **Sandbox plugins** | RestrictedPython + subprocess isolé |
| **Packaging** | PyInstaller + Qt Installer Framework (Windows MSI) |

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
- Rendu GPU via QtCharts

### IA intégrée
- Génération de scripts Python à partir de prompts (local via llama.cpp)
- Interprétation automatique des résultats
- Recommandations de modèles

### Plugin system
- Contrat `OpenStatsPlugin` standardisé
- Marketplace officielle (GitHub)
- Sandbox d'exécution sécurisé

---

## Installation (développement)

```bash
# Clone
cd C:/Users/elmas/Desktop/Projets/OpenStats-Desktop

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
│       ├── llm/                     # IA locale
│       │   ├── runtime.py           # llama.cpp wrapper
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

- [x] **Phase 0** — Bootstrap projet
- [ ] **Phase 1** — Shell UI Qt + storage DuckDB
- [ ] **Phase 2** — Core data engine + analyses de base
- [ ] **Phase 3** — Panel data + régressions avancées
- [ ] **Phase 4** — Visualisations natives + ACP enrichie
- [ ] **Phase 5** — Plugin system + sandbox
- [ ] **Phase 6** — LLM local + assistant IA
- [ ] **Phase 7** — Packaging MSI + auto-update

---

**OpenStats Desktop** — *Elmas Labs* — 2026
