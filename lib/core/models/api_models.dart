import 'popular_model.dart';
import 'recommended_model.dart';
import 'release_model.dart';

class ApisCaller {
  final Future<List<PopularModel>> popularApi;
  final Future<List<ReleaseModel>> releaseApi;
  final Future<List<RecommendedModel>> recommendedApi;

  ApisCaller(
      {required this.popularApi,
      required this.releaseApi,
      required this.recommendedApi});
}
