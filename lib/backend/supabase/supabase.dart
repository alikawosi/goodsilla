import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://gnehtvvfyytbwdsnugyg.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImduZWh0dnZmeXl0Yndkc251Z3lnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk3ODY1OTEsImV4cCI6MjAzNTM2MjU5MX0.H30k6Psjgjn29u9wX8Tckje6ViM_Hao5Xb9HBmqWEoI';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
