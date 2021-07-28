


class AccountInfo {

  String? id;
  String? cpfCnpj;
  String? bank;
  String? account;
  String? agency;

  AccountInfo({this.cpfCnpj, this.bank, this.account, this.agency,this.id});

  Map<String, dynamic> toMap() {
    return id == null ?  {
      'cpfCnpj': cpfCnpj,
      'bank': bank,
      'account': account,
      'agency': agency,
    }:{
      'id':id,
      'cpfCnpj': cpfCnpj,
      'bank': bank,
      'account': account,
      'agency': agency,
    };
  }

  factory AccountInfo.fromMap(dynamic map) {

    return AccountInfo(
        id: map['id']?.toString(),
      cpfCnpj: map['cpfCnpj']?.toString(),
      bank: map['bank']?.toString(),
      account: map['account']?.toString(),
      agency: map['agency']?.toString(),
    );
  }
}