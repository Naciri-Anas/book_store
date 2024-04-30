import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CuBookController extends GetxController {
  List<Book> get books => booksService.books;
  final BooksService booksService;

  CuBookController(this.booksService);

  // Update book based on its ID
  void updateBook(String id, Book book) {
    final index = books.indexWhere((element) => element.id == id);
    if (index == -1) return;

    books[index] = book;
    booksService.books.refresh();
  }
}
