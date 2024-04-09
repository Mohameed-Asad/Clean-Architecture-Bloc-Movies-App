import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source.dart';
import 'package:movies_project/domain/repository/favourite_widget_repository.dart';

import '../../domain/entities/all_movies_model.dart';

class FavouriteWidgetRepositoryImp implements FavouriteWidgetRepository {
  final WatchListDataSource dataSource;

  FavouriteWidgetRepositoryImp(this.dataSource);

  @override
  Future<void> addFavourite(AllMoviesModel model) {
    var collectionRef = dataSource.getCollectionRef();
    var docRef = collectionRef.doc();
    model.firebaseId = docRef.id;
    return docRef.set(model);
  }

  @override
  Future<void> removeFavourite(AllMoviesModel model) {
    var collectionRef = dataSource.getCollectionRef();
    return collectionRef.doc(model.firebaseId).delete();
  }
}
