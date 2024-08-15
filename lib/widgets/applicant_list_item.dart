import 'package:flutter/material.dart';
import '../models/applicant_model.dart';

class ApplicantListItem extends StatelessWidget {
  final Applicant applicant;

  const ApplicantListItem({required this.applicant});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(
          applicant.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${applicant.email}'),
            Text('Phone: ${applicant.phone}'),
            Text('Position: ${applicant.position}'),
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
