import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/all_movies_model.dart';

abstract class WatchListDataSource {
  CollectionReference<AllMoviesModel> getCollectionRef();
}
