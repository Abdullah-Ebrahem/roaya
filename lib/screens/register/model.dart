class RegisterModel {
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String createdAt;
  late final String updatedAt;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
