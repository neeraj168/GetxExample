import 'package:get/get.dart';

class HomeController extends GetxController {
  String dataOff = "Offline";
  String dataOn = "online";
  var email = "".obs;
  var followers = 50.obs;
  var follow = 10.obs;

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }
  void updateData(newData) {
    dataOff = newData;
    followers++;
    follow++;
    // ignore: unnecessary_statements
    // update();
  }
}



class User extends GetxController {
  // User(this.uid);
  var uid = "ID00122".obs;
}
