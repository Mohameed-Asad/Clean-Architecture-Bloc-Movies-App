import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source.dart';
import 'package:movies_project/data/models/all_movies_model.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';

class WatchListDataSourceImp implements WatchListDataSource {
  final FirebaseFirestore utils = FirebaseFirestore.instance;

  @override
  CollectionReference<AllMoviesModel> getCollectionRef() {
    return utils.collection("Favourite_List").withConverter<AllMoviesDataModel>(
        fromFirestore: (snapshot, _) =>
            AllMoviesDataModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toFireStore());
  }
}
