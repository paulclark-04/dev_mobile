# Cours 01

Ce projet est l'implémentation du **Cours 01** du module Développement Mobile (ECE).
L'objectif est de créer une interface de connexion moderne en Flutter, structurée et conforme aux maquettes.

## Structure du Projet

- **`lib/main.dart`** : Point d'entrée et Thème global.
- **`lib/login/login_page.dart`** : Écran principal, assemble les widgets.
- **`lib/widgets/`** : Composants réutilisables :
  - `email_field_widget.dart` : Champ texte stylisé avec gestion du focus.
  - `continue_button_widget.dart` : Structure du bouton principal (style basique).
  - `or_separator_widget.dart` : Séparateur visuel.
  - `continue_with_button_widget.dart` : Boutons "Social Auth" avec icônes SVG.
- **`assets/`** : Contient les logos (Google, Facebook, Apple).

## Comment lancer le projet

Le projet est configuré pour tourner sur Chrome (Web) ou Simulateur iOS/Android.

```bash
# Récupérer les dépendances
flutter pub get

# Lancer sur Chrome
flutter run -d chrome
```

## Vérification
Le champ Email dispose d'un style actif/inactif :
- **Inactif** : Bordure grise, hint text visible.
- **Focus** : Bordure bleu-gris plus foncée, curseur actif.
