




class RequestPostOwnerEntity {

  final String? name;
  final String? cellphone;


  RequestPostOwnerEntity(this.name, this.cellphone);

  factory RequestPostOwnerEntity.fromJson(Map<String, dynamic> json) {

    return RequestPostOwnerEntity(
        json['name'],
        json['cellphone']);
  }


}