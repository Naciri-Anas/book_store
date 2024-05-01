import 'dart:async';

import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:book_store/app/shared/widgets/app_dialog.dart';
import 'package:book_store/app/shared/widgets/app_show_overlay.dart';
import 'package:book_store/app/shared/widgets/app_snackbar.dart';
import 'package:book_store/core/extensions/get_ext.dart';
import 'package:book_store/core/loading/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class BooksController extends GetxController {
  final BooksService booksService;

  final titleController = TextEditingController();
  final imageUrlController = TextEditingController();
  final descriptionController = TextEditingController();

  final messageState = Rx<LoadingState?>(null);
  StreamSubscription? messageStateSub;

  final formKey = GlobalKey<FormState>(); // Key for form validation

  BooksController(this.booksService);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    messageStateSub = AppSnackBar(loadingState: messageState).initListener();
  }

  @override
  void onClose() {
    messageStateSub?.cancel();
    super.onClose();

    String? name;
    //
    name = 'Amine';

    String name2 = name!;
  }

  List<Book> get books => booksService.books;

  void addBook(Book book) {
    booksService.add(book);
  }

  void onUpdateBook(String id, Book book) {
    booksService.update(id, book);
  }

  Future<void> onOpenDeleteBookDialog(BuildContext context, String id) async {
    onOpenDialog<bool>(
      AppDialog(
        title: 'Confirm Delete',
        message: 'Are you sure you want to delete this book?',
        content: Column(
          children: [
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Get.back(result: false);
                onDeleteBook(id);
                onCloseOverlays(closeOverlays: true);
              },
              child: const Text('Delete'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Get.back(result: 'Cancel');
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }

  void onDeleteBook(String id) async {
    try {
      messageState.value = const LOADING();

      booksService.delete(id);
      Get.pop();
      messageState.value = const LOADED(message: 'Book deleted successfully');
    } catch (e) {
      messageState.value = const ERROR(message: 'Failed to delete book');
    }
  }

  goToCreateBook() {
    Get.toNamed(
      Routes.CU_BOOK,
    );
  }

  goToUpdateBook(String id) {
    Get.toNamed(Routes.CU_BOOK, parameters: {
      'id': id,
    });
  }

  Future<void> onEditBook(BuildContext context, Book book, String id) async {
    // Logic for editing a book
    final titleController = TextEditingController(text: book.title);
    final imageUrlController = TextEditingController(text: book.imageUrl);
    final descriptionController = TextEditingController(text: book.description);

    onOpenDialog(AppDialog(
      title: 'Update Book',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: imageUrlController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 16),
              TextButton(
                onPressed: () {
                  onUpdateBook(
                    id,
                    Book(
                      title: titleController.text,
                      imageUrl: imageUrlController.text,
                      description: descriptionController.text,
                    ),
                  );
                  onCloseOverlays(closeDialog: true);
                },
                child: const Text('Update'),
              ),
            ],
          )
        ],
      ),
    ));
  }

  void onEditBook3(BuildContext context, Book book, String id) {
    TextEditingController titleController =
        TextEditingController(text: book.title);
    TextEditingController imageUrlController =
        TextEditingController(text: book.imageUrl);
    TextEditingController descriptionController =
        TextEditingController(text: book.description);
    onOpenModal(
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Update Book'),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  try {
                    onUpdateBook(
                      id,
                      Book(
                        title: titleController.text,
                        imageUrl: imageUrlController.text,
                        description: descriptionController.text,
                      ),
                    );

                    await onCloseOverlays(closeOverlays: true);
                    Get.back();
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Failed to update book',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
