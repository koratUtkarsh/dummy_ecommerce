import 'package:dummy_ecommerce/screens/home/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    TextEditingController txtsearch = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: txtsearch,
            onChanged: (value) {
              String search = homeController.txtsearch.text;
              for (int i = 0; i < homeController.data!.products!.length; i++) {
                for (int j = 0; j <  homeController.data!.products![i].title!.length; j++) {
                  print("object");
                }
                if (homeController.data!.products![i].title!
                        .compareTo(search) ==
                    0) {
                  homeController.searchResul.add(homeController.data!);
                }
              }
              print(homeController.searchResul);
            },
          ),
        ),
        body: Obx(
              () =>
              ListView.builder(
                itemCount: homeController.searchResul.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 10.h,
                    width: 100.w,
                    color: Colors.blue,
                  );
                },
              ),
        ),
      ),
    );
  }
}
