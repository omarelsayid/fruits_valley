import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_valley/core/services/data_base_service.dart';

class FirestoreService implements DataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? doucumentId,
  }) async {
    if (doucumentId != null) {
      _firestore.collection(path).doc(doucumentId).set(data);
    } else {
      _firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String docId}) async {
    DocumentSnapshot<Map<String, dynamic>> userData =
        await _firestore.collection(path).doc(docId).get();

    return userData.data()!;
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await _firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
