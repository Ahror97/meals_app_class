import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:groupb/data.dart';
import 'package:groupb/models/contact.dart';
import 'package:groupb/screens/homeScreen.dart';

class AddContact extends StatelessWidget {
  static const String routeName = '/addContact';
  AddContact({super.key});

  GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Contact newContact = Contact(name: 'name', phoneNumber: 'phoneNumber');

    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              maxLength: 15,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
              ],
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2)
                  return 'Please enter name';

                newContact.name = value;

                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 13,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: InputDecoration(
                labelText: 'Enter phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter valid phone number';

                newContact.phoneNumber = value;
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 20,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-z 0-9]'))
              ],
              decoration: InputDecoration(
                labelText: 'Enter email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter valid email';
                newContact.email = value;
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      contacts.add(newContact);
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomePage.routeName, (route) => false);
                    }
                  },
                  child: Text('Save'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
