class CitizenModel {
  CitizenModel({
    required this.nombres,
    required this.dni,
    required this.telefono,
  });

  String nombres;
  String dni;
  String telefono;

  factory CitizenModel.fromJson(Map<String, dynamic> json) => CitizenModel(
        nombres: json["nombres"],
        dni: json["dni"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "nombres": nombres,
        "dni": dni,
        "telefono": telefono,
      };
}
