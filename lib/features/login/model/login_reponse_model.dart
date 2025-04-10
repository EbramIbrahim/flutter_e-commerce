class AuthResponseModel {
  String? token;
  AuthResponseModel({this.token});

  AuthResponseModel.fromMap(Map<String, dynamic> map) {
    token = map['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
