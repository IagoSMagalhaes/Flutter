

import 'dart:convert';

class RequestPostImmobileEntity {

  final String? name;
  final String? type;
  final double? fullValue;
  final String? manager;


  RequestPostImmobileEntity(this.name, this.type, this.fullValue, this.manager);

  factory RequestPostImmobileEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostImmobileEntity(
        json['name'],
        json['type'],
        json['fullValue'],
        json['manager']);
  }

  String toJson() {
    final Map<String, dynamic> map = {
      'name': name,
      'type': type,
      'fullValue': fullValue,
      'manager': manager};

    return jsonEncode(map);
  }


}

