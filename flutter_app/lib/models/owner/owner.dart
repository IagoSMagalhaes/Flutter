class Owner {
  final int? id;
  final String name;
  final String cellphone;


  Owner(
    this.id,
    this.name,
    this.cellphone,
  );

  @override
  String toString() {
    return 'Owner{id: $id, name: $name, cellphone: $cellphone}';
  }
}



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





class ResponseOwnerEntity {

  final int? id;
  final String? name;
  final String? cellphone;

  ResponseOwnerEntity(this.id, this.name, this.cellphone);

  factory ResponseOwnerEntity.fromJson(Map<String, dynamic> json) {

    return ResponseOwnerEntity(
        json['id'],
        json['name'],
        json['cellphone']);
  }
}