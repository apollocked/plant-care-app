# 🌿 Plant Care

**Plant Care** is a beautifully designed Flutter app that transforms plant care into an effortless, personalized experience. Track your houseplants, manage watering schedules, receive smart reminders, and keep your garden thriving—all with an intuitive, offline-first design.

Whether you're a plant parent caring for a few favorites or managing a lush indoor garden, Plant Care has you covered with intelligent tracking, real-time notifications, and a beautiful interface available in multiple languages.

## ✨ Key Features

### 🌱 Smart Plant Management

- **Plant Collection Dashboard** – Add and organize your plants with customizable details (name, species, watering intervals, feeding schedules)
- **Individual Care Profiles** – Set custom reminder times and notification preferences for each plant
- **Real-time Health Tracking** – Monitor plant status at a glance with live health indicators

### 📊 Intelligent Dashboard

- **Home Summary** – Live dashboard showing total plants, healthy plants, and plants needing water or food
- **Interactive Statistics** – Long-press on any stat card to view detailed information with helpful tips
- **Urgent Care Alerts** – Instantly identify plants that need immediate attention
- **Smart Scrolling** – Click the urgent banner to automatically scroll to and highlight plants needing care
- **Quick Action Controls** – Water or feed plants directly from the home screen or details page

### 🔔 Smart Notifications

- **Local Push Reminders** – Timely watering and feeding notifications (no cloud required)
- **Action-Based Notifications** – Directly water or feed plants from notification actions
- **Permission-Aware Setup** – Guided permission prompting for seamless notification setup

### 📱 Home Screen Widget

- **At-a-Glance Garden Summary** – Plant statistics and care status right on your home screen
- **Multi-Language Support** – Widget displays in your preferred language

### 🎨 Beautiful User Experience

- **Light & Dark Themes** – Choose your preferred visual style with easy toggle in the app bar
- **Smooth Animations** – Polished transitions and interactive elements throughout
- **Guided Onboarding** – First-run walkthrough with an in-app showcase tour

### 🌍 Multi-Language & Accessibility

- **Full Localization** – English, Arabic, and Kurdish support
- **RTL Layout Support** – Fully responsive design for right-to-left languages
- **Inclusive Design** – Carefully crafted UI for users across different regions

### 💾 Privacy-First & Offline

- **Offline Persistence** – All plant data stored locally on your device with Hive
- **No Cloud Required** – Your plant data never leaves your device
- **Full Privacy Control** – See our comprehensive privacy policy in-app

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

## 📥 Download

Get Plant Care on your device:

[![Download on Google Play](https://img.shields.io/badge/Get%20it%20on%20Google%20Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.apollo.plant_care)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.11.4 or higher)
- Android Studio, Visual Studio Code, or another Flutter-ready IDE
- A configured Android emulator/device or iOS simulator/device

### Installation & Setup

```bash
# Clone the repository
git clone https://github.com/apollocked/plant-care-app.git
cd plant-care-mock-app

# Install dependencies
flutter pub get

# Generate localizations
flutter gen-l10n

# Run the app
flutter run
```

## 📋 Available Commands

```bash
# Get dependencies
flutter pub get

# Generate localizations (ARB files)
flutter gen-l10n

# Run code analysis
flutter analyze

# Run unit and widget tests
flutter test

# Build release APK (Android)
flutter build apk --release

# Build for iOS
flutter build ios --release
```

## 📝 Important Notes

- **Default Language**: The app initializes in Kurdish through the `LanguageService`—change via the language toggle in settings
- **Data Storage**: All plant information is stored locally on your device using Hive (no cloud sync)
- **Notifications**: Full notification support requires device permissions; behavior may vary on emulators
- **Privacy**: No personal data is collected or sent to external servers

## 🎯 Tech Stack

- **Framework**: Flutter & Dart
- **State Management**: Provider
- **Local Storage**: Hive & hive_flutter
- **Notifications**: Awesome Notifications
- **Widgets**: home_widget (iOS & Android home screen widgets)
- **Localization**: flutter_localizations with ARB-based i18n
- **UI/UX**:
  - Lottie for animations
  - smooth_page_indicator for onboarding
  - showcaseview for guided tours
  - Google Fonts for typography

## 📂 Project Architecture

```
lib/
├── main.dart                          # App entry point, providers, theme
├── core/
│   ├── l10n/                          # ARB localization files
│   ├── notifications/                 # Notification setup & handlers
│   └── theme/                         # Light/dark theme definitions
├── data/
│   ├── model/                         # Plant data model
│   └── services/                      # Storage & notification services
├── logic/                             # ViewModels & business logic
└── presentation/
    ├── pages/                         # Screens (home, details, onboarding)
    └── widgets/                       # Reusable UI components
```

## 👤 Author

Developed by **Muhammed Jameel** as a learning project showcasing Flutter best practices, clean architecture, and user-centric design.

## 📄 License

This project is provided as-is for educational and personal use.
