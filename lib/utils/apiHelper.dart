import 'dart:convert';
import 'package:dummy_ecommerce/screens/home/modal/HomeModal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper._();
  ApiHelper._();

  Future<HomeCommerce> getApi()
  async {
    String link = "https://dummyjson.com/products";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var json = jsonDecode(res.body);
    HomeCommerce data = HomeCommerce.fromJson(json);
    return data;
  }
}
