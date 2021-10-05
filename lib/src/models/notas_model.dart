class notasModel {
  int? id;
  String? titulo;
  String? detalle;

  notasModel({this.id, this.titulo, this.detalle});

  //Map -> Object
  factory notasModel.fromMap(Map<String, dynamic> map) {
    return notasModel(
        id: map['id'], titulo: map['titulo'], detalle: map['detalle']);
  }

  //Object -> Map
  Map<String, dynamic> toMap() {
    return {'id': id, 'titulo': titulo, 'detalle': detalle};
  }
}
