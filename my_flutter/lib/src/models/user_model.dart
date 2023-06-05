class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  String? passwordConfirm;
  String? role;
  String? image;

  UserModel(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.passwordConfirm,
        this.role,
        this.image});

 UserModel.empty();

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['passwordConfirm'] = passwordConfirm;
    data['role'] = role;
    data['image'] = image;
    return data;
  }

}