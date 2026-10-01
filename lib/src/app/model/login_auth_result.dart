class LoginAuthResult {
  const LoginAuthResult.twoFactor({
    required this.authId,
  })  : isTwoFactor = true,
        accessToken = null,
        refreshToken = null,
        user = null;

  const LoginAuthResult.direct({
    required this.accessToken,
    this.refreshToken,
    this.user,
  })  : isTwoFactor = false,
        authId = null;

  final bool isTwoFactor;
  final String? authId;
  final String? accessToken;
  final String? refreshToken;
  final Map<String, dynamic>? user;
}
