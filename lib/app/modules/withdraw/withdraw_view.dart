import 'package:flutter/material.dart';

class WithdrawView extends StatelessWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Withdraw')),
      body: Center(
        child: Text('Withdraw Page', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
