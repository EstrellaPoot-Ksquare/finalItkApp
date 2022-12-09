import 'package:final_itk_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class FingerPrintScreen extends StatelessWidget {
  const FingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            AuthController().fingerprintAuthentication(context);
          },
          child: const Text('Finger print'),
        ),
      ),
    );
  }
}
