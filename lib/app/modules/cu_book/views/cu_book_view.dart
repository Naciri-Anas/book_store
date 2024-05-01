import 'package:book_store/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cu_book_controller.dart';

class CuBookView extends StatefulWidget {
  final String? id;

  CuBookView({this.id});

  @override
  State<CuBookView> createState() => _CuBookViewState();
}

class _CuBookViewState extends State<CuBookView> {
  late CuBookController controller;

  bool get isEditMode => widget.id != null;

  @override
  void initState() {
    controller = Get.put(getIt<CuBookController>(), tag: '${UniqueKey()}');
    controller.init(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    controller.onDelete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Update 2' : 'Create'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey, // Assign form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  // You can add more validation for URL format if needed
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16.0),
              isEditMode
                  ? ElevatedButton(
                      onPressed: () => controller.onUpdateBook(),
                      child: const Text('Update Book'),
                    )
                  : ElevatedButton(
                      onPressed: () => controller.onAddBook(),
                      child: const Text('Create Book'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
