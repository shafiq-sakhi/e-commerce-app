import 'package:e_commerce_app/data/api/api_client.dart';
import 'package:get/get.dart';

class BookRepo extends GetxService {
  final ApiClient apiClient;

  BookRepo({required this.apiClient});

  Future<Response> getBookList() async {
    return await apiClient.getData('/api/product/list?cid=sptag');
  }
}
