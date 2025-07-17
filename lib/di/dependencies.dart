import 'package:get_it/get_it.dart';

import '../data/data_sources/onboarding_remote_data_source.dart';
import '../data/repositories/onboarding_repository.dart';
import '../domain/data_sources/onboarding_remote_data_source.dart';
import '../domain/repositories/onboarding_repository.dart';
import '../domain/use_cases/load_breeds_use_case.dart';

GetIt get di => GetIt.instance;

Future<void> initDependencies() async {
  di.registerFactory<OnboardingRemoteDataSource>(
    () => OnboardingRemoteDataSourceImpl(),
  );

  di.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(remoteDataSource: di()),
  );

  di.registerFactory(() => LoadBreedsUseCase(repository: di()));
}
