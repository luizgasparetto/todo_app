class RefreshTokenEntity {
  const RefreshTokenEntity({
    this.token = '',
    this.refreshToken = '',
    this.tokenType = '',
  });

  final String token;
  final String refreshToken;
  final String tokenType;
}
