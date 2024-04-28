import 'package:book_store/app/data/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cu_book_controller.dart';

class CuBookView extends StatelessWidget {
  final Book book;
  final TextEditingController titleController;
  final TextEditingController imageUrlController;
  final TextEditingController descriptionController;
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final CuBookController controller = Get.find<CuBookController>();

  CuBookView({required this.book})
      : titleController = TextEditingController(text: book.title),
        imageUrlController = TextEditingController(text: book.imageUrl),
        descriptionController = TextEditingController(text: book.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update 2'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  // You can add more validation for URL format if needed
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Validate form
                  if (_formKey.currentState!.validate()) {
                    // If form is valid, update book using CuBookController
                    controller.updateBook(
                        book.id,
                        Book(
                          id: book.id,
                          title: titleController.text,
                          imageUrl: imageUrlController.text,
                          description: descriptionController.text,
                        ));

                    Get.back();

                    Get.snackbar(
                      'Success',
                      'Book updated successfully',
                      duration: Duration(seconds: 4),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: Text('Update Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
