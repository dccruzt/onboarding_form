import 'package:get_it/get_it.dart';

import '../data/data_sources/onboarding_remote_data_source.dart';
import '../data/repositories/onboarding_repository.dart';
import '../domain/data_sources/onboarding_remote_data_source.dart';
import '../domain/frameworks/location_services.dart';
import '../domain/repositories/onboarding_repository.dart';
import '../domain/use_cases/load_address_use_case.dart';
import '../domain/use_cases/load_breeds_use_case.dart';
import '../frameworks/location_services.dart';

GetIt get di => GetIt.instance;

Future<void> initDependencies() async {
  // Data Sources

  di.registerFactory<OnboardingRemoteDataSource>(
    () => OnboardingRemoteDataSourceImpl(),
  );

  // Repositories

  di.registerFactory<OnboardingRepository>(
    () => OnboardingRepositoryImpl(remoteDataSource: di()),
  );

  // Use Cases

  di.registerFactory(() => LoadBreedsUseCase(repository: di()));

  di.registerFactory(() => LoadAddressUseCase(locationServices: di()));

  // Frameworks

  di.registerFactory<LocationServices>(() => LocationServicesImpl());
}
