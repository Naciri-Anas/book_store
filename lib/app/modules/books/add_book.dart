import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/modules/books/books_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBookView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final BooksController controller = Get.find<BooksController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
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
                    // If form is valid, add book
                    controller.addBook(
                      Book(
                        id: DateTime.now().toString(),
                        title: titleController.text,
                        imageUrl: imageUrlController.text,
                        description: descriptionController.text,
                      ),
                    );

                    Get.back();

                    Get.snackbar(
                      'Success',
                      'Book added successfully',
                      duration: Duration(seconds: 4),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: Text('Add Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
