import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:translation_app/core/service/api_service.dart';
import 'package:translation_app/core/service/translation_sevice.dart';
import 'package:translation_app/features/data/repo/transation_repo_impl.dart';
import 'package:translation_app/features/domain/repo/transation_repo.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<TranslationSevice>(ApiService(dio: getIt<Dio>()));
  getIt.registerSingleton<TranslationRepo>(
    TransationRepoImpl(
      translationSevice: getIt<TranslationSevice>(),
    ),
  );
}
