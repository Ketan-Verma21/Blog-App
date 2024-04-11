import 'package:bloacktut/core/theme/theme.dart';
import 'package:bloacktut/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bloacktut/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bloacktut/features/auth/domain/usecases/user_sign_up.dart';
import 'package:bloacktut/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloacktut/features/auth/presentation/pages/login_page.dart';
import 'package:bloacktut/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final supabase=await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!, anonKey: dotenv.env['ANON_KEY']!);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>AuthBloc(userSignUp: UserSignUp(AuthRepositoryImpl(AuthRemoteDataSourceImpl(supabase.client)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //C3TxMVDuG0CD1Xl9
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slim Shady',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}
