import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  String _empId = '';
  String _lastName = '';
  String _firstName = '';
  String _dob = '';
  String _email = '';
  String _mobile = '';
  String? _department;
  String? _designation;
  String _salary = '';

  final List<String> departments = ['Account', 'Sales'];
  final List<String> designations = ['Peon', 'Manager'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Emp ID',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _empId = value;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _lastName = value;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _firstName = value;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'DOB',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _dob = value;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _email = value;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _mobile = value;
                      },
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value?.length != 10) {
                          return 'Mobile number should be 10 digits.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Department',
                        border: OutlineInputBorder(),
                      ),
                      value: _department,
                      hint: Text('Account'),
                      items: departments.map((dept) {
                        return DropdownMenuItem(
                          value: dept,
                          child: Text(dept),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _department = value.toString();
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Designation',
                        border: OutlineInputBorder(),
                      ),
                      value: _designation,
                      hint: Text('Peon'),
                      items: designations.map((designation) {
                        return DropdownMenuItem(
                          value: designation,
                          child: Text(designation),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _designation = value.toString();
                        });
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Salary',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _salary = value;
                      },
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (_designation == 'Peon') {
                          if (double.parse(value!) < 5000 ||
                              double.parse(value) > 10000) {
                            return 'Salary should be between 5000 and 10000 for Peon.';
                          }
                        } else if (_designation == 'Manager') {
                          if (double.parse(value!) < 10000 ||
                              double.parse(value) > 20000) {
                            return 'Salary should be between 10000 and 20000 for Manager.';
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // OK button action
                              // You can add your logic here
                              print('Form submitted successfully');
                            }
                          },
                          child: Text('OK'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Cancel button action
                            // You can add your logic here
                            print('Form cancelled');
                          },
                          // style: ElevatedButton.styleFrom(primary: Colors.grey),
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
