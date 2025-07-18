//دا كلاس خاص بالفير بيز وبيرث من DatabaseServeces
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makani_dashbord/core/enums/order_enum.dart';

import 'DataBase_Serveces.dart';

class FirestoerServeces implements DataBaseServeces {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByFiald = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByFiald, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> chackIfDataExist(
      {required String path, required String documentId}) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Stream<dynamic> getDataStream(
      {required String path, Map<String, dynamic>? query}) async* {
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByFiald = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderByFiald, descending: descending);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for (var event in data.snapshots()) {
      yield event.docs.map((e) => e.data()).toList();
      // await data.snapshots().first.then((event) => event.docs.map((e) => e.data()).toList());
    }
  }

  @override
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).update(data);
  }

  @override
  Future<void> deletData(
      {required String path, required String productID}) async {
    await firestore
        .collection(path)
        .doc(productID)
        .delete();
  }
}
