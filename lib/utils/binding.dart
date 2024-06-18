import 'package:get/get.dart';
import 'package:projflut/controller/add_property_controller.dart';
import 'package:projflut/controller/auth_controller.dart';
import 'package:projflut/controller/get_property_controller.dart';
import 'package:projflut/utils/local_storage_data.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    // Get.put(AuthController());
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => GetPropertyController(), fenix: true);
    Get.lazyPut(() => LocalStorageData(), fenix: true);
  }

}