import 'package:dummy_ecommerce/screens/home/modal/HomeModal.dart';
import 'package:dummy_ecommerce/utils/apiHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  HomeCommerce? data;
  RxList searchResul = [].obs;
  RxList filterData = [].obs;
  RxSet<dynamic> filterBrandName = <dynamic>{}.obs;
  TextEditingController txtsearch = TextEditingController();
  Future<HomeCommerce?> apiCall()
  async {
    data = await ApiHelper.apiHelper.getApi();
    return data;
  }

  void getBrandNameForFilter(int index)
  {
    filterData.clear();
    for(int i=0; i<data!.products!.length;i++)
    {
      if(filterBrandName.elementAt(index) == data!.products![i].brand)
      {
        filterData.add(data!.products![i]);
      }
    }
  }

  void getFilterBrandName()
  {
    filterBrandName.clear();
    for(int i=0; i < data!.products!.length;i++)
    {
      filterBrandName.add(data!.products![i].brand);
    }
    print(filterBrandName);
  }
}