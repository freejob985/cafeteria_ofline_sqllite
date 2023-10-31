class Item {
  final int? id;
  final String item;
  final String price;

  Item({this.id, required this.item, required this.price});

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json['id'],
        item: json['item'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'item': item,
      'price': price,
    };
  }
}
