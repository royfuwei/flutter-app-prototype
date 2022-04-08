class PickerValueEntity {
  String? text = '請選擇';
  dynamic value;

  PickerValueEntity({
    this.text,
    this.value,
  });

  PickerValueEntity.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? "";
    value = json['value'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    return data;
  }
}
