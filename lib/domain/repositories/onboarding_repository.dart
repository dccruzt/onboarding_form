import '../entities/breed.dart';

abstract class OnboardingRepository {
  Future<List<Breed>> loadBreeds();
}
