class userModel {
  int? id;
  String? nombre;
  String? apellidoP;
  String? apellidoM;
  String? telefono;
  String? email;
  String? avatar;

  userModel(
      {this.id,
      this.nombre,
      this.apellidoP,
      this.apellidoM,
      this.telefono,
      this.email,
      this.avatar});
//pasar de mapa (que viene de la base de dato) a objeto tipo userModel
  factory userModel.fromMap(Map<String, dynamic> map) {
    return userModel(
        id: map['id'],
        nombre: map['nombre'],
        apellidoP: map['apellidoP'],
        apellidoM: map['apellidoM'],
        telefono: map['telefono'],
        email: map['email'],
        avatar: map['evatar']);
  }
  //convertir de userModel a mapa para insertar en la BD
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellidoP': apellidoP,
      'apellidoM': apellidoM,
      'telefono': telefono,
      'email': email,
      'avatar': avatar
    };
  }
}
