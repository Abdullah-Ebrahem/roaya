import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static void getData({required String endPoint}) {
    dio.get(endPoint);
  }

  static void sendData({required String endPoint, FormData? data}) {
    dio.post(endPoint, data: data);
  }
}
