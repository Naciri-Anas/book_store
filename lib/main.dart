import 'package:book_store/app/modules/books/books_controller.dart';
import 'package:book_store/app/modules/books/books_view.dart';
import 'package:book_store/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

main() async {
  await configureDependencies(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BooksView(),
    );
  }
}
