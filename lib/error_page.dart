import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Eror 404 page not found', style: TextStyle(fontFamily: 'Jost', fontSize: 24, fontWeight: FontWeight.bold),),
      ),
    );
  }
}