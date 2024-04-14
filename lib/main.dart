import 'package:bloacktut/core/theme/theme.dart';
import 'package:bloacktut/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloacktut/features/auth/presentation/pages/login_page.dart';
import 'package:bloacktut/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>serviceLocator<AuthBloc>()),
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
