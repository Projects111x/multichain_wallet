import 'package:flutter/material.dart';

class WalletManagementView extends StatelessWidget {
  const WalletManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet Management"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text("Add New Wallet"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.import_export),
            title: const Text("Import Wallet"),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text("Delete Wallet"),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
