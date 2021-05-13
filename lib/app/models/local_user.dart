

class LocalUser {
  static const ADMIN = "ADMIN"; //adminiastror
  static const USER = "USER"; //usuario simples

  static const FEMININO = "F";
  static const MASCULINO = "M";

  static const SEDENTRARIO = "S";
  static const EXERCICIO = "E";

  static const PERDERPESO = "PP";
  static const GANHARPESO = "GP";

  String uuid;
  String nome;
  String email;
  String dataNascimento;
  String sexo;
  String altura;
  String peso;
  String praticaSport;
  String ganharPeso;
  String imageB64;
  String infoImc;
  String formula;
  String totalCal;

  LocalUser(
      {this.uuid,
      this.nome,
      this.email,this.totalCal,
      this.dataNascimento,
      this.sexo,
      this.altura,
      this.peso,
      this.infoImc,this.formula,
      this.praticaSport,
      this.ganharPeso,
      this.imageB64});

  factory LocalUser.fromMap(dynamic map) {
    if (null == map) return null;

    return LocalUser(
      uuid: map['uuid']?.toString(),
      nome: map['nome']?.toString(),
      email: map['email']?.toString(),
      dataNascimento: map['dataNascimento']?.toString(),
      sexo: map['sexo']?.toString(),
      altura: map['altura']?.toString(),
      peso: map['peso']?.toString(),
      infoImc: map['infoImc']?.toString(),
      praticaSport: map['praticaSport']?.toString(),
      ganharPeso: map['ganharPeso']?.toString(),
      imageB64: map['imageB64']?.toString(),
      formula: map['formula']?.toString() ?? "" ,
      totalCal: map['totalCal']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid ,
      'nome': nome,
      'email': email,
      'dataNascimento': dataNascimento,
      'sexo': sexo,
      'altura': altura,
      'peso': peso,
      'praticaSport': praticaSport,
      'ganharPeso': ganharPeso,
      'imageB64': imageB64,
      'infoImc': infoImc,
      'totalCal':totalCal
    };
  }
}
