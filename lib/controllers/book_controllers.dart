import 'package:e_commerce_app/data/repositories/book_repo.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/utilities/book_models.dart';

class BookController extends GetxController{
  final BookRepo bookRepo;

  BookController({required this.bookRepo});
  List<dynamic> _bookList=[];
  List<dynamic>  get bookList=> _bookList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getBookList()async{
    Response response= await bookRepo.getBookList();
    if(response.statusCode==200){
      print('got books');
      _bookList=[];
      Iterable i=response.body as List;
      _bookList=List<BooksModel>.from(i.map((e) => BooksModel.fromJson(e)).toList());
      _isLoaded=true;
      update();
    }else{
      print('could not get');
    }
  }

}