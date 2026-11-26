# FLX Authentication Flutter

A modular and configurable Flutter authentication package for Flexurio applications. It supports dual login flows (Direct Token-based login and 2FA PIN verification), role & permission management, and token refresh persistence with HydratedBloc.

---

## Features

- **Dual Login Flows**:
  - **Direct Login Flow (Tanpa Token 6-Digit)**: For environments/companies (e.g. DJM) where login immediately returns `access_token` and `refresh_token`.
  - **Two-Factor Authentication Flow (2FA / 6-Digit PIN)**: For environments where login returns `auth_at` (ID) requiring a secondary 6-digit OTP/PIN code to generate tokens.
- **Dynamic Configuration**: Fully configurable API URLs without hardcoded company IDs or endpoints.
- **Token Management**:
  - Access Token & Refresh Token storage and hydration.
  - Automatic JWT payload extraction for user profile information (`id`, `user_id`, `nip`, `name`, `email`, `role`).
- **Permissions & Roles**: Automatic fetching and caching of user permissions and department assignments.
- **State Management**: Built on top of `flutter_bloc` and `hydrated_bloc` for seamless offline persistence.

---

## Architecture & Authentication Flows

```mermaid
flowchart TD
    A[User enters username & password] --> B[POST /users/auth/login]
    B --> C{Response contains access_token?}
    
    C -->|Yes: Direct Flow| D[LoginAuthResult.direct]
    D --> E[Save access_token & refresh_token]
    E --> F[Fetch Permissions & Roles]
    F --> G[Emit AuthenticationState.authenticated]
    G --> H([Navigate to Home / Dashboard])
    
    C -->|No: 2FA Flow (has auth_at)| I[LoginAuthResult.twoFactor]
    I --> J[Navigate to 6-Digit PIN Verification Page]
    J --> K[User enters 6-digit PIN]
    K --> L[GET /users/auth/token_auth Basic Auth: auth_at:PIN]
    L --> M[Receive access_token]
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
// Default flow (Chiron ERP: DJM, Metiska, Voltune) — uses GET by default
LoginPage.prepare(
  urlAuthApi: 'https://api.flexurio.com/users/auth/login',
  urlAuthApiTwoFactor: 'https://api.flexurio.com/users/auth/token_auth',
  withTwoFactor: true, // or false for direct login (e.g. DJM)
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

`authMethod` is an optional parameter on `LoginPage.prepare(...)` and `LoginEvent.submit(...)`. When omitted (`null`), the repository keeps full backward compatibility with legacy clients:

| Client / Backend | `withTwoFactor` | `authMethod` | HTTP Request | Expected `data` Payload | Result |
|---|---|---|---|---|---|
| **DJM** | `false` or `true` | `null` (default) | `GET /users/auth/login` | `{"access_token": "...", "refresh_token": "..."}` | `LoginAuthResult.direct` |
| **Metiska** | `true` | `null` (default) | `GET /users/auth/login` | `{"auth_at": "..."}` | `LoginAuthResult.twoFactor` |
| **Voltune** | `true` | `null` (default) | `GET /users/auth/login` | `null` | `LoginAuthResult.twoFactor(authId: nip)` |
| **Verify Password** | any | `null` (auto) | `POST /*verify-password*` | `{"access_token": "..."}` or `"<jwt>"` | `LoginAuthResult.direct` |
| **`flx-nocode-api`** | `false` | `'POST'` | `POST /login` | `"<jwt_string>"` | `LoginAuthResult.direct` |

> **Important:** Do not tie the HTTP method to `withTwoFactor`. Always pass `authMethod: 'POST'` explicitly when targeting endpoints that only accept `POST` (such as `flx-nocode-api`), so `GET`-based direct-login clients (such as DJM) remain unaffected.

### Local Testing & Widgetbook

Run unit tests (repository + `LoginBloc` covering DJM, Metiska, Voltune, and `flx-nocode-api`):

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