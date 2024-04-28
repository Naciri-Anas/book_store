import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class BooksController extends GetxController {
  final BooksService booksService;

  BooksController(this.booksService);

  List<Book> get books => booksService.books;

  void addBook(Book book) {
    booksService.add(book);
  }

  void updateBook(int index, Book book) {
    booksService.update(index, book);
  }

  void onDeleteBook(int index) {
    booksService.delete(index);
  }

  goToCreateBook() {
    Get.toNamed(Routes.CU_BOOK);
  }

  goToUpdateBook(String id) {
    Get.toNamed(Routes.CU_BOOK, parameters: {
      'id': id,
    });
  }
}
