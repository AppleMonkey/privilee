
# 🧩 venue_domain

The `venue_domain` package represents the **domain layer** in a clean architecture setup. It defines the **business rules and interfaces** without knowing about implementation details.

---

## 🔍 Purpose

- Contains only **abstract contracts**, **domain models**, and **use cases**.
- Does not depend on any external packages or Flutter libraries — it's pure Dart.
- Ensures that the **core logic** is independent, reusable, and easy to test.

---

## 🧱 Architecture Decisions

### 1. **Repository Interface**
The `VenueRepository` interface defines what operations are required (e.g., `getVenues()`, `getVenueById()`), allowing the data layer to implement it in various ways.

### 2. **Use Cases**
We isolate logic into **use case classes**, like:
- `GetAllVenues`
- `GetVenueById`

These encapsulate business rules and are the entry points for the UI or application layer.

### 3. **Interfaces for Use Cases**
Each use case is written to an interface (e.g., `GetAllVenues`) and implemented separately (`GetAllVenuesImpl`) to promote loose coupling and testability.

---

## 📁 Structure

| Folder         | Purpose                          |
|----------------|----------------------------------|
| `repositories` | Abstract contracts for data ops  |
| `usecases`     | Reusable business logic units    |

---

## 🧪 Testability

- All components are easily mockable and testable.
- Does not require Flutter to run tests — pure Dart testing.

---

## 🔗 Depends On

- `venue_entity` only — no direct dependency on UI or data.

---

## 🔐 Why This Matters

By keeping business logic in a clean domain layer:
- You future-proof the codebase
- Enable easy replacement of data sources
- Achieve high test coverage with low maintenance
