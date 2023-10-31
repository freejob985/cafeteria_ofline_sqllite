class Worker {
  final int? id;
  final String name;
  final String price;

  Worker({this.id, required this.name, required this.price});

  factory Worker.fromMap(Map<String, dynamic> json) => Worker(
        id: json['id'],
        name: json['name'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
