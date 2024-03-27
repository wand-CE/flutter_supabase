import 'package:flutter/material.dart';
import 'package:flutter_supabase/supabase/operationsSupabase.dart';

import '../components/customTextFormField.dart';
import 'listaUsuarios.dart';

class CadastroPessoas extends StatefulWidget {
  const CadastroPessoas({super.key});

  @override
  State<CadastroPessoas> createState() => _CadastroPessoasState();
}

class _CadastroPessoasState extends State<CadastroPessoas> {
  TextEditingController controller_nome = TextEditingController();
  TextEditingController controller_email = TextEditingController();
  TextEditingController controller_cpf = TextEditingController();
  TextEditingController controller_nascimento = TextEditingController();
  TextEditingController controller_telefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Cadastrar Nova Pessoa',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            CustomTextFormField(
                campo: 'Nome Completo', controlador: controller_nome),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(campo: 'E-mail', controlador: controller_email),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              campo: 'CPF',
              controlador: controller_cpf,
              tipoInput: TextInputType.number,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              campo: 'Data de Nascimento',
              controlador: controller_nascimento,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextFormField(
                campo: 'Telefone', controlador: controller_telefone),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                child: Text('Cadastrar'),
                onPressed: () {
                  try {
                    int cpfValor = int.parse(controller_cpf.text);

                    SupabaseUsersTable().insertRowSupabase(
                      controller_nome.text,
                      controller_email.text,
                      cpfValor,
                      controller_nascimento.text,
                      controller_telefone.text,
                    );
                    Navigator.of(context).pop();
                  } catch (_) {
                    print(_);
                  }
                  ;
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
