class UserModel {
  final String userName;
  final String firstName;
  final String lastName;
  final String password;
  final int id;
  UserModel({
    required this.firstName,
    required this.id,
    required this.lastName,
    required this.password,
    required this.userName,
  });
  factory UserModel.fromMap(Map map) {
    return UserModel(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_ame'],
      password: map['password'],
      userName: map['username'],
    );
  }
}
