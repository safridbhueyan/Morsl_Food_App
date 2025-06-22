# Morsl App 

Morsl is a Flutter-based mobile application aimed at providing a platform to discover, share, and store delicious recipes. This app offers a smooth user interface, featuring a recipe home page, favorites management and settings flow.

## Overview

Morsl is a mobile app developed using **Flutter**, allowing users to explore a variety of recipes. It includes several key features, such as:

- **Home Screen**: Displays recipes and allows users to filter and explore new options.
- **Favorites Flow**: Users can save recipes to their favorites list.
- **Settings Flow**: Allows users to customize app preferences.

## Features

- **Home Screen Flow**: Display recipes with options to filter by categories, and swipe through a collection of recipes.
- **Favorites Flow**: Users can save recipes they love for quick access.
- **Reset Flow**: Reset app settings to default.
- **Settings Flow**: Modify app settings like theme and preferences.

## Folder Structure

```bash
lib/
├── core/                    # Core functionality (e.g., theme, constants, services)
│   ├── constants/           # Constants (e.g., padding, icon names)
│   ├── theme/               # Theme management (app_theme.dart, theme_extension.dart)
│   └── utils/               # Utility functions (formatting, validations)
├── data/                    # Data-related (API, local storage)
│   ├── models/              # Data models (e.g., Recipe, User)
│   ├── repository/          # Data fetching logic
│   ├── services/            # Data services (network calls, database interaction)
│   └── routes/              # Routing logic
├── provider/                # State management (Riverpod or Provider)
│   ├── food_provider.dart   # State management for food-related data
│   └── auth_provider.dart   # State management for authentication
├── src/                     # Feature-based organization
│   ├── common_widgets/      # Reusable UI components (buttons, cards, etc.)
│   └── feature/             # Specific app features (e.g., auth, home, profile)
└── main.dart                # Entry point of the app
```

## Getting Started

These instructions will help you get started with the **Morsl** app development environment, so you can run the app locally.

### Prerequisites

Make sure you have the following installed on your machine:
- **Flutter SDK**: Follow the [Flutter installation guide](https://docs.flutter.dev/get-started/install).
- **Dart SDK**: Flutter comes with Dart, so you don’t need to install it separately.
- **Android Studio** or **Visual Studio Code** for development.
- An **Android** or **iOS** emulator, or a real device to run the app.

### Installing

1. **Clone the repository:**
   ```bash
   git clone https://github.com/backbencherstudio/celina_food_image_app.git
   cd celina_food_image_app
![Image](https://github.com/user-attachments/assets/8a28ac28-7baa-42d6-a8b2-b1713a1c4e04)
![Image](https://github.com/user-attachments/assets/d78501f3-2324-495e-8d12-90f4ade5f728)
![Image](https://github.com/user-attachments/assets/c8fc6080-1567-442d-a4de-2eb6df7d5877)
![Image](https://github.com/user-attachments/assets/00cc404c-dc10-4cc6-a8d4-c8baa80a8dd6)
