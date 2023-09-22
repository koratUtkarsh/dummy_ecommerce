import 'dart:async';

import 'package:dummy_ecommerce/screens/home/controller/homeController.dart';
import 'package:dummy_ecommerce/screens/home/modal/HomeModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    Timer(Duration(seconds: 3), () {
      controller.getFilterBrandName();
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('/search');
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
            IconButton(
              onPressed: () {
                bottomSsceet();
              },
              icon: const Icon(
                Icons.filter_alt,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: controller.apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              HomeCommerce? h1 = snapshot.data;
              return ListView.builder(
                itemCount: h1!.products!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/card', arguments: h1!.products![index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 120.sp,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            width: 100.sp,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.network(
                                "${h1.products![index].thumbnail}",
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: 120.sp,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${h1.products![index].title}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Container(
                                width: 120.sp,
                                height: 50.sp,
                                child: Text(
                                  "${h1.products![index].description}",
                                ),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Container(
                                width: 120.sp,
                                height: 15.sp,
                                child: Text(
                                  "stock :- ${h1.products![index].stock}",
                                ),
                              ),
                              SizedBox(
                                height: 5.sp,
                              ),
                              Container(
                                width: 120.sp,
                                height: 15.sp,
                                child: Text(
                                  "⭐ :- ${h1.products![index].rating}",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  HomeController controller = Get.put(HomeController());

  void bottomSsceet() {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 10.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.filterBrandName.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getBrandNameForFilter(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 5.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    child:
                        Text("${controller.filterBrandName.elementAt(index)}"),
                    decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                );
              },
            ),
          ),
          Obx(
            () => Container(
              height: 10.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.filterData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    height: 5.h,
                    width: 50.w,
                    alignment: Alignment.center,
                    child: Text("${controller.filterData[index].title}"),
                    decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
