import 'package:dio/dio.dart';

class DioHelper {

 static late Dio dio;

  static init() {

    dio = Dio(
      BaseOptions(
       // baseUrl: 'https://newsapi.org/',
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json',
          //'lang':'ar'
        }
      ),
    );
  }

 static  Future<Response> getData({
    required String url,
   required Map<String, dynamic>? query,
   String lang='ar',
   String? token,
  }) async {
   dio.options.headers={
     'lang':lang,
     'Authorizations':token,

   };
    return await dio.get(url, queryParameters: query);
  }

 static  Future<Response> PostData ({
   required String url,
   Map<String, dynamic>? query,
   required Map<String, dynamic> data,
   String lang='ar',
   String? token,
 }) async {
   dio.options.headers={
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
