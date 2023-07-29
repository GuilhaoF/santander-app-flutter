

import 'account.dart';
import 'card.dart';
import 'feature.dart';
import 'news.dart';

class UserModel {
  int? id;
  String? name;
  Account? account;
  CreditCard? card;
  List<Feature>? features;
  List<News>? news;

  UserModel({
    this.id,
    this.name,
    this.account,
    this.card,
    this.features,
    this.news,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        account: json['account'] == null
            ? null
            : Account.fromJson(json['account'] as Map<String, dynamic>),
        card: json['card'] == null
            ? null
            : CreditCard.fromJson(json['card'] as Map<String, dynamic>),
        features: (json['features'] as List<dynamic>?)
            ?.map((e) => Feature.fromJson(e as Map<String, dynamic>))
            .toList(),
        news: (json['news'] as List<dynamic>?)
            ?.map((e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'account': account?.toJson(),
        'card': card?.toJson(),
        'features': features?.map((e) => e.toJson()).toList(),
        'news': news?.map((e) => e.toJson()).toList(),
      };
}
