class UserModel {
  UserModel({
    this.nombre,
    this.apellido,
    this.id,
    this.nombreCompleto,
    required this.dni,
    required this.telefono,
    required this.direccion,
    this.password,
  });

  String? nombre;
  String? apellido;
  int? id;
  String? nombreCompleto;
  String dni;
  String telefono;
  String direccion;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nombre: json["nombre"],
        apellido: json["apellido"],
        id: json["id"],
        nombreCompleto: json["nombreCompleto"],
        dni: json["dni"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "id": id,
        "nombreCompleto": nombreCompleto,
        "dni": dni,
        "telefono": telefono,
        "direccion": direccion,
        "password": password,
      };
}
