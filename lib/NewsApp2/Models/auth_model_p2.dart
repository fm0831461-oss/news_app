class AuthModelP2 {
  final bool status;
  final String message;

  AuthModelP2({required this.status, required this.message});
  factory AuthModelP2.fromjson(Map<String, dynamic> json) {
    return AuthModelP2(status: json["status"], message: json["title"]);
  }
}
