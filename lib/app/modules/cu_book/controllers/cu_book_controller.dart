import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class CuBookController extends GetxController {
  //TODO: Implement CuBookController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
