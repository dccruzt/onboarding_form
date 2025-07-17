import '../entities/breed.dart';
import '../repositories/onboarding_repository.dart';

class LoadBreedsUseCase {
  const LoadBreedsUseCase({required this.repository});

  final OnboardingRepository repository;

  Future<List<Breed>> call() {
    try {
      return repository.loadBreeds();
    } catch (_) {
      rethrow;
    }
  }
}
