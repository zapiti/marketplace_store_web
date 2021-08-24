class Product {
  String? id;
  String? name;
  double? value;
  double? promotionalValue;
  String? category;
  String? sector;
  String? description;
  String? quantityType;
  double? stock;
  String? specification;
  double? qtdMin;
  double? qtdMax;
  String? barCode;
  String? image;

  int? quantity;

  Product({
    this.id,
    this.name,
    this.value,
    this.promotionalValue,
    this.category,
    this.sector,
    this.description,
    this.quantityType,
    this.stock,
    this.quantity,
    this.specification,
    this.qtdMin,
    this.qtdMax,
    this.barCode,
    this.image,
  });

  static Product? fromMap(dynamic map) {
    if (null == map) return null;
    var temp;
    return Product(
      id: map['id']?.toString(),
      name: map['name']?.toString(),
      value: null == (temp = map['value'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      promotionalValue: null == (temp = map['promotionalValue'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      category: map['category']?.toString(),
      sector: map['sector']?.toString(),
      description: map['description']?.toString(),
      quantityType: map['quantityType']?.toString(),
      stock: null == (temp = map['stock'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      specification: map['specification']?.toString(),
      qtdMin: null == (temp = map['qtdMin'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      qtdMax: null == (temp = map['qtdMax'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      barCode: map['barCode']?.toString(),
      image: map['image']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return id == null
        ? {
            'name': name,
            'value': value,
            'promotionalValue': promotionalValue,
            'category': category,
            'sector': sector,
            'description': description,
            'quantityType': quantityType ?? 'UNIDADE',
            'stock': stock,
            'specification': specification,
            'qtdMin': qtdMin,
            'qtdMax': qtdMax,
            'barCode': barCode,
            'image': image,
          }
        : {
            'id': id,
            'status': 'ATIVO',
            'name': name,
            'value': value,
            'promotionalValue': promotionalValue,
            'category': category,
            'sector': sector,
            'description': description,
            'quantityType': quantityType ?? 'UNIDADE',
            'stock': stock,
            'specification': specification,
            'qtdMin': qtdMin,
            'qtdMax': qtdMax,
            'barCode': barCode,
            'image': image,
          };
  }

  @override
  String toString() {
    return 'Product{id: $id, name: $name, value: $value, promotionalValue: $promotionalValue, category: $category, sector: $sector, description: $description, quantityType: $quantityType, stock: $stock, specification: $specification, qtdMin: $qtdMin, qtdMax: $qtdMax, barCode: $barCode, image: ${image?.isEmpty}======\n, quantity: $quantity}';
  }
}
