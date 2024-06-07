import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoepi/Provider/Cadastro/verifica_usuario.dart';
import 'package:projetoepi/pages/confirm_password.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SafeGuard'),
        backgroundColor: Color.fromARGB(255, 144, 183, 254),
      ),
      body: const SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

final TextEditingController _emailController = TextEditingController();
final TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<UsuarioCadastro>(builder:(context, usuario, _){
      return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextField(
            title: 'Email',
            controller: _emailController,
            hint: 'Digite seu e-mail',
            tipo: TextInputType.emailAddress
          ),
           customTextField(
            controller: _cpfController,
            title: 'CPF',
            hint: 'Digite seu cpf',
            formatacao: [FilteringTextInputFormatter.digitsOnly,
            CpfInputFormatter()]
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              usuario.checarUsuario(
                _cpfController.text,
                _emailController.text);
                
              if (usuario.valido){
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPassword(
                    email: _emailController.text,
                    cpf: _cpfController.text,
                  ))
              );
              } else {
                showMessage(
                  message: usuario.msgError,
                  context: context);
              }
            },
            child: const Text('Avatar'),
          )
        ]
      ),
    );
  });
    } 
}