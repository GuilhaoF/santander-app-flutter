class CreditCard {
  int? id;
  String? number;
  double? limit;

  CreditCard({this.id, this.number, this.limit});

  factory CreditCard.fromJson(Map<String, dynamic> json) => CreditCard(
        id: json['id'] as int?,
        number: json['number'] as String?,
        limit: json['limit'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'limit': limit,
      };
}
