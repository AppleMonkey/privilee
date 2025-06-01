# 📱 venue_list

**Presentation layer** of the **Privilee Venue Listing** feature. This package is responsible for rendering the venue UI, managing state using BLoC, and consuming injected domain use cases.

---

## 📐 Responsibilities

- UI composition using Flutter widgets  
- State management via `flutter_bloc`  
- Mapping domain models to display models  
- Dependency injection and UI orchestration  
- No direct access to `venue_data` (inverts control via `venue_domain` interfaces)

---

## 🧩 Architecture Role

`venue_list` depends only on `venue_domain`. It receives pure business logic and outputs rich, responsive UI.  
Mappers are used to convert domain models into UI-specific display models for flexibility and reuse.

---

## 💡 Features

- Responsive Grid layout with dynamic column count  
- Carousel UI with fallback images  
- Page indicators  
- Clean separation using mappers and display models  
- Dedicated use case to prepare display data (`GetVenueGridModelUseCase`)

---

## 🔧 Dev Dependencies

| Package              | Purpose                           |
|----------------------|-----------------------------------|
| `flutter_bloc`       | State management                  |
| `injectable`         | Declarative DI registration       |
| `get_it`             | DI service locator                |
| `mocktail`           | Mocks for testing                 |
| `bloc_test`          | BLoC testing                      |
| `build_runner`       | Code generation                   |

---

## 🧪 Testing

- BLoC unit tests with `bloc_test`  
- Display model mappers tested for transformation accuracy  
- Data use case injected and tested via mocks  

---

## 📁 Directory Structure

```
venue_list/
├── lib/
│   ├── src/
│   │   ├── bloc/
│   │   ├── display_model/
│   │   ├── display_mapper/
│   │   ├── presentation/
│   │   └── di/
├── assets/
│   └── placeholder.jpg
├── pubspec.yaml
```

---

## 🖼️ Assets

Local image placeholder:

```yaml
flutter:
  assets:
    - assets/placeholder.jpg
```

---

## 🧠 Notes

- Domain-layer logic is injected — no direct dependency on the data layer.  
- Keeps UI isolated from parsing, networking, and storage.  
- Use cases return rich display models to simplify widget composition.
