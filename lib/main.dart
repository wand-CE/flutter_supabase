import 'package:flutter/material.dart';
import 'package:flutter_supabase/pages/AppRoutes.dart';
import 'package:flutter_supabase/pages/keysSupabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'YOUR-URL-SUPABASE-HERE',
    anonKey: 'YOUR-ANONKEY-SUPABASE-HERE',
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginPage,
      routes: AppRoutes.define(),
    ),
  );
}

final supabase = Supabase.instance.client;
