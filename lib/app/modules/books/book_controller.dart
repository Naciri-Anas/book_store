import 'package:book_store/app/data/book_model.dart';
import 'package:get/get.dart';


class BookController extends GetxController {
  var books = <Book>[].obs;

  void addBook(Book book) {
    books.add(book);
  }

  void updateBook(int index, Book book) {
    books[index] = book;
  }

  void deleteBook(int index) {
    books.removeAt(index);
  }
}