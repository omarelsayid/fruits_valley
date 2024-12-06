

abstract class DataBaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data, String? doucumentId});

  Future<Map<String, dynamic>> getData(
      {required String path, required String docId});


       Future<bool> checkIfDataExists({required String path, required String docuementId});
}
