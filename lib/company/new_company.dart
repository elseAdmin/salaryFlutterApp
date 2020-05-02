import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/app_scaffold.dart';

import '../app_config.dart';

class NewCompany extends StatefulWidget{
  @override
  _NewCompany createState() => _NewCompany();
}

class _NewCompany extends State<NewCompany> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _contactPersonController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var config = AppConfig.of(context);
    print("NEW COMPANY config::::::::::");
    print(config.apiBaseUrl);
  }

//  _cancelForm(BuildContext context) {
//    Navigator.of(context, rootNavigator: true).pop();
//  }

  _submit() {
    if(_formKey.currentState.validate()) {
      //TODO call url to add new company
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: "New Company Registration",
      body: Form(
        key: _formKey,
        child: Card(
          elevation: 2,
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 150,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _addressController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Contact Person Name',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _contactPersonController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Contact Person Name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _phoneController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Phone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Website',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _websiteController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Website';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _mobileController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Mobile Number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  maxLength: 30,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle:
                    TextStyle(fontSize: 20),
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Company Email';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.white,
                      onPressed: _submit,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}