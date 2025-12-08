import 'package:flutter/material.dart';
import 'package:minimal_social/features/auth/presentation/pages/login_page.dart';

class MinimalSocial extends StatelessWidget {
  const MinimalSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );
  }
}