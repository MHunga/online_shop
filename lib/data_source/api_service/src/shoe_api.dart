import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:online_shop/app/shoe_shop/model/response_product_model.dart';

class ShoeApiService {
  Dio _dio = Dio();
  Future<ResponseProduct> getListShoe() async {
    try {
      Response response = await _dio.get(
          "https://jsonblob.com/api/jsonBlob/4f488d11-307a-11eb-83d3-1140910d6286");
      var data = jsonDecode(response.toString());

      return ResponseProduct.fromJson(data);
    } on DioError catch (e) {
      return ResponseProduct(code: e.error, msg: e.message);
    }
  }
}
