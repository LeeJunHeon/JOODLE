abstract class AuthCredentials {
  final String username;
  final String password;

  AuthCredentials({required this.username, required this.password});
}

class LoginCredentials extends AuthCredentials {
  LoginCredentials({required String username, required String password})
      : super(username: username, password: password);
}

class SignUpCredentials extends AuthCredentials {
  final String email;
  final String phone;
  final String address;
  final String confirm;

  SignUpCredentials({required String username, required String password, required this.phone, required this.address, required this.confirm, required this.email})
      : super(username: username, password: password);
}