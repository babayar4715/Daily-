import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app_dn/data/1th_tab_model/1th_model.dart';

class StoreService {
  final db = FirebaseFirestore.instance;

  Future<void> saveProduct(Toptom toptom) async {
    await db.collection("Lists").add(toptom.toJson());
  }
}
