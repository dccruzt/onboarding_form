import '../entities/breed.dart';

abstract class OnboardingRemoteDataSource {
  Future<List<Breed>> loadBreeds();
}
