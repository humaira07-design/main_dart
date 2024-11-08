import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValidationForm(),
    );
  }
}

class ValidationForm extends StatefulWidget {
  @override
  _ValidationFormState createState() => _ValidationFormState();
}

class _ValidationFormState extends State<ValidationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty || !RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Please enter a valid name.';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String? _validateCnic(String? value) {
    if (value == null || value.length != 13 || !RegExp(r'^\d{13}$').hasMatch(value)) {
      return 'CNIC must be exactly 13 digits.';
    }
    return null;
  }

  String? _validateContact(String? value) {
    if (value == null || !RegExp(r'^\d{10,12}$').hasMatch(value)) {
      return 'Contact number must be 10-12 digits.';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address cannot be empty.';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.length < 8 || !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$').hasMatch(value)) {
      return 'Password must be at least 8 characters long and include letters, numbers, and symbols.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Validation Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: _validateName,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: _validateEmail,
              ),
              TextFormField(
                controller: _cnicController,
                decoration: InputDecoration(labelText: 'CNIC'),
                validator: _validateCnic,
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact Number'),
                validator: _validateContact,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
                validator: _validateAddress,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: _validatePassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
