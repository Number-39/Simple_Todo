class UserModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String image;
  final String token;
  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.image,
      required this.token});

  factory UserModel.fromJson(jsonData) {
    return UserModel(
      id: jsonData['id'],
      username: jsonData['username'],
      email: jsonData['email'],
      firstName: jsonData['firstName'],
      lastName: jsonData['lastName'],
      image: jsonData['image'],
      token: jsonData['token'],
    );
  }
}
