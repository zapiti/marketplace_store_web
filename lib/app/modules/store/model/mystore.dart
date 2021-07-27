
import 'package:marketplace_store_web/app/models/address/address.dart';
import 'package:reactive_forms/reactive_forms.dart';


class MyStore {
  String? id;
  String? cnpj;
  String? companyName;
  String? email;
  String? password;
  String? phone;
  String? responsible;
  String? description;
  String? type;
  String? status;
  MyAddress? address;

  MyStore({this.id,
    this.cnpj,
    this.companyName,
    this.email,
    this.password,
    this.phone,
    this.responsible,
    this.description,
    this.type,
    this.address,
    this.status});

  static MyStore? fromMap(dynamic map) {

    if (null == map) return null;
    return MyStore(
      id: map['id']?.toString(),
      cnpj: map['cnpj']?.toString(),
      companyName: map['companyName']?.toString(),
      email: map['email']?.toString(),
      password: map['password']?.toString(),
      phone: map['phone']?.toString(),
      responsible: map['responsible']?.toString(),
      description: map['description']?.toString(),
      type: map['type']?.toString(),
      status: map['status']?.toString(),
      address: MyAddress.fromMap(map['address'] is Map ?  map['address'] : map),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cnpj': cnpj,
      'companyName': companyName,
      'email': email,
      'password': password,
      'phone': phone,
      'responsible': responsible,
      'description': description,
      'type': type,
      'address': address?.toMap(),
    };
  }

  Map<String, AbstractControl> toMapReact() {
    return {
      'id': FormControl<String>(value: id,),
      'cnpj': FormControl<String>(
          value: cnpj, validators: [Validators.required]),
      'companyName': FormControl<String>(
          value: companyName, validators: [Validators.required]),
      'email': FormControl<String>(
          value: email, validators: [Validators.required]),
      'password': FormControl<String>(
          value: password, validators: [Validators.required]),
      'phone': FormControl<String>(
          value: phone, validators: [Validators.required]),
      'responsible': FormControl<String>(
          value: responsible, validators: [Validators.required]),
      'description': FormControl<String>(
          value: description, validators: [Validators.required]),
      'type': FormControl<String>(
          value: type, validators: [Validators.required]),
      'zipCode': FormControl<String>(
          value: address?.zipCode, validators: [Validators.required]),
      'address': FormControl<String>(
          value: address?.address, validators: [Validators.required]),
      'number': FormControl<String>(
          value: address?.number, validators: [Validators.required]),
      'complement': FormControl<String>(
          value: address?.complement, validators: [Validators.required]),
      'neighborhood': FormControl<String>(
          value: address?.neighborhood, validators: [Validators.required]),
      'city': FormControl<String>(
          value: address?.city, validators: [Validators.required]),
      'state': FormControl<String>(
          value: address?.state, validators: [Validators.required]),
    };
  }
}
