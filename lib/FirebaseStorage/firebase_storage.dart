import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseStorageHelper{
  final FirebaseStorage firebaseStorage;
  FirebaseStorageHelper({required this.firebaseStorage});

  Future<String> storeImageToStorage(
      {required String path,required XFile file,required String name})async{
    String uploadedPhotoUrl = "";
    // Reference reference =
    //     firebaseStorage.ref().child('images/${Path.basename(pickedFile.path)}');
    Reference reference =
    firebaseStorage.ref().child(path).child(name);
    await reference
        .putData(
      await file.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    )
        .whenComplete(() async {
      await reference.getDownloadURL().then((value) {
        uploadedPhotoUrl = value;
      });
    });
    return uploadedPhotoUrl;
  }
}