import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:translation_app/core/error/failure.dart';
import 'package:translation_app/core/service/translation_sevice.dart';
import 'package:translation_app/features/domain/repo/transation_repo.dart';

class TransationRepoImpl implements TranslationRepo{
  final TranslationSevice translationSevice;

  TransationRepoImpl({required this.translationSevice});
  @override
  Future<Either<Failure, String>> translateText(String text, String from, String to) async{
    try{
      String response = await translationSevice.translateText(text, from, to);
      debugPrint('translation is $response');
      return right(response);
    } on DioException catch (e) {
      return left(ApiFailure.fromDioException(e));
    } catch (e) {
      return left(ApiFailure(errorMsg: e.toString()));
    }
  }
}