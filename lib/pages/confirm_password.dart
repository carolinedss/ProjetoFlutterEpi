import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Cadastro/valida_login.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:provider/provider.dart';

class ConfirmPassword extends StatelessWidget {
  final String email;
  final String cpf;

  const ConfirmPassword({super.key, required this.email, required this.cpf});

  @override
  Widget build(BuildContext context) {

    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Consumer<ValidarSenha>(builder: (context, validarsenhar, _){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirme a senha'),
        backgroundColor: Color.fromARGB(255, 144, 183, 254)
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('E-mail: $email'),
            Text('CPF $cpf'),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirmar senha'),
              obscureText: true
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(passwordController.text !=
                confirmPasswordController.text){
                  showMessage(
                    message: "As senhas devem ser iguais",
                    context: context);
                } else {
                  var cpfint = cpf.replaceAll(RegExp(r'[^0-9]'), '');
                  validarsenhar.createUser(
                    email, passwordController.text, int.parse (cpfint));
                    showMessage(
                      message: validarsenhar.msgErrorApi,
                      context: context
                    );
                }
              },
              child: const Text('Concluir'),
            )

          ],
        ),
      ),
    );
    });
}
}