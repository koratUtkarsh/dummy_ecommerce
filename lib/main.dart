import 'package:dummy_ecommerce/screens/Card/View/CardScreen.dart';
import 'package:dummy_ecommerce/screens/home/view/homeScreen.dart';
import 'package:dummy_ecommerce/screens/search_screen/view/search-sscreen.dart';
import 'package:dummy_ecommerce/utils/apiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main()
{
  ApiHelper.apiHelper.getApi();
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        // initialRoute: ,
        getPages: [
          GetPage(name: '/', page: () => HomeScreen()),
          GetPage(name: '/search', page: () => SearchScreen()),
          GetPage(name: '/card', page: () => CardScreen()),
        ],
      ),
    ),
  );
}
