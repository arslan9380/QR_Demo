class UserModel {
  String userId;
  String name;
  String email;
  String password;
  dynamic doseDate;
  String vaccineType;

  UserModel(
      {this.userId,
      this.name,
      this.email,
      this.password,
      this.doseDate,
      this.vaccineType});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      userId: map['userId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      doseDate: map['doseDate'],
      vaccineType: map['vaccineType'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'doseDate': this.doseDate,
      'vaccineType': this.vaccineType,
    } as Map<String, dynamic>;
  }
}
