import 'package:dio/dio.dart';

final dio = Dio();

Future g() async {
  final a = await dio.get('http://192.168.2.53:3000');
  return a;
}
