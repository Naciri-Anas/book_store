import 'package:book_store/app/modules/books/books_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOOKS;

  static final routes = [
    GetPage(
      name: _Paths.BOOKS,
      page: () => BooksView(),
    ),
  ];
}
