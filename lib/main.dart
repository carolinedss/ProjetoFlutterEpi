import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Cadastro/Admin/cadepi.dart';
import 'package:projetoepi/Provider/Cadastro/Admin/colaborador.dart';
import 'package:projetoepi/Provider/Cadastro/Admin/entrega.dart';
import 'package:projetoepi/Provider/Cadastro/Login/logar.dart';
import 'package:projetoepi/Provider/Cadastro/valida_login.dart';
import 'package:projetoepi/Provider/Cadastro/verifica_usuario.dart';
import 'package:projetoepi/pages/admin/Entrega/dataentrega.dart';
import 'package:projetoepi/pages/admin/Entrega/escolheepi.dart';
import 'package:projetoepi/pages/admin/adm_entrega.dart';
import 'package:projetoepi/pages/admin/adm_epi.dart';
import 'package:projetoepi/pages/admin/adm_func.dart';
import 'package:projetoepi/pages/admin/admin.dart';
import 'package:projetoepi/pages/dashboard.dart';
import 'package:projetoepi/pages/homepage.dart';
import 'package:projetoepi/pages/signup_screen.dart';
import 'package:provider/provider.dart';

void main (){
runApp( MultiProvider(
   providers: [
    ChangeNotifierProvider(create: (_) => ValidarSenha()),
    ChangeNotifierProvider(create: (_) => UsuarioCadastro()),
    ChangeNotifierProvider(create: (_) => Logar()),
    ChangeNotifierProvider(create: (_) => ColaboradorProvider()),
    ChangeNotifierProvider(create: (_) => CadEpiProvider()),
     ChangeNotifierProvider(create: (_) => EntregaProvider()),
   ],

  child: MaterialApp(
  initialRoute: "/",
  routes: {
    '/': (context) => const HomePage(),
    '/cadastro': (context) => const SignupScreen(),
    '/dashboard': (context) => const Dashboard(),
    '/admin': (context) => const Admin(),
    '/admentrega': (context) => const AdmEntrega(),
    '/admepi': (context) => const AdminEpi(),
    '/admFunc': (context) => const AdmFunc(),
    '/episentrega': (context) => const EpisScreen(),
    '/entrega': (context) => EntregaScreen(),
    
  },
  debugShowCheckedModeBanner: false,
  )));
} 