import 'package:flutter/material.dart';
import 'package:flutter_supabase/supabase/operationsSupabase.dart';

import '../components/showAlertDialog.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  static SupabaseUsersTable supabaseInstanceUsers = SupabaseUsersTable();
  final Future<List<dynamic>> _listaUsuarios =
      supabaseInstanceUsers.getUsersSupabase();

  List<String> _nomesUsuarios = [];

  void trocarNome(indexNome, novoNome) {
    setState(() {
      _nomesUsuarios[indexNome] = novoNome;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Lista de Pessoas'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent),
      body: FutureBuilder<List<dynamic>>(
        future: _listaUsuarios,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                //trocarNome();
                _nomesUsuarios.add(snapshot.data?[index]['nome']);

                int id_pessoa = snapshot.data?[index]['id'];

                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blueAccent,
                  ),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              TextEditingController _textEditingController =
                                  TextEditingController(
                                text: _nomesUsuarios[index],
                              );

                              return ShowAlertDialog(
                                title: SizedBox.shrink(),
                                content: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Editar Nome',
                                    ),
                                    controller: _textEditingController),
                                yesAnswer: 'Salvar',
                                alertAction: () {
                                  String novo_nome =
                                      _textEditingController.text;
                                  Future<String> editar_pessoa =
                                      supabaseInstanceUsers.editPessoa(
                                    id_pessoa,
                                    novo_nome,
                                  );

                                  editar_pessoa.then((value) {
                                    if (value == 'sucesso')
                                      trocarNome(index, novo_nome);
                                  });
                                },
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.cyanAccent,
                        ),
                      ),
                      Text(
                        '${_nomesUsuarios[index]}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ShowAlertDialog(
                                title: Text('Excluir Pessoa'),
                                content: Text(
                                  'Tem certeza que deseja excluir o usuário '
                                  '${_nomesUsuarios[index]}?',
                                ),
                                yesAnswer: 'Sim',
                                alertAction: () {
                                  supabaseInstanceUsers
                                      .excluirPessoa(id_pessoa);
                                },
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 10,
            ));
          }
        },
      ),
    );
  }
}
