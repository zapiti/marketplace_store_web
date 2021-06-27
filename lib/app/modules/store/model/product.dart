class Product {
  String? name;

  String? quantidade;

  String? categoria;

  String? imageUrl;

  double? valor;

  String? descricao;

  int? idShops;

  int? qtd;

  Product(
      {this.name = "Tutu de feijão com bacon e cebolinha",
      this.quantidade = "500 gramas",
      this.categoria = "Alimento",
      this.imageUrl =
          "https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      this.valor = 50.0,
      this.descricao =
          "Eis um belo tutu de feijão. Leva bacon, linguiça calabresa, ovos cozidos e pimenta biquinho. Um acompanhamento bem brasileiro, saboroso",
      this.idShops = 1,
      this.qtd = 0});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantidade': quantidade,
      'categoria': categoria,
      'imageUrl': imageUrl,
      'valor': valor,
      'descricao': descricao,
      'idShops': idShops,
      'qtd': qtd,
    };
  }

  static Product fromMap(dynamic map) {

    var temp;
    return Product(
      name: map['name']?.toString(),
      quantidade: map['quantidade']?.toString(),
      categoria: map['categoria']?.toString(),
      imageUrl: map['imageUrl']?.toString(),
      valor: null == (temp = map['valor'])
          ? null
          : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      descricao: map['descricao']?.toString(),
      idShops: null == (temp = map['idShops'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
      qtd: null == (temp = map['qtd'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }


}
