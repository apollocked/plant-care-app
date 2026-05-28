# Plant Care

Plant Care is a modern Flutter app for tracking houseplants, care schedules,
and daily reminders. It was built as a practical learning project for Flutter
and mobile development, with a focus on local-first data, polished UI, and
multi-language support.

## Features

- Plant collection management with name, optional species, watering interval,
  feeding interval, reminder times, and per-plant reminder toggles.
- Home dashboard with live totals for all plants, healthy plants, plants that
  need water, and plants that need food.
- Urgent care states that highlight plants needing attention and provide quick
  water/feed actions from the home list and details page.
- Plant details screen with care status cards, schedule progress indicators,
  care tips, editable intervals, upcoming dates, and notification controls.
- Local notifications for watering and feeding reminders, with notification
  actions and permission prompting.
- Home screen widget support that mirrors the garden summary in the selected
  language.
- First-run onboarding plus a guided home-page showcase tour.
- Light and dark themes with a theme toggle in the app bar.
- Localization for English, Arabic, and Kurdish, including RTL layout support.
- Offline persistence using Hive, so plant data stays on the device.

## Tech Stack

- Flutter and Dart
- Provider for state management
- Hive and hive_flutter for local storage
- Awesome Notifications for local reminders
- home_widget for Android/iOS home screen widgets
- flutter_localizations and generated ARB-based l10n
- Lottie and smooth_page_indicator for onboarding
- showcaseview for the guided app tour

## Project Structure

```text
lib/
+-- main.dart                         # App bootstrap, providers, theme, l10n
+-- core/
|   +-- l10n/                         # ARB files and generated localizations
|   +-- notifications/                # Notification helpers and callbacks
|   +-- theme/                        # Light/dark app themes
+-- data/
|   +-- model/                        # Plant model
|   +-- services/                     # Storage and notification services
+-- logic/                            # View models and widget sync logic
+-- presentation/
    +-- pages/                        # Onboarding, home, add, details screens
    +-- widgets/                      # Reusable UI components
```

## Getting Started

### Prerequisites

- Flutter SDK
- Android Studio, Visual Studio Code, or another Flutter-ready editor
- A configured Android emulator/device or iOS simulator/device

### Installation

```bash
git clone https://github.com/apollocked/plant-care-mock-app.git
cd plant-care-mock-app
flutter pub get
flutter run
```

## Useful Commands

```bash
flutter pub get
flutter gen-l10n
flutter analyze
flutter test
```

## Notes

- The app starts in Kurdish by default through `LanguageService`.
- Plant and preference data are stored locally with Hive.
- Notification behavior depends on platform permissions and emulator/device
  notification support.

## Author

Developed by Muhammed Jameel.
