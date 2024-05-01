import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/modules/books/books_controller.dart';
import 'package:book_store/app/modules/cu_book/views/cu_book_view.dart';
import 'package:book_store/app/shared/widgets/app_dialog.dart';
import 'package:book_store/app/shared/widgets/app_show_overlay.dart';
import 'package:book_store/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_book.dart';
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
              onTap: () => _editBook(context, book, book.id),
              onDelete: () => _deleteBook(context, book.id),
              onUpdate: () => _editBook(context, book, book.id),
              onUpdate3: () => _editBook3(context, book, book.id),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addBook(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addBook(BuildContext context) {
    Get.to(AddBookView())?.then((value) {
    });
  }

  void _editBook(BuildContext context, Book book, String id) {
    controller.editBook(context, book, id);
  }

  void _editBook3(BuildContext context, Book book, String id) {
    controller.editBook3(context, book, id);
  }

  Future<void> _deleteBook(BuildContext context, String id) async {
    final result = await onOpenDialog(
      AppDialog(
        title: 'Confirm Delete',
        message: 'Are you sure you want to delete this book?',
        content: Column(
          children: [
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.back(result: 'Delete'); 
              },
              child: Text('Delete'), 
            ),
            SizedBox(height: 16), 
            TextButton(
              onPressed: () {
                Get.back(result: 'Cancel'); 
              },
              child: Text('Cancel'), 
            ),
          ],
        ),
      ),
    );

    if (result == 'Delete') {
      
      controller.onDeleteBook(id);
      await onCloseOverlays(closeOverlays: true);
    } else {
    }
  }
}
