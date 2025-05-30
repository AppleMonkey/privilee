
# 📦 Changelog for venue_data

All notable changes to this package will be documented in this file.

---

## [1.0.0] - Initial Release

### ✨ Features
- Set up package structure for data layer.
- Added `VenueRepositoryImpl` that implements `VenueRepository` from the domain layer.
- Integrated `VenueRemoteDataSourceImpl` to load venues from local JSON asset.
- Defined thin `VenueDto` models to represent raw data.
- Implemented dedicated Parsers to defensively convert JSON to DTOs.
- Created Mappers to transform DTOs into domain `Venue` entities.
- Used `injectable` for dependency injection and `http` for potential real API integration.
- Local JSON simulates API behavior using `rootBundle`.

### 🧪 Testing
- Data components structured to support unit testing.
- Remote data source uses injectable `http.Client` for mocking.
