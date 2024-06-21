import 'package:flutter/material.dart';
import 'package:projetoepi/Provider/Cadastro/Admin/cadepi.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/botao.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';

class AdminEpi extends StatefulWidget {
  const AdminEpi({super.key});

  @override
  State<AdminEpi> createState() => _AdminEpiState();
}

class _AdminEpiState extends State<AdminEpi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _instrucoes = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Consumer<CadEpiProvider>(builder: (context, epiprovider, _){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admnistrativo'),
      ),
      body: Center(
        child:Column(
          children: [
            customTextField(
              title: 'Nome',
              controller: _nome,
              hint: 'Digite o nome do Epi',
              tipo: TextInputType.text
            ),
            customTextField(
              title: 'Nome do Epi',
              controller: _instrucoes,
              hint: 'Digite o nome do Epi',
              tipo: TextInputType.text
            ),
             customButton(
                    tap: () {
                      if (_formKey.currentState!.validate ()){
                        epiprovider.cadastrar(
                          context,
                          _nome.text,
                          _instrucoes.text,
                        );
                      } else {
                        showMessage(
                          message: "Todos os campos devem ser prenchidos",
                          context: context
                        );
                      }
                    },
                    text: "Concluir",
                    context: context,
                    status: epiprovider.carregando
                  )
              ],
          )
       ),
    );
    });
}
}