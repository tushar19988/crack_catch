/// name : "name"
/// email : "test@gmail.com"
/// uid : "12"
/// locationid : "12"

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.uid,
    this.locationid,
    this.password,
  });

  UserModel.fromJson(String mId, dynamic json) {
    print(">>>>>Location>>>> $mId");
    name = json['name'];
    email = json['email'];
    uid = mId;
    // uid = json['uid'];
    locationid = json['locationid'];
    password = json['password'];
  }
  String? name;
  String? email;
  String? uid;
  String? locationid;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['uid'] = uid;
    map['locationid'] = locationid;
    map['password'] = password;
    return map;
  }
}
