

import 'dart:convert';

class RequestPostVehicleEntity {

  final String? name;
  final String? type;
  final double? fullValue;
  final String? manager;


  RequestPostVehicleEntity(this.name, this.type, this.fullValue, this.manager);

  factory RequestPostVehicleEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostVehicleEntity(
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

