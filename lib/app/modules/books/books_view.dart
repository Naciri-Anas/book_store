import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/modules/books/books_controller.dart';
import 'package:book_store/app/modules/cu_book/views/cu_book_view.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/shared/widgets/app_show_overlay.dart';
import 'package:book_store/core/di/injection.dart';
import 'package:book_store/generated/locales.g.dart';
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
        title: Text('Book Store'),
      ),
      body: Obx(
        () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            Book book = controller.books[index];
            return BookCard(
              // Use the BookCard widget
              book: book,
              onTap: () => _editBook(context, book, index),
              onDelete: () => _deleteBook(context, index),
              onUpdate: () => _editBook(context, book, index),
              onUpdate3: () => _editBook3(context, book, index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addBook(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addBook(BuildContext context) {
    Get.to(AddBookView())?.then((value) {
      // Do something after adding book, if needed
    });
  }

  void _editBook(BuildContext context, Book book, int index) {
    TextEditingController titleController =
        TextEditingController(text: book.title);
    TextEditingController imageUrlController =
        TextEditingController(text: book.imageUrl);
    TextEditingController descriptionController =
        TextEditingController(text: book.description);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Book'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.updateBook(
                  index,
                  Book(
                    id: book.id,
                    title: titleController.text,
                    imageUrl: imageUrlController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _editBook3(BuildContext context, Book book, int index) {
    TextEditingController titleController =
        TextEditingController(text: book.title);
    TextEditingController imageUrlController =
        TextEditingController(text: book.imageUrl);
    TextEditingController descriptionController =
        TextEditingController(text: book.description);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Update Book'),
                SizedBox(height: 16.0),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    // Update book and close modal
                    controller.updateBook(
                      index,
                      Book(
                        id: book.id,
                        title: titleController.text,
                        imageUrl: imageUrlController.text,
                        description: descriptionController.text,
                      ),
                    );
                    await onCloseOverlays(closeOverlays: true);

                    Get.back();
                    // Close the modal
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPopupMenuButton(BuildContext context, Book book, int index) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'delete',
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
        PopupMenuItem(
          value: 'update',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Update'),
          ),
        ),
        PopupMenuItem(
          value: 'update2',
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Upadate2'),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'delete') {
          _deleteBook(context, index);
        } else if (value == 'update') {
          _editBook(context, book, index);
        } else if (value == 'update2') {
          Get.to(CuBookView(book: book));
        }
      },
    );
  }

  Future _deleteBook(BuildContext context, int index) async {
    final result = await Get.defaultDialog<String?>(
      title: 'Confirm Delete',
      content: const Text('Are you sure you want to delete this book?'),
      textConfirm: 'Delete',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        controller.onDeleteBook(index);
        await onCloseOverlays(closeOverlays: true);

        Get.snackbar(
          'Success',
          'Book deleted successfully',
          backgroundColor: Colors.green, // Set background color
          colorText: Colors.white, // Set text color
          duration: Duration(seconds: 4),
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
