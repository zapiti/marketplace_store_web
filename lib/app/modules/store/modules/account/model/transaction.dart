
class Transaction {
  final String id;
  final String description;
  final double value;
  Transaction({
    required this.id,
    required this.description,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'value': value,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      description: map['description'],
      value:double.tryParse(map['value']) ?? 0.0 ,
    );
  }
}
