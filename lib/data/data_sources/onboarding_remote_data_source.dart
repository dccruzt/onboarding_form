import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:onboarding_form/domain/entities/breed.dart';

import '../../domain/data_sources/onboarding_remote_data_source.dart';

class OnboardingRemoteDataSourceImpl implements OnboardingRemoteDataSource {
  @override
  Future<List<Breed>> loadBreeds() async {
    try {
      String data = await rootBundle.loadString("assets/json/breeds.json");

      final json = (jsonDecode(data) as Iterable);
      return json.map((item) => Breed.fromJson(item)).toList();
    } catch (_) {
      rethrow;
    }
  }
}
