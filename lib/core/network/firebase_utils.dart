import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies_project/core/models/allmovies_model.dart';

class FirebaseUtils {
  CollectionReference<AllMoviesModel> getCollectionRef() {
    var db = FirebaseFirestore.instance;
    return db.collection("Favourite_List").withConverter<AllMoviesModel>(
          fromFirestore: (snapshot, _) =>
              AllMoviesModel().fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toFireStore(),
        );
  }

  Future<void> addToFavourite(AllMoviesModel model) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    model.firebaseId = docRef.id;
    return docRef.set(model);
  }

  Stream<QuerySnapshot<AllMoviesModel>> getStreamData() {
    var collectionRef = getCollectionRef();
    return collectionRef.snapshots();
  }

  removeFav(AllMoviesModel model) {
    var collectionRef = getCollectionRef();
    return collectionRef.doc(model.firebaseId).delete();
  }
}
