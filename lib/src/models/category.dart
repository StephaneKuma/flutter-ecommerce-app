import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String picture;

  const Category({
    required this.name,
    required this.picture,
  });

  factory Category.fromMap({required Map<String, dynamic> map}) => Category(
        name: map['name']!,
        picture: map['picture']!,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'picture': picture,
      };

  @override
  List<Object?> get props => [
        name,
        picture,
      ];

  static List<Category> demoList = [
    const Category(
      name: 'Soft Drinks',
      picture:
          'https://images.unsplash.com/photo-1534057308991-b9b3a578f1b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/5lZhD2qQ2SE
    ),
    const Category(
      name: 'Smoothies',
      picture:
          'https://images.unsplash.com/photo-1502741224143-90386d7f8c82?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/m741tj4Cz7M
    ),
    const Category(
      name: 'Water',
      picture:
          'https://images.unsplash.com/photo-1559839914-17aae19cec71?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/7Zlds3gm7NU
    ),
  ];
}
