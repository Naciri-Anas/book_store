import 'package:book_store/app/data/book_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BooksService {
  final books = RxList<Book>();

  void add(Book book) {
    books.add(book);
  }

  void update(int index, Book book) {
    books[index] = book;
  }

  void delete(int index) {
    books.removeAt(index);
  }
}
