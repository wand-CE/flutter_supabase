import 'package:flutter/material.dart';
import 'package:flutter_supabase/supabase/operationsSupabase.dart';

import 'AppRoutes.dart';
import 'cadastroPessoas.dart';
import '../components/customElevatedButton.dart';
import 'listaUsuarios.dart';
import 'loginPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    OperationsSupaBaseDB supabase = OperationsSupaBaseDB();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Página Inicial'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                supabase.logOutUser();
                Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              CustomElevatedButton(
                icone: Icon(Icons.person_add, size: 70),
                textoLabel: Text('Cadastrar Pessoa'),
                buttonFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroPessoas()),
                  );
                },
              ),
              CustomElevatedButton(
                icone: Icon(Icons.add_shopping_cart_outlined, size: 70),
                textoLabel: Text('Cadastrar Produto'),
                buttonFunction: () {},
              ),
              CustomElevatedButton(
                icone: Icon(Icons.account_balance_sharp, size: 70),
                textoLabel: Text('Cadastrar Fornecedor'),
                buttonFunction: () {},
              ),
              CustomElevatedButton(
                icone: Icon(Icons.list_alt, size: 70),
                textoLabel: Text('Listar Pessoas'),
                buttonFunction: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListUsers()),
                  );
                },
              ),
              CustomElevatedButton(
                icone: Icon(Icons.line_style_rounded, size: 70),
                textoLabel: Text('Listar Produtos'),
                buttonFunction: () {},
              ),
              CustomElevatedButton(
                icone: Icon(Icons.featured_play_list_outlined, size: 70),
                textoLabel: Text('Listar Fornecedor'),
                buttonFunction: () {},
              ),
            ]),
      ),
    );
  }
}
