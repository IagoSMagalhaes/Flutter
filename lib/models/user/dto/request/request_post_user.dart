




import 'dart:convert';

class RequestPostUserEntity {

  final String? name;
  final String? cellphone;


  RequestPostUserEntity(this.name, this.cellphone);

  factory RequestPostUserEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostUserEntity(
        json['name'],
        json['cellphone']);
  }

  String toJson() {

    final Map<String, dynamic> assetMap = {'name': name, 'cellphone': cellphone};

    return jsonEncode(assetMap);
  }


}