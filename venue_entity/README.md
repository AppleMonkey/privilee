# venue_entity

`venue_entity` is a Dart package containing shared data models for representing venues and their related information in a modular, cross-platform application. It provides the core entities used across the domain, data, and presentation layers.

## 📦 Purpose

This package ensures clean separation of concerns by housing data models that are reused in both the `venue_list` and `venue_detail` packages, as well as within the domain and data layers.

## 🧱 Features

- Centralized venue model (`Venue`)
- Support for:
  - Coordinates
  - Images
  - Categories
  - Opening hours
  - Things to do
  - Venue filters
- Strong typing and constructor-based initialization
- Designed to integrate into clean architecture

## 📁 Structure

```
lib/
└── src/
    └── models/
        ├── venue.dart
        ├── coordinates.dart
        ├── category.dart
        ├── thing_to_do.dart
        ├── venue_image.dart
        ├── opening_hours.dart
        └── venue_filter.dart
```

## 🚀 Getting Started

Add this package as a dependency in other internal modules:

```yaml
dependencies:
  venue_entity:
    path: ../venue_entity
```

Then import and use:

```dart
import 'package:venue_entity/venue_entity.dart';
```

## 🤝 Used In

- `venue_domain` — for defining repository interfaces and use cases
- `venue_data` — for parsing JSON and implementing data access
- `venue_list` and `venue_detail` — for UI representation

