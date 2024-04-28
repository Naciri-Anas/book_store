import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/services/books_service.dart';

@injectable
class CuBookController extends GetxController {
  List<Book> get books => booksService.books;
  final BooksService booksService;

  CuBookController(this.booksService);

  // Update book based on its ID
  void updateBook(int index, Book book) {
    if (index >= 0 && index < booksService.books.length) {
      booksService.books[index] = book;
    } else {
      print('Invalid index: $index');
    }
  }
}
