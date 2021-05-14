import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'HomeController.dart';
import 'bindings/bindings.dart';

class MyApp extends StatelessWidget {
  //final HomeController controller = Get.find<HomeController>();
  final HomeController controller = Get.put(HomeController());

  User _user = Get.put(User(), permanent: true);
  final storage = GetStorage();
  final emailIdController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //   initialBinding: HomeBinding(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: emailIdController,
                    decoration: InputDecoration(hintText: "email"),
                  ),
                ),
                Container(
                  child: Obx(() {
                    print(controller.email.value);
                    return Text("Data: ${controller.email.value}");
                  }),
                ),
                MaterialButton(
                  onPressed: () {
                    controller.updateEmail("${storage.read("email")}");
                  },
                  textColor: Colors.white,
                  color: Colors.black54,
                  child: Text("View"),
                ),
                MaterialButton(
                  onPressed: () {
                    if (GetUtils.isEmail(emailIdController.text)) {
                      storage.write("email", emailIdController.text);
                      emailIdController.text = "";
                      Get.snackbar("Status", "Record Saved", snackPosition: SnackPosition.BOTTOM);

                    }
                    else{
                      Get.snackbar("Incorrect Email", "Enter a valid Email-Id", snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  textColor: Colors.white,
                  color: Colors.black54,
                  child: Text("Save"),

                ),
                GetBuilder<HomeController>(builder: (_) {
                  print("Data Widget builds");
                  return Text("Data: ${controller.dataOff}");
                }),
                /* GetBuilder<HomeController>(builder: (_) {
                  print("Followers Widget builds");
                  return Text("Data: ${controller.followers}");
                }),*/
                GetX<HomeController>(builder: (_) {
                  print("Followers Widget builds");
                  return Text("Data: ${controller.follow.value}");
                }),
                Container(
                  child: Obx(() {
                    print("Followers Widget builds");
                    return Text("Data: ${controller.followers.value}");
                  }),
                ),
                MaterialButton(
                    color: Colors.amber,
                    onPressed: () async {
                      controller.updateData("online");
                    }),
              ],
            ),
          ),
        ),
      ),

      // initialRoute: "/myApp",
      // getPages: [
      // GetPage(name: "/myApp", page: () => MyApp(), binding: HomeBinding()),
      //],
    );
  }
}
