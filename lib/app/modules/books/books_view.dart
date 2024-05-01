import 'package:book_store/app/modules/books/books_controller.dart';
import 'package:book_store/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'book_card.dart';

class BooksView extends StatelessWidget {
  final controller = Get.put(getIt<BooksController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];
            return BookCard(
              // Use the BookCard widget
              book: book,
              onTap: () => controller.onEditBook(context, book, book.id),
              onDelete: () =>
                  controller.onOpenDeleteBookDialog(context, book.id),
              onUpdate: () => controller.onEditBook(context, book, book.id),
              onUpdate2: () => controller.goToUpdateBook(book.id),
              onUpdate3: () => controller.onEditBook3(context, book, book.id),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToCreateBook(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
