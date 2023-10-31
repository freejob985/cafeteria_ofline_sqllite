// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cat {
  final int? id;
  final String Category;
  final String price;
  final String ranking;
  final String ty;
  Cat({
    this.id,
    required this.Category,
    required this.price,
    required this.ranking,
    required this.ty,
  });

  factory Cat.fromMap(Map<String, dynamic> json) => Cat(
        id: json['id'],
        Category: json['Category'],
        price: json['price'],
        ranking: json['ranking'],
        ty: json['ty'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Category': Category,
      'price': price,
      'ranking': ranking,
      'ty': ty,
    };
  }
}
