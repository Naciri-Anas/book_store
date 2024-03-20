import 'package:book_store/app/data/book_model.dart';
import 'package:book_store/app/modules/books/book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListView extends StatelessWidget {
  final BookController _bookController = Get.find();

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
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: _bookController.books.length,
          itemBuilder: (context, index) {
            Book book = _bookController.books[index];
            return GestureDetector(
              onTap: () => _editBook(context, book, index),
              child: Card(
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(book.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
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
    TextEditingController titleController = TextEditingController();
    TextEditingController imageUrlController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Book'),
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
                _bookController.addBook(
                  Book(
                    id: DateTime.now().toString(),
                    title: titleController.text,
                    imageUrl: imageUrlController.text,
                    description: descriptionController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
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
                _bookController.updateBook(
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
}
