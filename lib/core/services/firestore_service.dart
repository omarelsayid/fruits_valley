import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_base_service.dart';

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
  Future<dynamic> getData(
      {required String path,
      String? docId,
      Map<String, dynamic>? query}) async {
    if (docId != null) {
      var userData = await _firestore.collection(path).doc(docId).get();
      return userData.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = _firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }

        var result = await data.get();
        return result.docs
            .map((e) => e.data())
            .toList();
      }
    }
  }

  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docuementId}) async {
    var data = await _firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }
}
