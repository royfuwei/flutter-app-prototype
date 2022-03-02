class LoginStatusModel {
  bool isLogin = false;
  String email = '';
  String account = '';
  String displayName = '';
  String password = '';
  String telephone = '';

  LoginStatusModel({
    this.isLogin = false,
    this.email = '',
    this.account = '',
    this.displayName = '',
    this.password = '',
    this.telephone = '',
  });
  // LoginStatusModel();

  LoginStatusModel.fromJson(Map<String, dynamic> json) {
    isLogin = json['isLogin'] ?? false;
    email = json['email'] ?? "";
    account = json['account'] ?? "";
    displayName = json['displayName'] ?? "";
    password = json['password'] ?? "";
    telephone = json['telephone'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLogin'] = this.isLogin;
    data['email'] = this.email;
    data['account'] = this.account;
    data['displayName'] = this.displayName;
    data['password'] = this.password;
    data['telephone'] = this.telephone;
    return data;
  }
}
