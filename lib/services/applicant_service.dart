import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/applicant_model.dart';

class ApplicantService {
  final CollectionReference _applicantsCollection =
      FirebaseFirestore.instance.collection('applicants');

  Stream<List<Applicant>> getApplicants() {
    return _applicantsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Applicant.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<void> addApplicant(Applicant applicant) {
    return _applicantsCollection.add(applicant.toMap());
  }

  Future<void> updateApplicant(Applicant applicant) {
    return _applicantsCollection.doc(applicant.id).update(applicant.toMap());
  }

  Future<void> deleteApplicant(String id) {
    return _applicantsCollection.doc(id).delete();
  }
}
