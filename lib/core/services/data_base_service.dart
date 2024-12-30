abstract class DataBaseService {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? doucumentId});

  Future<dynamic> getData(
      {required String path, String? docId, Map<String, dynamic>? query});

  Future<bool> checkIfDataExists(
      {required String path, required String docuementId});
}
