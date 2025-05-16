# flutter_modularized_package_getx_clean_arch

A modular, scalable Flutter e-commerce application built using **GetX**, **Clean Architecture**, and a **package-based feature separation** strategy.  
Each major feature (auth, products, cart, home) is implemented as an **independent Dart package** for true modularization.

---

## 📦 Architecture Overview

This project follows **Clean Architecture** and uses **GetX** for:

- State management
- Dependency injection
- Routing

It’s organized by **feature packages**, each implemented as a standalone Dart package within the `features/` directory:

```

features/
├── auth/        → Authentication package
├── products/    → Product management package
├── cart/        → Shopping cart package
├── home/        → Home screen package
├── core/        → Shared utilities and routing

```

Each package contains:
- `data/` — data sources & Hive models
- `domain/` — entities, repositories, use cases
- `presentation/` — UI, controllers, bindings

---

## ✅ Features

- 🔐 Login flow using mocked credentials
- 🏠 Home screen
- 🛍️ Product list with:
  - Add product (via dialog)
  - Delete product
  - Stored locally using Hive
- 🛒 Cart management:
  - Add/remove items
  - Show total
- 🚀 Bottom navigation bar between packages
- 📦 Each feature is its own Dart package
- 🧼 Clean architecture for maintainability

---

## 📁 Folder Structure

```

lib/
├── main.dart
├── core/                         → Shared routing/constants
└── app/
├── routes/app\_pages.dart     → All GetX routes
└── pages/main\_page.dart      → Bottom nav layout
features/
├── auth/                         → Auth package
├── products/                     → Products package
├── cart/                         → Cart package
├── home/                         → Home package
└── core/                         → Core shared logic

````

---

## 🛠️ Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourname/flutter_modularized_package_getx_clean_arch.git
   cd flutter_modularized_package_getx_clean_arch
````

2. **Install dependencies:**

   ```bash
   flutter pub get
   ```

3. **Generate Hive type adapters:**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app:**

   ```bash
   flutter run
   ```

---

## 🔍 Package-Based Modularization

Each **feature is isolated in its own Dart package**, not just a folder. This enables:

* Independent development/testing of each package
* Better encapsulation of dependencies
* Cleaner boundaries between features
* Easier scalability and reusability

> For example, the `products` package exports only the `ProductListPage` and its binding, and manages its own domain, data, and presentation layers.

---


## 🛠 Technologies

* Flutter 3.x
* Dart
* GetX
* Hive
* Local Dart packages
* Clean Architecture

---


