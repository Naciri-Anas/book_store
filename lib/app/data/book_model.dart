import 'package:uuid/uuid.dart';

class Book {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : id = const Uuid().v4();
}
