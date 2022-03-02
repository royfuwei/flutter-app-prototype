class UserCreateModel {
  bool isCreateAccount = false;
  bool isCreateInfo = false;
  String email = '';
  String account = '';
  String displayName = '';
  String password = '';
  String telephone = '';

  UserCreateModel({
    this.isCreateAccount = false,
    this.isCreateInfo = false,
    this.email = '',
    this.account = '',
    this.displayName = '',
    this.password = '',
    this.telephone = '',
  });
  // UserCreateModel();

  UserCreateModel.fromJson(Map<String, dynamic> json) {
    isCreateAccount = json['isCreateAccount'] ?? false;
    isCreateInfo = json['isCreateInfo'] ?? false;
    email = json['email'] ?? "";
    account = json['account'] ?? "";
    displayName = json['displayName'] ?? "";
    password = json['password'] ?? "";
    telephone = json['telephone'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isCreateAccount'] = this.isCreateAccount;
    data['isCreateInfo'] = this.isCreateInfo;
    data['email'] = this.email;
    data['account'] = this.account;
    data['displayName'] = this.displayName;
    data['password'] = this.password;
    data['telephone'] = this.telephone;
    return data;
  }
}
