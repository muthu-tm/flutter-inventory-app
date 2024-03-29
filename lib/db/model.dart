import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  CollectionReference getCollectionRef() {
    throw new Exception("Should be implemented by subclass");
  }

  String getID() {
    throw new Exception("Should be implemented by subclass");
  }

  DocumentReference getDocumentRef(id) {
    return this.getCollectionRef().doc(id);
  }

  add(data) async {
    return await this.getCollectionRef().doc(this.getID()).set(data);
  }

  upsert(data, createdAt) async {
    data['created_at'] = createdAt;
    data['updated_at'] = DateTime.now();

    return await this.getCollectionRef().doc(this.getID()).set(data);
  }

  update(Map<String, dynamic> data) async {
    data['updated_at'] = DateTime.now();
    await this.getDocumentRef(this.getID()).update(data);

    return data;
  }

  updateByID(Map<String, dynamic> data, String docID) async {
    data['updated_at'] = DateTime.now();
    await this.getDocumentRef(docID).update(data);

    return data;
  }

  updateArrayField(
      bool isAdd, Map<String, dynamic> data, String documentID) async {
    Map<String, dynamic> fields = Map();
    fields['updated_at'] = DateTime.now();

    data.forEach((key, value) {
      if (isAdd) {
        fields[key] = FieldValue.arrayUnion(value);
      } else {
        fields[key] = FieldValue.arrayRemove(value);
      }
    });

    String docId = "";
    if (documentID != null || documentID != "") {
      docId = documentID;
    } else {
      docId = this.getID();
    }

    await this.getDocumentRef(docId).update(fields);
    return data;
  }

  delete(id) async {
    await this.getDocumentRef(id).delete();

    return true;
  }

  Future<Map<String, dynamic>> getByID(String docID) async {
    String id;
    if (docID != null && docID != "") {
      id = docID;
    } else if (this.getID() != null && this.getID() != null) {
      id = this.getID();
    } else {
      return null;
    }

    DocumentSnapshot _snap = await this.getDocumentRef(id).get();
    if (_snap.exists) {
      return _snap.data();
    }

    return null;
  }

  Future txCreate(Transaction tx, txDocRef, Map<String, dynamic> data) async {
    tx.set(txDocRef, data);
    return data;
  }

  Future txUpdate(Transaction tx, DocumentReference txDocRef,
      Map<String, dynamic> data) async {
    data['updated_at'] = DateTime.now();

    tx.update(txDocRef, data);
  }

  txDelete(Transaction tx, DocumentReference txDocRef) async {
    tx.delete(txDocRef);
  }
}
