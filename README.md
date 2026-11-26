# FLX Authentication Flutter

A modular and configurable Flutter authentication package for Flexurio applications. It supports dual login flows (Direct Token-based login and 2FA PIN verification), role & permission management, and token refresh persistence with HydratedBloc.

---

## Features

- **Dual Login Flows**:
  - **Direct Login Flow (No 6-Digit PIN)**: For backends where login immediately returns an `access_token` (with optional `refresh_token`) or a plain JWT string in `data`.
  - **Two-Factor Authentication Flow (2FA / 6-Digit PIN)**: For backends where login returns `auth_at` (or `data: null` for OTP-only flows) requiring a secondary 6-digit OTP/PIN code to generate tokens.
- **Dynamic Configuration**: Fully configurable API URLs and HTTP methods (`GET` / `POST`) without hardcoded endpoints.
- **Token Management**:
  - Access Token & Refresh Token storage and hydration.
  - Automatic JWT payload extraction for user profile information (`id`, `user_id`, `nip`, `name`, `email`, `role`).
- **Permissions & Roles**: Automatic fetching and caching of user permissions and department assignments.
- **State Management**: Built on top of `flutter_bloc` and `hydrated_bloc` for seamless offline persistence.

---

## Architecture & Authentication Flows

```mermaid
flowchart TD
    A["User enters username & password"] --> B["GET or POST /login (Basic Auth)"]
    B --> C{"Response contains token?"}

    C -->|"Yes: Direct Flow (access_token / JWT string)"| D["LoginAuthResult.direct"]
    D --> E["Save access_token & optional refresh_token"]
    E --> F["Fetch Permissions & Roles"]
    F --> G["Emit AuthenticationState.authenticated"]
    G --> H(["Navigate to Home / Dashboard"])

    C -->|"No: 2FA Flow (auth_at or null)"| I["LoginAuthResult.twoFactor"]
    I --> J["Navigate to 6-Digit PIN Verification Page"]
    J --> K["User enters 6-digit PIN"]
    K --> L["GET /token_auth (Basic Auth: auth_at:PIN)"]
    L --> M["Receive access_token"]
    M --> F
```

---

## Installation & Setup

Add `flx_authentication_flutter` to your `pubspec.yaml`:

```yaml
dependencies:
  flx_authentication_flutter:
    path: ../flx_authentication_flutter
```

### Initializing AuthenticationBloc

In your app entry point (`main.dart` or `app.dart`):

```dart
AuthenticationBloc.initialize(
  userRepository: UserRepositoryApp.instance,
  onLogin: (data) {
    UserRepositoryApp.instance.dataAdapterSetup(data);
  },
);
```

---

## Usage

### Rendering Login Page

```dart
// Default flow (GET) — supports both direct token response and 2FA
LoginPage.prepare(
  urlAuthApi: 'https://api.example.com/users/auth/login',
  urlAuthApiTwoFactor: 'https://api.example.com/users/auth/token_auth',
  withTwoFactor: true, // or false for direct login
  onLoginSuccess: (accessToken, userPayload) async {
    return userPayload;
  },
);

// Explicit POST flow (e.g. flx-nocode-api) — returns plain JWT string in `data`
LoginPage.prepare(
  urlAuthApi: 'http://localhost:8107/login',
  withTwoFactor: false,
  authMethod: 'POST',
  onLoginSuccess: (accessToken, userPayload) async {
    return userPayload;
  },
);
```

### Supported Login Flows & HTTP Methods

`authMethod` is an optional parameter on `LoginPage.prepare(...)` and `LoginEvent.submit(...)`. When omitted (`null`), the repository keeps full backward compatibility with `GET`-based auth backends:

| Flow Type | `withTwoFactor` | `authMethod` | HTTP Request | Expected `data` Payload | Result |
|---|---|---|---|---|---|
| **Direct Token (`GET`)** | `false` or `true` | `null` (default) | `GET /users/auth/login` | `{"access_token": "...", "refresh_token": "..."}` | `LoginAuthResult.direct` |
| **2FA with `auth_at`** | `true` | `null` (default) | `GET /users/auth/login` | `{"auth_at": "..."}` | `LoginAuthResult.twoFactor` |
| **2FA OTP-only** | `true` | `null` (default) | `GET /users/auth/login` | `null` | `LoginAuthResult.twoFactor(authId: nip)` |
| **Verify Password** | any | `null` (auto) | `POST /*verify-password*` | `{"access_token": "..."}` or `"<jwt>"` | `LoginAuthResult.direct` |
| **Direct JWT (`POST`)** | `false` | `'POST'` | `POST /login` | `"<jwt_string>"` | `LoginAuthResult.direct` |

> **Important:** Do not tie the HTTP method to `withTwoFactor`. Always pass `authMethod: 'POST'` explicitly when targeting endpoints that only accept `POST` (such as `flx-nocode-api`), so `GET`-based direct-login backends remain unaffected.

### Local Testing & Widgetbook

Run unit tests (repository + `LoginBloc` covering direct token `GET`, 2FA, and `POST` plain JWT flows):

```bash
flutter test test/resource/authentication_repository_test.dart test/bloc/login_bloc_test.dart
```

Run Widgetbook locally without a real backend using the built-in `mock.local` Dio interceptor (`LoginPage → Mock flx-nocode-api (POST)`):

```bash
flutter run -t lib/widgetbook.dart -d macos
```

### Checking User Permissions

```dart
final hasAccess = UserRepositoryApp.instance.checkPermission('view:products');
if (hasAccess) {
  // Allow access
}
```

### Logging Out

```dart
AuthenticationBloc.logout();
```

---

## Key Components

| Class / Model | Description |
|---|---|
| [`LoginAuthResult`](lib/src/app/model/login_auth_result.dart) | Data model representing the result of the initial login step (`.direct` vs `.twoFactor`). |
| [`UserRepository`](lib/src/app/resource/user_repository.dart) | Repository holding active `token`, `refreshToken`, `user`, and `permissions`. |
| [`AuthenticationBloc`](lib/src/app/bloc/authentication/authentication_bloc.dart) | Hydrated BLoC managing authenticated and unauthenticated states. |
| [`AuthenticationRepository`](lib/src/app/resource/authentication_repository.dart) | Remote HTTP service interacting with login and role endpoints. |