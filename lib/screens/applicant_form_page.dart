import 'package:flutter/material.dart';
import '../models/applicant_model.dart';
import '../services/applicant_service.dart';

class ApplicantFormPage extends StatefulWidget {
  final Applicant? applicant;

  ApplicantFormPage({this.applicant});

  @override
  _ApplicantFormPageState createState() => _ApplicantFormPageState();
}

class _ApplicantFormPageState extends State<ApplicantFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _phone, _position;
  final ApplicantService applicantService = ApplicantService();

  @override
  void initState() {
    super.initState();
    if (widget.applicant != null) {
      _name = widget.applicant!.name;
      _email = widget.applicant!.email;
      _phone = widget.applicant!.phone;
      _position = widget.applicant!.position;
    } else {
      _name = '';
      _email = '';
      _phone = '';
      _position = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.applicant != null ? 'Edit Applicant' : 'Add Applicant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name cannot be empty' : null,
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Email cannot be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _phone,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) =>
                    value!.isEmpty ? 'Phone cannot be empty' : null,
                onSaved: (value) => _phone = value!,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                initialValue: _position,
                decoration: InputDecoration(labelText: 'Position'),
                validator: (value) =>
                    value!.isEmpty ? 'Position cannot be empty' : null,
                onSaved: (value) => _position = value!,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _saveApplicant,
                child: Text(
                  widget.applicant != null ? 'Update' : 'Save',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveApplicant() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (widget.applicant == null) {
        await applicantService.addApplicant(Applicant(
          name: _name,
          email: _email,
          phone: _phone,
          position: _position,
        ));
      } else {
        await applicantService.updateApplicant(Applicant(
          id: widget.applicant!.id,
          name: _name,
          email: _email,
          phone: _phone,
          position: _position,
        ));
      }
      Navigator.pop(context);
    }
  }
}
