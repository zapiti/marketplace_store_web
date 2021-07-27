class CurrentUser {
  String? sub;
  String? username;
  String? profile;
  Establishment? establishment;
  Client? client;

  String? iat;
  String? exp;
  static var USERLOG = "USERLOG";




  CurrentUser(
      {this.sub,
      this.username,
      this.profile,
      this.establishment,this.client,
      this.iat,
      this.exp});

  Map<String, dynamic> toMap() {
    return {
      'sub': sub,
      'username': username,
      'profile': profile,
      'establishment': establishment?.toMap(),
      'client' : client?.toMap(),
      'iat': iat,
      'exp': exp,
    };
  }

  factory CurrentUser.fromMap(dynamic map) {
    return CurrentUser(
      sub: map['sub']?.toString(),
      username: map['username']?.toString(),
      profile: map['profile']?.toString(),
      establishment:map['establishment'] == null ? null : Establishment.fromMap(map['establishment']),
      client:map['client'] == null ? null :  Client.fromMap(map['client']),
      iat: map['iat']?.toString(),
      exp: map['exp']?.toString(),
    );
  }
}

class Client {
  String? id;
  String? name;
  String? cpf;
  String? wallet;
  String? email;
  String? phone;
  String? firstAccess;
  String? image;
  dynamic user;
  dynamic addresses;
  String? createdAt;
  String? updatedAt;


  Client({
      this.id,
      this.name,
      this.cpf,
      this.wallet,
      this.email,
      this.phone,
      this.firstAccess,
      this.image,
      this.user,
      this.addresses,
      this.createdAt,
      this.updatedAt});

  factory Client.fromMap(dynamic map) {
    var temp;
    return Client(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
      cpf: map['cpf']?.toString(),
      wallet: map['wallet']?.toString(),
      email: map['email']?.toString(),
      phone: map['phone']?.toString(),
      firstAccess: map['firstAccess']?.toString(),
      image: map['image']?.toString(),
      user: map['user'],
      addresses: map['addresses'],
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cpf': cpf,
      'wallet': wallet,
      'email': email,
      'phone': phone,
      'firstAccess': firstAccess,
      'image': image,
      'user': user?.toMap(),
      'addresses': addresses?.toMap(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

class Establishment {
  String? id;
  String? cnpj;
  String? companyName;
  double? wallet;
  String? email;
  String? phone;
  String? responsible;
  String? description;
  String? status;
  String? type;
  String? preparationTime;
  double? deliveryValue;
  String? rank;
  String? image;
  String? coverImage;
  String? createdAt;
  String? updatedAt;

  Establishment(
      {this.id,
      this.cnpj,
      this.companyName,
      this.wallet,
      this.email,
      this.phone,
      this.responsible,
      this.description,
      this.status,
      this.type,
      this.preparationTime,
      this.deliveryValue,
      this.rank,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.coverImage});

  factory Establishment.fromMap(dynamic map) {
    var temp;
    return Establishment(
      id: map['id']?.toString(),
      cnpj: map['cnpj']?.toString(),
      companyName: map['companyName']?.toString(),
      wallet: null == (temp = map['wallet'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      email: map['email']?.toString(),
      phone: map['phone']?.toString(),
      responsible: map['responsible']?.toString(),
      description: map['description']?.toString(),
      status: map['status']?.toString(),
      type: map['type']?.toString(),
      preparationTime: map['preparationTime']?.toString(),
      deliveryValue: null == (temp = map['deliveryValue'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      rank: map['rank']?.toString(),
      image: map['image']?.toString(),
      coverImage: map['image']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cnpj': cnpj,
      'companyName': companyName,
      'wallet': wallet,
      'email': email,
      'phone': phone,
      'responsible': responsible,
      'description': description,
      'status': status,
      'type': type,
      'preparationTime': preparationTime,
      'deliveryValue': deliveryValue,
      'rank': rank,
      'image': image,
      'coverImage': coverImage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
