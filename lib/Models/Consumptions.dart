class Consumptions {
  final int? id;
  final String consumption;
  final String price;

  Consumptions({this.id, required this.consumption, required this.price});

  factory Consumptions.fromMap(Map<String, dynamic> json) => Consumptions(
        id: json['id'],
        consumption: json['consumption'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'consumption': consumption,
      'price': price,
    };
  }
}
