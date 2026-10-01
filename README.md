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
Widget build(BuildContext context) {
  return LoginPage(
    urlAuthApi: 'https://api.flexurio.com/users/auth/login',
    urlAuthApiTwoFactor: 'https://api.flexurio.com/users/auth/token_auth',
    urlRole: 'https://api.flexurio.com/users',
    onLoginSuccess: (context, data) {
      // Custom routing on successful authentication
      Navigator.of(context).pushReplacementNamed('/home');
    },
    userRepository: UserRepositoryApp.instance,
    logo: Image.asset('assets/images/logo.png'),
    title: 'Flexurio Chiron ERP',
    subtitle: 'Sign in to your account',
  );
}
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