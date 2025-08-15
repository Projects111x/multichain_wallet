import 'package:flutter/material.dart';

class DepositView extends StatelessWidget {
  const DepositView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deposit')),
      body: Center(child: Text('Deposit Page', style: TextStyle(fontSize: 18))),
    );
  }
}
