import 'package:get/get.dart';

import '../modules/books/books_view.dart';
import '../modules/cu_book/views/cu_book_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOOKS;

  static final routes = [
    GetPage(
      name: _Paths.BOOKS,
      page: () => BooksView(),
    ),
    GetPage(
      name: _Paths.CU_BOOK,
      // ignore: null_check_always_fails
      page: () => CuBookView(book: null!,),
    ),
  ];
}
