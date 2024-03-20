import 'package:book_store/app/modules/books/book_controller.dart';
import 'package:book_store/app/modules/books/book_list_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  Get.put(BookController());
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
      home: BookListView(),
      initialBinding: BindingsBuilder(() {
        Get.put(BookController());
      }),
    );
  }
}
