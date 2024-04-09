import '../../presentation/home_screen/pages/popular_movies/view_model/cubit.dart';
import '../../presentation/home_screen/pages/recommended_movies/view_model/cubit.dart';
import '../../presentation/home_screen/pages/release_movies/view_model/cubit.dart';

class Apis {
  final PopularViewModel popVm;
  final ReleaseViewModel relVm;
  final RecommendedViewModel recVm;

  Apis({required this.popVm, required this.relVm, required this.recVm});
}
