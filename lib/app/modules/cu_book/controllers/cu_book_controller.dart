import 'dart:async';

import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/services/books_service.dart';
import 'package:book_store/app/shared/widgets/app_snackbar.dart';
import 'package:book_store/core/extensions/get_ext.dart';
import 'package:book_store/core/loading/loading_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CuBookController extends GetxController {
  List<Book> get books => booksService.books;
  final BooksService booksService;

  final titleController = TextEditingController();
  final imageUrlController = TextEditingController();
  final descriptionController = TextEditingController();

  final messageState = Rx<LoadingState?>(null);
  StreamSubscription? messageStateSub;

  final formKey = GlobalKey<FormState>(); // Key for form validation

  Book? book;

  CuBookController(this.booksService);

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

  init(String? id) {
    if (id != null) {
      book = books.firstWhereOrNull((element) => element.id == id);
      if (book != null) _applyDataOnUi(book!);
    }
  }

  onUpdateBook() {
    // Validate form
    if (formKey.currentState!.validate()) {
      messageState.value = const LOADING();
      // If form is valid, update book using CuBookController
      booksService.update(
          book!.id,
          Book(
            title: titleController.text,
            imageUrl: imageUrlController.text,
            description: descriptionController.text,
          ));

      Get.pop();

      messageState.value = const LOADED(message: 'Book updated successfully');
    }
  }

  onAddBook() {
    if (formKey.currentState!.validate()) {
      messageState.value = const LOADING();
      // If form is valid, add book
      booksService.add(
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

  _applyDataOnUi(Book book) {
    titleController.text = book.title;
    imageUrlController.text = book.imageUrl;
    descriptionController.text = book.description;
  }
}
