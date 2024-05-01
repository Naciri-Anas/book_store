import 'package:book_store/app/routes/app_pages.dart';
import 'package:get/get.dart';


extension GetExt on GetInterface {
  void pop<T>({
    T? result,
    bool canPop = true,
    int? id,
  }) {
    if (canPop) {
      if (global(id).currentState?.canPop() == true) {
        global(id).currentState?.pop<T>(result);
      } else {
        Get.offAllNamed(Routes.BOOKS);
      }
    } else {
      global(id).currentState?.pop<T>(result);
    }
  }

}
