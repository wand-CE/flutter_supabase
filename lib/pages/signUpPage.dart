import 'package:flutter/material.dart';
import 'package:flutter_supabase/supabase/operationsSupabase.dart';

import 'AppRoutes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  OperationsSupaBaseDB supabase = OperationsSupaBaseDB();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text('E-mail'),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: _emailController,
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Senha'),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              controller: _passwordController,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                supabase.createNewUser(
                    _emailController.text, _passwordController.text);
                Navigator.pushReplacementNamed(context, AppRoutes.homePage);
              },
              child: Text(
                'Cadastrar',
              ),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(40)),
            ),
          ],
        ),
      ),
    );
  }
}
