import 'package:flutter/material.dart';
import 'package:app_synthese/models/contact.dart';

// Page "à vous de coder" du support (Application de Synthèse) : liste de
// contacts avec ajout via un formulaire (CRUD en mémoire, sans persistance —
// SQLite/sqflite n'a pas été couvert dans cette séance, voir README).
class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> contacts = List.of(defaultContacts);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void addContact() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) return;
    setState(() {
      contacts.add(Contact(nameController.text, phoneController.text));
      nameController.clear();
      phoneController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(hintText: 'Nom'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: 'Téléphone'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.deepOrange),
                  onPressed: addContact,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final c = contacts[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(c.name),
                  subtitle: Text(c.phone),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
