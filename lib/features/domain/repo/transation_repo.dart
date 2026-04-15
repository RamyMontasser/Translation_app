import 'package:dartz/dartz.dart';
import 'package:translation_app/core/error/failure.dart';

abstract class TranslationRepo {
  Future<Either<Failure, String>> translateText(String text, String from, String to);
}