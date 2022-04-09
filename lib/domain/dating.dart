class DatingItemEntity {
  String? id;
  String? userId;
  String? username;
  String? title;
  DateTime? startTime;
  DateTime? endTime;
  String? status;
  String? signupCount;
  int? payment;

  DatingItemEntity({
    this.id,
    this.userId,
    this.username,
    this.title,
    this.startTime,
    this.endTime,
    this.status,
    this.signupCount,
    this.payment,
  });

  /* DatingItemEntity.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? "";
    username = json['username'] ?? "";
    value = json['value'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['username'] = this.username;
    return data;
  } */
}
