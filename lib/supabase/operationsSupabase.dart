import 'package:supabase_flutter/supabase_flutter.dart';

class OperationsSupaBaseDB {
  final supabase = Supabase.instance.client;

  Future<void> createNewUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: '$email',
      password: '$password',
    );

    final Session? session = res.session;
    final User? user = res.user;
  }

  Future<void> loginUser(String email, String password) async {
    final AuthResponse res = await supabase.auth.signInWithPassword(
      email: '$email',
      password: '$password',
    );
    final Session? session = res.session;
    final User? user = res.user;
  }

  Future<void> logOutUser() async {
    await supabase.auth.signOut();
  }
}

class SupabaseUsersTable extends OperationsSupaBaseDB {
  Future<void> insertRowSupabase(
    String nome,
    String email,
    int cpf,
    String nascimento,
    String telefone,
  ) async {
    await supabase.from('pessoas').insert({
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'nascimento': nascimento,
      'telefone': telefone,
    });
  }

  Future<String> editPessoa(int id_usuario, String novoNome) async {
    try {
      await supabase
          .from('pessoa')
          .update({'nome': novoNome}).match({'id': id_usuario});
      return 'sucesso';
    } on Exception catch (_) {
      return 'erro';
    }
  }

  Future<String> excluirPessoa(int id_usuario) async {
    try {
      await supabase.from('pessoa').delete().match({'id': id_usuario});
      return 'sucesso';
    } on Exception catch (_) {
      return 'erro';
    }
  }

  Future<List<dynamic>> getUsersSupabase() async {
    final data = await supabase.from('pessoa').select();

    return data;
  }
}
