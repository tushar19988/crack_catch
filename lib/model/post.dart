/// Status : true
/// data : "878e1a5bb9a54fdab24c2fd6d7326075"
/// Message : "Your Command Send Successfully"
class Data {
  Data({
    this.status,
    this.data,
    this.message,
  });

  Data.fromJson(dynamic json) {
    status = json['Status'];
    data = json['data'];
    message = json['Message'];
  }
  bool? status;
  String? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['data'] = data;
    map['Message'] = message;
    return map;
  }
}