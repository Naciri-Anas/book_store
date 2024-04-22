import 'package:book_store/app/data/book_model.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BooksService {
  final books = RxList<Book>();

  void add(Book book) {
    // Call API
    // await
    // result book created


    books.add(book);
  }
}
