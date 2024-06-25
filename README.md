# Universities App

The Universities App is a modular iOS application developed using Swift and UIKit, following the VIPER architecture. It features two main modules: UniversitiesList and UniversityDetails. The app fetches data from an API, caches it using Realm, and supports offline functionality. 



## Features

- **Modular Architecture**: The app is divided into distinct modules for better code organization and maintainability.
- **VIPER Architecture**: Each module adheres to the VIPER design pattern, ensuring a clear separation of concerns.
- **Networking**: Network requests are handled by a dedicated Networking package.
- **Local Caching**: Uses Realm for local data storage to support offline functionality.
- **Dependency Injection**: A DIContainer is used for managing dependencies, making the codebase more modular and testable.
- **Unit Tests**: The project includes unit tests to ensure the reliability of the core functionalities.

## Usage

- The app starts with a list of universities fetched from the API.
- Tapping on a university navigates to the details screen, displaying more information about the selected university.
- The data is cached locally, ensuring the app works offline.

## Modules

### UniversitiesList

- **View**: Displays the list of universities.
- **Presenter**: Handles user interactions and updates the view.
- **Interactor**: Fetches data from the API and cache.
- **Router**: Manages navigation to the UniversityDetails module.

### UniversityDetails

- **View**: Displays details of a selected university, including clickable links to the university's web pages.
- **Presenter**: Fetches and presents the university details.
- **Interactor**: Provides university details to the presenter.
- **Router**: Manages navigation within the UniversityDetails module.

## Unit Tests

The project includes unit tests for key components, ensuring the reliability and correctness of the app's functionalities.

## Result


https://github.com/amr0010/universitesApp/assets/13542092/64206ea8-c464-4aef-a5c2-aee2b724d465

