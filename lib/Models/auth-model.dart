class AuthModel {
  final String message;
  final bool status;

  AuthModel({required this.message, required this.status});
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(message: json["message"], status: json["status"]);
  }
}
