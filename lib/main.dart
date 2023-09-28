import 'package:e_commerce_app/controllers/book_controllers.dart';
import 'package:e_commerce_app/l10n/l10n.dart';
import 'package:e_commerce_app/pages/main_page.dart';
import 'package:e_commerce_app/utilities/mycart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'helper/dependencies.dart' as dep;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<BookController>().getBookList();
    return ChangeNotifierProvider(
      create: (context)=> MyCartData(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainPage(),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      ),
    );
  }

}
