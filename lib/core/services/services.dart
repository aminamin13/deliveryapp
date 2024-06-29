
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {

late SharedPreferences sharedPreferences;

Future<MyServices> init() async {
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  return this;
}

}
// Initializes the services asynchronously by putting the result of MyServices initialization using Get.putAsync.
initialServices() async{
  await Get.putAsync(() => MyServices().init());
}