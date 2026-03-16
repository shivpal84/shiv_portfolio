import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shiv_portfolio/bloc/portfolio_cubit.dart';
import 'package:shiv_portfolio/firebase_options.dart';
import 'package:shiv_portfolio/pages/portfolio_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PortfolioCubit>(
      create: (_) => PortfolioCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shivpal Singh | Portfolio',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF070F1D),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF6B4A),
            brightness: Brightness.dark,
          ),
        ),
        home: const PortfolioPage(),
      ),
    );
  }
}
