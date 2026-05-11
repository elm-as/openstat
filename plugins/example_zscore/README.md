# Plugin officiel — Z-Score Outlier Detection

Détecte les valeurs aberrantes dans une colonne numérique via la méthode du Z-score.

## Paramètres

| Clé | Type | Défaut | Description |
|---|---|---|---|
| `column` | str | requis | Nom de la colonne numérique à analyser |
| `threshold` | float | `3.0` | Seuil au-delà duquel une valeur est considérée comme outlier |

## Permissions requises

- `dataset.read`

## Exemple

```python
plugin.analyze(df, {"column": "salary", "threshold": 2.5})
```
