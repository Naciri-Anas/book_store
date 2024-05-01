import 'package:book_store/app/data/book_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BooksService {
  final books = RxList<Book>();

  void add(Book book) {
    books.add(book);
  }

  void update(String id, Book book) {
    final index = books.indexWhere((element) => element.id == id);
    if (index == -1) return;
    books[index] = book;
    books.refresh();
  }

  void delete(String id) {
    final index = books.indexWhere((element) => element.id == id);
    if (index == -1) return;
    books.removeAt(index);
    books.refresh();
  }
}
