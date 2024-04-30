import 'dart:async';

import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/routes/app_pages.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:book_store/app/shared/widgets/app_snackbar.dart';
import 'package:book_store/core/errors/message_types.dart';
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
  }

  List<Book> get books => booksService.books;

  void addBook(Book book) {
    booksService.add(book);
  }

  void updateBook(String id, Book book) {
    booksService.update(id, book);
  }

  void onDeleteBook(String id) {
    booksService.delete(id);
  }

  goToCreateBook() {
    Get.toNamed(Routes.CU_BOOK);
  }

  goToUpdateBook(String id) {
    Get.toNamed(Routes.CU_BOOK, parameters: {
      'id': id,
    });
  }

  onAddBook() async {
    if (formKey.currentState!.validate()) {
      messageState.value = const LOADING();
      // If form is valid, add book
      addBook(
        Book(
          title: titleController.text,
          imageUrl: imageUrlController.text,
          description: descriptionController.text,
        ),
      );

      Get.pop();
      messageState.value = const LOADED(message: 'Book added successfully');
    }
  }

}
