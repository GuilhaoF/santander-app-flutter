class Account {
  int? id;
  String? number;
  String? agency;
  double? balance;
  double? limit;

  Account({this.id, this.number, this.agency, this.balance, this.limit});

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json['id'] as int?,
        number: json['number'] as String?,
        agency: json['agency'] as String?,
        balance: (json['balance'] as num?)?.toDouble(),
        limit: json['limit'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'agency': agency,
        'balance': balance,
        'limit': limit,
      };
}
