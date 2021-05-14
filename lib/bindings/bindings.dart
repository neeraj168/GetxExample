import 'package:flutterhrms/HomeController.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
 //   Get.put<HomeController>(HomeController(), permanent: true);
//it only load once in memory by default
  //if we want to initial memory when its instance will create, then we use fenix : true  properties
    Get.lazyPut(() => HomeController(), fenix: true);
    // TODO: implement dependencies
  }

}