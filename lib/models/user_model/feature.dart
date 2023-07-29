class Feature {
  int? id;
  String? icon;
  String? description;

  Feature({this.id, this.icon, this.description});

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
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
