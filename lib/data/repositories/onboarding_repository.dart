import 'package:onboarding_form/domain/entities/breed.dart';

import '../../domain/data_sources/onboarding_remote_data_source.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl({required this.remoteDataSource});

  final OnboardingRemoteDataSource remoteDataSource;

  @override
  Future<List<Breed>> loadBreeds() => remoteDataSource.loadBreeds();
}
