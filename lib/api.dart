import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "https://vaz-cursos.herokuapp.com",
);

Dio api = new Dio(options);
