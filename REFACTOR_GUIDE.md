# OpenStats Desktop Architecture Refactor Guide

This document outlines the professional 3-zone architecture implemented in the 0.1.0-modernization update.

## The 3-Zone Pattern

Every view in the application is now structured into three distinct functional zones:

1.  **Zone 1: Navigation (Global Sidebar)**
    *   **Location**: `MainWindow.nav_sidebar`
    *   **Role**: Application-level navigation (Dashboard, Data, Analyze, etc.).
    *   **Implementation**: A fixed-width `QListWidget` with professional icons.

2.  **Zone 2: Workspace (Central Content)**
    *   **Location**: `self.workspace` (in each View)
    *   **Role**: Visualization and analysis results. This is the focus of the user's attention.
    *   **Best Practice**: Keep it clean. Use cards (`#card`) to group related information.

3.  **Zone 3: Context Panel (Right Utility Bar)**
    *   **Location**: `MainWindow.context_panel`
    *   **Role**: Configuration, filters, and action buttons specific to the active view.
    *   **Implementation**: Views must implement `build_context_panel(self, panel: QFrame)` to inject their controls.

## State Management & Reactivity

We use a singleton `UIState` (`openstats.ui.state`) to synchronize the application.

### Key Principles:
*   **Single Source of Truth**: The active `dataset_id` is stored in `UIState`.
*   **Pub/Sub Pattern**: Views connect to `state.dataset_changed` or `state.analysis_changed` to update their content instantly.
*   **Auto-Run UX**: When possible (e.g., Descriptive Stats), the analysis should run as soon as parameters change, without requiring an explicit "Run" click.

## Styling (QSS)

Avoid inline styles. Use the standardized selectors defined in `styles.py`:

| Selector | Usage |
| :--- | :--- |
| `#h1` | Main page title |
| `#h3` | Section sub-header (uppercase, tracking) |
| `#card` | Container for groups of controls or info |
| `#primary_btn` | The most important action button in a panel |
| `.muted` | Secondary or helper text |

## Adding a New View

1.  Inherit from `QWidget`.
2.  In `_build()`, setup your Workspace layout.
3.  Implement `build_context_panel(panel: QFrame)` to add settings to the right sidebar.
4.  Register the view in `MainWindow._init_views`.
5.  Listen to `state.dataset_changed` to refresh data when the global selection changes.
