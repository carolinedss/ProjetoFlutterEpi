import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Cadastro/verifica_usuario.dart';
import 'package:projetoepi/pages/homepage.dart';
import 'package:projetoepi/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main (){
runApp( MultiProvider(
   providers: [
    ChangeNotifierProvider(create: (_) => UsuarioCadastro()),
   ],

  child: MaterialApp(
  initialRoute: "/",
  routes: {
    '/': (context) => const HomePage(),
    '/cadastro': (context) => const SignupScreen(),
  },
  debugShowCheckedModeBanner: false,
  )));
} 