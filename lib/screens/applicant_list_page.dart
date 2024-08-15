import 'package:flutter/material.dart';
import '../models/applicant_model.dart';
import '../services/applicant_service.dart';
import 'applicant_form_page.dart';
import '../widgets/applicant_list_item.dart';

class ApplicantListPage extends StatelessWidget {
  final ApplicantService applicantService = ApplicantService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applicants'),
      ),
      body: StreamBuilder<List<Applicant>>(
        stream: applicantService.getApplicants(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final applicants = snapshot.data!;
          if (applicants.isEmpty) {
            return Center(
                child: Text('No applicants available. Please add new ones.'));
          }
          return ListView.builder(
            itemCount: applicants.length,
            itemBuilder: (context, index) {
              final applicant = applicants[index];
              return ApplicantListItem(applicant: applicant);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        child: Icon(Icons.add, color: Colors.black),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ApplicantFormPage(),
            ),
          );
        },
      ),
    );
  }
}
