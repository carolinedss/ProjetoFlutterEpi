import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Cadastro/Login/logar.dart';
import 'package:projetoepi/style/colors.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/botao.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
   _email.clear();
   _password.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Logar>(builder: (context, logar, _){
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage('assets/images/logo.jpg')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                shape: BoxShape.circle
              ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Seja bem vindo")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customTextField(
                    title: 'E-mail',
                    controller: _email,
                    hint: 'Digite seu e-mail',
                    tipo: TextInputType.emailAddress
                    ),
                  customTextField(
                    title: 'Senha',
                    controller: _password,
                    hint: 'Digite sua senha',
                    obscure: true,
                    tipo: TextInputType.visiblePassword,
                    funcao: (value) {
                      logar.validatePassword(value);
                    }),
                    if (logar.msgError.isNotEmpty)
                    Text(
                      logar.msgError,
                      style: const TextStyle(color: Colors.red),
                    ),
                  customButton(
                    text: 'Login',
                    tap: () async {
                      if (_email.text.isEmpty || _password.text.isEmpty){
                        showMessage(
                          message: "Todos os campos são requiridos",
                          context: context);
                      } else {
                        await logar.logarUsuario(_email.text, _password.text, 0);
                        if (logar.logado){
                          Navigator.of(context).pushNamed(logar.rota);
                        } else{
                          showMessage(
                            message: "Usuario ou senhas incorretas",
                            context: context);
                        }
                      }
                    },
                    context: context,
                    status: logar.carregando
                  ),

                   const SizedBox(height: 20,),
                    TextButton(
                   
                      onPressed: () {
                        Navigator.of(context).pushNamed('/cadastro');
                      },
                      child: Text('Cadastre-se',style: TextStyle(color: preto),),

                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  });
}
}