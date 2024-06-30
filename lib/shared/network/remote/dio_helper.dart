
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../local/cache_helper.dart';

class DioHelper
{
  static late Dio dio ;
  static init()
  {
    dio=Dio(
      BaseOptions(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType:ResponseType.json,
        //baseUrl: 'https://newsapi.org/',
         // baseUrl: 'https://student.valuxapps.com/api/',

          baseUrl:'https://earn-by-return.onrender.com/',
          receiveDataWhenStatusError: true,
          headers: {
            // 'Content-Type':'application/json'

          }

      ),

    );
  }
  static Future<Response>getData({
    required String url ,
    Map<String,dynamic>? query,
    String ?token
  } )async{
    token =CacheHelper.getData(key: 'token');
    dio.options.headers={
      'Content-Type':'application/json',
      'Authorization': 'Bearer ${token}'??'',
    };
    return await dio.get(url,queryParameters: query);
  }
  static Future<Response> postData(
      {
        required String url ,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang ='en',
        String? token,
      }
      )
  {
    dio.options.headers=
    {
      // 'lang':lang,
      // 'token':token
    }
    ;
    return dio.post(
        url,
        queryParameters: query,
        data: data
    ) ;
  }


  static Future<Response> patchData(
      {
        required String url ,
        Map<String,dynamic>? query,
        required Map<String,dynamic> data,
        String lang ='en',
        String? token,
      }
      )
  {
    dio.options.headers=
    {
      // 'lang':lang,
      // 'token':token
    }
    ;
    return dio.patch(
        url,
        queryParameters: query,
        data: data
    ) ;
  }

}