
# 📦 venue_data

The `venue_data` package is the **data layer** in our modular clean architecture setup. It is responsible for **retrieving, parsing, transforming, and delivering raw data** to the domain layer, abstracted behind well-defined interfaces.

---

## 🧱 Architectural Overview

This package is structured around **Clean Architecture** principles. Here's a breakdown of key decisions and why we made them:

### 1. **Repository Implementation (Separation of Concerns)**
We keep the `VenueRepositoryImpl` inside `venue_data`, but the `VenueRepository` interface lives in the `venue_domain` layer. This maintains the **dependency inversion principle** — domain defines "what", data defines "how".

### 2. **DTOs & Parsers (Decoupled Parsing)**
Instead of using `fromJson()` inside DTOs, we use dedicated **Parsers** for each DTO. This ensures:
- DTOs remain thin and testable
- Parsing logic is centralized and defensive

### 3. **Mappers (DTO → Entity)**
Every DTO has a corresponding **Mapper** that converts it to a domain `Venue` entity. This keeps transformation logic separate and testable, and prevents leaking data-specific structures into the domain.

### 4. **RemoteDataSource with Injectable Client**
The `VenueRemoteDataSourceImpl` is built to **simulate real API behavior** using local JSON assets. It accepts an `http.Client`, allowing for easy replacement with mock/test clients.

### 5. **Assets for Mock API**
In the absence of a real API, JSON data is stored locally and loaded through the `rootBundle`. This structure mimics network calls while keeping the system testable and platform-independent.

---

## 📁 Key Components

| Folder            | Purpose                                                 |
|-------------------|----------------------------------------------------------|
| `models/`         | Thin DTOs used to mirror external data sources          |
| `parsers/`        | Parse dynamic JSON into validated DTOs                  |
| `mappers/`        | Convert DTOs to domain entities                         |
| `datasources/`    | Abstract and implement access to remote (or local) data |
| `repositories/`   | `VenueRepositoryImpl` as the concrete data access point |

---

## 🧪 Testability
- DTOs, Parsers, Mappers, and Repository are individually testable
- Data can be easily mocked or replaced in integration tests
- Designed to scale for local caching, offline support, or GraphQL/REST swaps

---

## 🔗 Depends On

- `venue_entity`: Provides the core Venue model
- `venue_domain`: Provides the abstract `VenueRepository` interface

---

## 🧠 Why It Matters
This structure makes the app:
- Easier to scale and maintain
- Testable at every layer
- Flexible for backend/API changes
