import 'package:book_store/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cu_book_controller.dart';

class CuBookView extends StatefulWidget {
  const CuBookView({Key? key,  this.id}) : super(key: key);
  final String? id;

  @override
  State<CuBookView> createState() => _CuBookViewState();
}

class _CuBookViewState extends State<CuBookView> {
  late CuBookController controller;

  @override
  void initState() {
    controller = Get.put(getIt<CuBookController>(), tag: '${UniqueKey()}');
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
        title: const Text('CuBookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CuBookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
