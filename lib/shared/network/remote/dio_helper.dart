import 'package:dio/dio.dart';

class DioHelper {

 static late Dio dio;

  static init() {

    dio = Dio(
      BaseOptions(
       // baseUrl: 'https://newsapi.org/',
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

 static  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
   String lang='en',
   String? token,
  }) async {
   dio.options.headers={
     'Content-Type':'application/json',
     'lang':lang,
     'Authorizations':token??'',//this=> ??'' means if it's not exist make it null

   };
    return await dio.get(url, queryParameters: query);
  }

 static  Future<Response> PostData ({
   required String url,
   Map<String, dynamic>? query,
   required Map<String, dynamic> data,
   String lang='en',
   String? token,
 }) async {
   dio.options.headers={
     'Content-Type':'application/json',
     'lang':lang,
     'Authorizations':token,
   };
   return dio.post(
       url,
       queryParameters: query,
       data: data
   );
 }
}
//Note that you don't have to make every thing is static you can work here like Omar in breaking bad series
//it's easy i may forget but it still so easy