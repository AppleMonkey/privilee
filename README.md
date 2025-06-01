# Privilee Venues App - Monorepo Readme

## 🧠 Architecture Overview

This project is built using **Clean Architecture** principles, organized in a **Flutter Melos monorepo** setup. The goal is to separate concerns clearly between layers and maintain scalability.

### 🧱 Project Structure

```
packages/
├── venue_entity     # Pure Dart models shared across layers (Domain Models)
├── venue_domain     # Contains abstract repositories & use cases
├── venue_data       # Implements data sources and repositories
├── venue_list       # Presentation layer (UI + BLoC + Mappers)
```

### 🔄 Flow

* **Entity Layer:** Defines domain entities shared across layers.
* **Domain Layer:** Declares abstract repositories and use cases.
* **Data Layer:** Implements the domain contracts using remote data (mocked JSON for now).
* **Presentation Layer:** Uses BLoC and mappers to present venue data in the UI.

### ✅ Injection

Dependency injection is managed via:

* [`injectable`](https://pub.dev/packages/injectable)
* [`get_it`](https://pub.dev/packages/get_it)

Build runner is used to auto-generate injection configs.

## 🚀 How to Run the Project

### 1. Install Melos if you haven’t:

```bash
flutter pub global activate melos
```

### 2. Bootstrap the workspace:

```bash
melos bootstrap
```

### 3. Clean all packages (optional but recommended before build):

```bash
melos run clean
```

### 4. Generate DI and other build\_runner code:

```bash
melos run build
```

### 5. Run the app:

```bash
flutter run -t lib/main.dart
```

### 6. Tests:

```bash
melos run test
```

## 📦 Notable Packages Used

| Package                 | Why We Use It                                  |
| ----------------------- | ---------------------------------------------- |
| `get_it`                | Service locator for injection                  |
| `injectable`            | Code-gen for DI with `get_it`                  |
| `bloc` / `flutter_bloc` | State management in presentation               |
| `mocktail`              | Mocking in unit tests                          |
| `build_runner`          | Code-gen tooling                               |

## 📸 UI Inspiration

The venue list UI uses a **responsive grid** layout with an adaptive number of columns based on screen width. Each item supports a **carousel image viewer** with a **dot indicator** and a placeholder image when no images are available.

