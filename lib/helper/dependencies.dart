import 'package:e_commerce_app/controllers/book_controllers.dart';
import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:e_commerce_app/data/repositories/book_repo.dart';
import 'package:get/get.dart';

Future<void> init()async{
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl: 'https://dev.subashreepublishers.com'));

  //repos
  Get.lazyPut(() => BookRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => BookController(bookRepo: Get.find()));
}