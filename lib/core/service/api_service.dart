import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:translation_app/core/service/translation_sevice.dart';

class ApiService implements TranslationSevice {
  final Dio dio;
  final String apiKey = '814e02acbfmshaa751335eae509ap1e9c60jsnea74c5e9516a';
  final String baseURL = 'free-google-translator.p.rapidapi.com';

  ApiService({required this.dio});

  @override
  Future<String> translateText(String text, String from, String to) async {
    final response = await dio.post(
      'https://free-google-translator.p.rapidapi.com/external-api/free-google-translator',
      queryParameters: {"from": from, "to": to, "query": text},
      data: {"translate": text},
      options: Options(
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': baseURL,
          'content-type': 'application/json',
        },
      ),
    );
    debugPrint("tra ${response.data}");
    return response.data['translation'];
  }
}
