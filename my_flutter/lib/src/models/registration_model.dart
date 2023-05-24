class RegistrationModel {
  String? username;
  String? email;
  String? password;
  String? passwordConfirm;

  RegistrationModel(
      {this.username, this.email, this.password, this.passwordConfirm});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    passwordConfirm = json['passwordConfirm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['passwordConfirm'] = this.passwordConfirm;
    return data;
  }
}