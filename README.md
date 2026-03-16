# Shivpal Portfolio

Personal portfolio website built with Flutter and Firebase.

## Overview

This project is a responsive portfolio app for web and mobile platforms. It presents:

- hero and intro section
- about and metrics section
- work experience section
- projects section
- contact footer with launchable links

The app uses bundled local portfolio data by default and can also read dynamic content from Firestore.

## Tech Stack

- Flutter
- Dart
- flutter_bloc
- Firebase Core
- Cloud Firestore
- url_launcher

## Firestore Content

The app listens to these Firestore paths:

- `projects`
- `portfolio/links`

If Firestore access is denied or no remote content is available, the UI falls back to bundled local data from [portfolio_data.dart](C:/Users/shivp/OneDrive/Desktop/shivpal/shiv_portfolio/lib/data/portfolio_data.dart).

## Run Locally

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

Run for web:

```bash
flutter run -d chrome
```

## Build Web

```bash
flutter build web
```

The production web output is generated in `build/web`.

## Firebase Hosting

This project is configured for Firebase Hosting.

Deploy flow:

```bash
cmd /c firebase.cmd login
cmd /c firebase.cmd deploy --only hosting
```

If PowerShell blocks `firebase`, use `firebase.cmd` as shown above.

## Project Structure

```text
lib/
  bloc/
  core/
  data/
  models/
  pages/
  sections/
```

## Notes

- Firebase project: `shiv-e0361`
- Portfolio content can be managed locally or through Firestore
- Navigation items scroll to their matching sections on the page
