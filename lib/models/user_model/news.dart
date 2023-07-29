class News {
  int? id;
  String? icon;
  String? description;

  News({this.id, this.icon, this.description});

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'] as int?,
        icon: json['icon'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'description': description,
      };
}
