import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  bool isLogin = false;
  String email = '';
  String account = '';
  String displayName = '';
  String telephone = '';

  LoginModel({
    this.isLogin = false,
    this.email = '',
    this.account = '',
    this.displayName = '',
    this.telephone = '',
  });

  @override
  List<Object> get props => [
        isLogin,
        email,
        account,
        displayName,
        telephone,
      ];

  LoginModel.fromJson(Map<String, dynamic> json) {
    isLogin = json['isLogin'] ?? false;
    email = json['email'] ?? "";
    account = json['account'] ?? "";
    displayName = json['displayName'] ?? "";
    telephone = json['telephone'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLogin'] = this.isLogin;
    data['email'] = this.email;
    data['account'] = this.account;
    data['displayName'] = this.displayName;
    data['telephone'] = this.telephone;
    return data;
  }
}
