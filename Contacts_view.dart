

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactListScreen(),
    );
  }
}

class ContactListScreen extends StatefulWidget {
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _searchController.addListener(() {
      _filterContacts();
    });
  }

  Future<void> _requestPermission() async {
    if (await Permission.contacts.request().isGranted) {
      _fetchContacts();
    }
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
      _filteredContacts = _contacts;
    });
  }

  void _filterContacts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredContacts = _contacts.where((contact) {
        return contact.displayName!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Contacts',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredContacts.length,
        itemBuilder: (context, index) {
          Contact contact = _filteredContacts[index];
          return ListTile(
            title: Text(contact.displayName ?? ''),
            subtitle: Text(contact.phones!.isNotEmpty ? contact.phones!.first.value! : ''),
          );
        },
      ),
    );
  }
}
