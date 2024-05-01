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
      // Do something after adding book, if needed
    });
  }



  void _editBook(BuildContext context, Book book, String id) {

    // logic continue
    final titleController = TextEditingController(text: book.title);
    final imageUrlController = TextEditingController(text: book.imageUrl);
    final descriptionController = TextEditingController(text: book.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Book'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: const InputDecoration(labelText: 'Image URL'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.updateBook(
                  id,
                  Book(
                    title: titleController.text,
                    imageUrl: imageUrlController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _editBook3(BuildContext context, Book book, String id) {
    TextEditingController titleController =
        TextEditingController(text: book.title);
    TextEditingController imageUrlController =
        TextEditingController(text: book.imageUrl);
    TextEditingController descriptionController =
        TextEditingController(text: book.description);
    onOpenModal(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Update Book'),
            const SizedBox(height: 16.0),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                // Update book and close modal
                controller.updateBook(
                  id,
                  Book(
                    title: titleController.text,
                    imageUrl: imageUrlController.text,
                    description: descriptionController.text,
                  ),
                );
                await onCloseOverlays(closeOverlays: true);

                Get.back();
                // Close the modal
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    ));
  }


  Future _deleteBook(BuildContext context, String id) async {
    onOpenDialog(AppDialog(
      title: 'Confirm Delete',
      message: 'Are you sure you want to delete this book?',
      content: Row(
        children: [

        ],
      ),
    ));
    return;
    final result = await Get.defaultDialog<String?>(
      title: 'Confirm Delete',
      content: const Text('Are you sure you want to delete this book?'),
      textConfirm: 'Delete',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        controller.onDeleteBook(id);
        await onCloseOverlays(closeOverlays: true);

        Get.snackbar(
          'Success',
          'Book deleted successfully',
          backgroundColor: Colors.green, // Set background color
          colorText: Colors.white, // Set text color
          duration: const Duration(seconds: 4),
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      textCancel: 'Cancel',
      onCancel: () {
        Get.back(); // Close the dialog
      },
    );

    print(result);
  }
}
