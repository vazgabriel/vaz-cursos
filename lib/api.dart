import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "http://localhost:3333",
);

Dio api = new Dio(options);
