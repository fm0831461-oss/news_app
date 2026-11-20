class AuthModel3 {
  final bool status;
  final String title;

  new({required this.status, required this.title});
  factory AuthModel3.fromjson(Map<String, dynamic> json) {
    return AuthModel3(status: json["status"], title: json["title"]);
  }
}
