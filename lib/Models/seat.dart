class Seat {
  final int? id;
  final String Seatx;
  final String Varieties;
  final String Quantity;
  final String amount;
  final String price;
  final String check;
  final String computer;
  final String reservation;

  Seat(
      {this.id,
      required this.Seatx,
      required this.Varieties,
      required this.Quantity,
      required this.amount,
      required this.price,
      required this.check,
      required this.computer,
      required this.reservation});

  factory Seat.fromMap(Map<String, dynamic> json) => Seat(
        id: json['id'],
        Seatx: json['Seatx'],
        Varieties: json['Varieties'],
        Quantity: json['Quantity'],
        amount: json['amount'],
        price: json['price'],
        check: json['check'],
        computer: json['computer'],
        reservation: json['reservation'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Seatx': Seatx,
      'Varieties': Varieties,
      'Quantity': Quantity,
      'amount': amount,
      'price': price,
      'check': check,
      'computer': computer,
      'reservation': reservation,
    };
  }
}
