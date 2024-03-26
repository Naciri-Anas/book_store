import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class BooksController extends GetxController {

  List<Book> get books => booksService.books;

  final BooksService booksService;

  BooksController(this.booksService);

  void addBook(Book book) {
    booksService.books.add(book);
  }

  void updateBook(int index, Book book) {
    booksService.books[index] = book;
  }

  void deleteBook(int index) {
    booksService.books.removeAt(index);
  }

}
