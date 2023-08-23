import 'package:bite_trace/models/account_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService {

  AccountService({FirebaseFirestore? firestore, required this.ref})
      : _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore _firestore;
  final Ref ref;

  CollectionReference<AccountData> get accountsCollection {
    return _firestore.collection('accounts').withConverter(
          fromFirestore: (snapshot, options) =>
              AccountData.fromJson({'id': snapshot.id, ...snapshot.data()!}),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  Future<void> createAccount(AccountData accountData) async {
    await accountsCollection.doc(accountData.uid).set(accountData);
  }

  Future<void> updateAccount(AccountData accountData) async {
    final accountMap = accountData.toJson();
    await accountsCollection.doc(accountData.uid).update(accountMap);
  }

  Future<AccountData?> getAccount(String uid) async {
    final snapshot = await accountsCollection.doc(uid).get();
    return snapshot.data();
  }
}
