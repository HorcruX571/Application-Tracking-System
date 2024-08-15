import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '', _email = '', _password = '', _contact = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.tealAccent),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Name cannot be empty' : null,
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 16.0), // Space between the fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.tealAccent),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Email cannot be empty' : null,
                onSaved: (value) => _email = value!,
              ),
              SizedBox(height: 16.0), // Space between the fields
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  labelStyle: TextStyle(color: Colors.tealAccent),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Contact number cannot be empty' : null,
                onSaved: (value) => _contact = value!,
              ),
              SizedBox(height: 16.0), // Space between the fields
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.tealAccent),
                  filled: true,
                  fillColor: Colors.grey[800],
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Password cannot be empty' : null,
                onSaved: (value) => _password = value!,
              ),
              SizedBox(height: 24.0), // Space before the button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                ),
                onPressed: _signup,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'name': _name,
          'email': _email,
          'contact': _contact,
        });

        // Show the success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signup Successful'),
              content: Text('You have successfully signed up!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pop(); // Go back to the login page
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to sign up: ${e.toString()}'),
        ));
      }
    }
  }
}
