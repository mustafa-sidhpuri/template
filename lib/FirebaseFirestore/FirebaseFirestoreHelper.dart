import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreHelper{
  FirebaseFirestore firestore;
  FirebaseFirestoreHelper({required this.firestore});

  Future<Either<FirebaseFailure,Success>> deleteData(String id, String collection) async {
    try {
      await firestore.collection(collection).doc(id).delete();
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<Either<FirebaseFailure,Success>> addData(String collection, String doc, Map<String,dynamic> data) async {
    try{
      await firestore.collection(collection).doc(doc).set(data);
      return Right(Success());
    }on FirebaseException catch(err){
      debugPrint("Add News: ${err.code}");
      return Left(FirestoreDataAddFailure(message: err.code));
    }
  }

  Future<Either<FirebaseFailure,Map<String,dynamic>>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> result = await firestore.collection("news").get();
      return Right(result.docs as Map<String,dynamic>);
    } catch (err) {
      debugPrint(err.toString());
      return Left(FirestoreDataFetchFailure());
    }
  }
}