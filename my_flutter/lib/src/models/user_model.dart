class UserModel {
  int? id;
  String? username;
  String? email;
  String? password;
  String? passwordConfirm;
  String? role;
  List<String>? image;

  UserModel(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.passwordConfirm,
        this.role,
        this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
    role = json['role'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['passwordConfirm'] = this.passwordConfirm;
    data['role'] = this.role;
    data['image'] = this.image;
    return data;
  }
}