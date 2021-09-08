

class RequestPostAssetEntity {

  final String? name;
  final String? type;
  final double? fullValue;
  final String? manager;


  RequestPostAssetEntity(this.name, this.type, this.fullValue, this.manager);

  factory RequestPostAssetEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostAssetEntity(
        json['name'],
        json['type'],
        json['fullValue'],
        json['manager']);
  }


}

