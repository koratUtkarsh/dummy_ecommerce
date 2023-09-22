import 'package:dummy_ecommerce/screens/home/modal/HomeModal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product homeCommerce = Get.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
        ),
        body: Card(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10.sp),
                Container(
                  height: 150.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.sp),
                    child: Image.network(
                      "${homeCommerce.thumbnail}",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Title :- ${homeCommerce.title}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          "Price :- ${homeCommerce.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          "⭐ :- ${homeCommerce.rating}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          "Description :- ${homeCommerce.description}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Container(
                          height: 200.sp,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: homeCommerce.images!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(5.sp),
                                height: 110.sp,
                                child: Image.network(
                                  "${homeCommerce.images![index]}",
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
