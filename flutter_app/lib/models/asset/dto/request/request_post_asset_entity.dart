

class RequestPostAssetEntity {

  final String? name;
  final double? fullValue;
  final String? manager;


  RequestPostAssetEntity(this.name, this.fullValue, this.manager);

  factory RequestPostAssetEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostAssetEntity(
        json['name'],
        json['fullValue'],
        json['manager']);
  }


}

