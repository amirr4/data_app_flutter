# 🧱 Modular Clean Flutter App

A fully modular, scalable Flutter app using **Clean Architecture**, **BLoC**, **GetX**, and **Melos** for monorepo package management.

---

## 📦 Project Structure

```
packages/
├── app/               # Main app (UI, navigation)
├── core/              # Global configs, constants
├── network/           # Isolated network layer
└── feature/
    └── home/          # Home feature with BLoC, repository, use cases, etc.
melos.yaml             # Melos configuration
.github/workflows/     # GitHub Actions for CI
```

---

## 🧪 Testing

Unit tests are written for:

- ✅ UseCases
- ✅ Repositories
- ✅ RemoteDataSource
- ✅ Blocs

Run tests:

```bash
flutter test
```

---

## 🔁 CI/CD with GitHub Actions

Each `push` or `pull request` on `main` will:

- ✅ Bootstrap packages with Melos
- ✅ Format check
- ✅ Static analysis (`flutter analyze`)
- ✅ Run all tests

📁 Workflow config: `.github/workflows/flutter_ci.yml`

---

## 🚀 Technologies Used

| Tool/Library        | Purpose                     |
| ------------------- | --------------------------- |
| Flutter             | Mobile/Web UI Framework     |
| BLoC                | State Management            |
| GetX                | Navigation & DI             |
| Melos               | Monorepo Package Management |
| json_serializable   | JSON parsing for models     |
| mockito + bloc_test | Unit testing                |

---

## 🧰 Melos Commands

```bash
melos bootstrap      # Install dependencies across packages
melos test           # Run tests for all packages
melos analyze        # Static analysis for all packages
```

---

## 🧱 Clean Architecture Layers

Each `feature` (like `home`) follows this layered structure:

```
domain/
├── entities/
├── usecases/
├── repositories/

data/
├── datasources/
├── models/
├── repositories/

presentation/
├── bloc/
├── pages/
├── bindings/
```

---

## ⚙️ Quick Start

```bash
# Clone the project
git clone https://github.com/amirr4/data_app_flutter.git

cd modular_clean_app

# Activate Melos
dart pub global activate melos

# Bootstrap all packages
melos bootstrap

# Run app
flutter run
```

---

## 👤 Author

**Amir** – [GitHub Profile](https://github.com/amirr4)

---
