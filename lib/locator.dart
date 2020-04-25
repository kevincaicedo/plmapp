import 'package:get_it/get_it.dart';
import 'package:plmapp/utils/http_client.dart';
import 'package:plmapp/config/constant.dart';
import 'package:plmapp/app/register/repositories/plm_service.dart';
import 'package:plmapp/app/register/repositories/register_repository.dart';

final getIt = GetIt.instance;

void init() {
  //Singleton for HTTP request
  getIt.registerLazySingleton<HttpClient>(
      () => HttpClient(baseUrl: Constants.BASE_URL));

  getIt.registerLazySingleton<PlmService>(() => PlmService(client: getIt()));
  getIt.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(plmService: getIt()));
}
