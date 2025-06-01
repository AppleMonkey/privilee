# Privilee Venue Listing App

This project showcases a venue listing feature within the **Privilee** ecosystem, built using a **Clean Architecture** approach with modular Flutter packages managed via **Melos**.

---

## 🧱 Architecture Overview

The app follows a **3-layer Clean Architecture**:

### 1. `venue_domain`

* Contains core business logic and domain models.
* Defines repository interfaces and use cases.
* Clean, platform-agnostic, and highly testable.

### 2. `venue_data`

* Implements domain interfaces and handles remote data access.
* Uses defensive parsing to safely handle malformed or missing data.
* Converts raw JSON into domain models.

### 3. `venue_app`

* UI layer using `flutter_bloc` for state management.
* Injects domain use cases only—no direct access to data layer.
* Uses display models and mappers to isolate UI logic.

**Advantages**:

* Strong separation of concerns.
* High testability and maintainability.
* Compile-time enforced boundaries.

```plaintext
privilee_venue_listing_app/
├─ packages/
│  ├─ venue_domain/
│  ├─ venue_data/
│  └─ venue_app/
```

---

## 📦 Monorepo with Melos

Each layer is an isolated package managed with **Melos**, which simplifies development across modules, enforces modular design, and enables parallel development and testing.

---

## 🧩 Abstraction & DI

Dependency injection is powered by `injectable` and `get_it`. Code generation (`build_runner`) creates registration logic across packages, ensuring loose coupling and clean dependencies.

---

## 🛡️ Defensive Parsing

All DTOs and parsers implement defensive logic to catch malformed or missing fields. Errors bubble up through layers, allowing for contextual handling and fallback strategies.

---

## 🧪 Parameterized Testing

Venue parsing is tested with parameterized tests, which isolate the test logic from input scenarios—making the test cases easier to expand and reason about.

---

## 🛠️ Dev Tools and Packages

| Package        | Purpose                          |
| -------------- | -------------------------------- |
| `get_it`       | Service locator for DI           |
| `injectable`   | Declarative dependency injection |
| `build_runner` | Code generation                  |
| `flutter_bloc` | BLoC pattern                     |
| `mocktail`     | Unit testing mocks               |
| `bloc_test`    | Testing BLoC states              |
| `melos`        | Monorepo orchestration           |

---

## 📌 Summary

* 3-layer architecture.
* Modular packages for isolation and testing.
* Dependency injection via `injectable` & `get_it`.
* Defensive parsing and parameterized tests for robustness.

---

## 🤝 How to Contribute

### Dev Setup

```bash
flutter pub get
melos bootstrap
```

### Build Codegen

```bash
melos run clean     # Clean generated files
melos run build     # Generate DI and mappers
```

### Run the App

```bash
flutter run -t lib/main.dart
```

---

## 📦 Melos Commands Available

```bash
melos run clean
melos run build
```

---

## 🔮 Future Enhancements

* Implement pagination and lazy loading.
* Add sorting/filtering UI.
* Support for localization in display models.

---

## 🧠 Final Thoughts

This project emphasizes scalability, testability, and clean separation of concerns. By adhering to Clean Architecture and modular design, each layer is independently testable and replaceable. This structure enables teams to iterate faster, onboard easily, and maintain high code quality over time.

If you're reviewing this project, I hope it's clear that the decisions taken, architectural structure, modularization, dependency injection, and test strategy—weren’t accidental. They reflect real-world development principles aimed at building scalable and maintainable apps. The focus was on clarity, structure, and clean boundaries to make this codebase production-ready and team-friendly.
