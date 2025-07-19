import '../frameworks/location_services.dart';

class LoadAddressUseCase {
  const LoadAddressUseCase({required this.locationServices});

  final LocationServices locationServices;

  Future<String?> call() {
    try {
      return locationServices.loadAddressFromLocation();
    } catch (_) {
      rethrow;
    }
  }
}
