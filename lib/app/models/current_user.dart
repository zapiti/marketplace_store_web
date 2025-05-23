class CurrentUser {
  String? sub;
  String? username;
  String? profile;
  Establishment? establishment;
  ClientUser? client;

  String? iat;
  String? exp;
  static var USERLOG = "USERLOG";

  CurrentUser(
      {this.sub,
      this.username,
      this.profile,
      this.establishment,
      this.client,
      this.iat,
      this.exp});

  Map<String,dynamic> toMap() {
    return {
      'sub': sub,
      'username': username,
      'profile': profile,
      'establishment': establishment?.toMap(),
      'client': client?.toMap(),
      'iat': iat,
      'exp': exp,
    };
  }

  factory CurrentUser.fromMap(dynamic map) {
    return CurrentUser(
      sub: map['sub']?.toString(),
      username: map['username']?.toString(),
      profile: map['profile']?.toString(),
      establishment: map['establishment'] == null
          ? null
          : Establishment.fromMap(map['establishment']),
      client: map['client'] == null ? null : ClientUser.fromMap(map['client']),
      iat: map['iat']?.toString(),
      exp: map['exp']?.toString(),
    );
  }
}

class ClientUser {
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

  ClientUser(
      {this.id,
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

  factory ClientUser.fromMap(dynamic map) {
    var temp;
    return ClientUser(
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

  Map<String,dynamic> toMap() {
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
  double distanceKm = 0;
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
  List<OperationHours>? operationHours;

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
      this.operationHours,
      this.updatedAt,
      this.coverImage,this.distanceKm = 0.0});

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'cnpj': cnpj,
      'distanceKm': distanceKm,
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
      'operationHours': operationHours?.map((e) => e.toMap()).toList(),
    };
  }

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
        distanceKm: null == (temp = map['distanceKm'])
            ? 0.0
            : (temp is num ? temp.toDouble() : double.tryParse(temp)) ?? 0.0,
      status: map['status']?.toString(),
      type: map['type']?.toString(),
      preparationTime: map['preparationTime']?.toString(),
      deliveryValue: null == (temp = map['deliveryValue'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      rank: map['rank']?.toString(),
      image: map['image']?.toString(),
      coverImage: map['coverImage']?.toString(),
      createdAt: map['createdAt']?.toString(),
      updatedAt: map['updatedAt']?.toString(),
      operationHours: null == (temp = map['operationHours'])
          ? []
          : (temp is List
              ? temp.map((map) => OperationHours.fromMap(map)!).toList()
              : []),
    );
  }
  toCreate() {
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
    };
  }
   toOppeningHours(){
     return  operationHours?.map((e) => e.toMap()).toList();
   }


  @override
  String toString() {
    return 'Establishment{id: $id\n,cnpj: $cnpj\n,companyName: $companyName\n,wallet: $wallet\n,email: $email\n,phone: $phone\n,responsible: $responsible\n,description: $description\n,status: $status\n,type: $type\n,preparationTime: $preparationTime\n,deliveryValue: $deliveryValue\n,rank: $rank\n,image: ${image != null ? 'existe' : null}\n,coverImage:  ${coverImage != null ? 'existe' : null},\n,createdAt: $createdAt\n,updatedAt: $updatedAt\n,operationHours: $operationHours}';
  }


}

class OperationHours {
  String? id;
  String? day;
  String? start;
  String? end;
  bool? isClosed;

  OperationHours(
      {required this.id,
      required this.day,
      required this.start,
      required this.end,
      required this.isClosed});

  static OperationHours? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return OperationHours(
      id: map['id']?.toString(),
      day: map['day']?.toString(),
      start: map['start']?.toString(),
      end: map['end']?.toString(),
      isClosed: null == (temp = map['isClosed'])
          ? null
          : (temp is bool
              ? temp
              : (temp is num
                  ? 0 != temp.toInt()
                  : ('true' == temp.toString()))),
    );

  }

  @override
  String toString() {
    return 'OperationHours{id: $id, day: $day, start: $start, end: $end, isClosed: $isClosed}';
  }

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'day': day,
      'start': start,
      'end': end,
      'isClosed': isClosed,
    };
  }
}
