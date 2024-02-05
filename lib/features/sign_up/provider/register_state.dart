class RegisterState {
  const RegisterState({
    required this.email,
    required this.username,
    required this.password,
    required this.rePassword,
  });
  final String username;
  final String email;
  final String password;
  final String rePassword;

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
