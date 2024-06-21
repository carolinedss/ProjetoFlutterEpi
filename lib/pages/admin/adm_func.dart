import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projetoepi/Provider/Cadastro/Admin/colaborador.dart';
import 'package:projetoepi/utils/mensage.dart';
import 'package:projetoepi/widget/botao.dart';
import 'package:projetoepi/widget/field.dart';
import 'package:provider/provider.dart';

class AdmFunc extends StatefulWidget {
  const AdmFunc({super.key});

  @override
  State<AdmFunc> createState() => _AdmFuncState();
}

class _AdmFuncState extends State<AdmFunc> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _ctps = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  final TextEditingController _cpf = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _dataAdmissao = TextEditingController();

  @override
  void dispose() {
    _nome.clear();
    _ctps.clear();
    _telefone.clear();
    _cpf.clear();
    _email.clear();
    _dataAdmissao.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColaboradorProvider>(builder:(context, colabprovider, _){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admnistrativo'),
      ),
       body: SingleChildScrollView(
         child: Form(
          key: _formKey,
           child: Center(
            child:Column(
              children: [
                customTextField(
                  title: 'Nome do Funcionário',
                  controller: _nome,
                  hint: 'Digite o nome do Funcionário',
                  tipo: TextInputType.text
                ),
                 customTextField(
                  title: 'Número CTPS',
                  controller: _ctps,
                  hint: 'Digite o numero do ctps',
                  tipo: TextInputType.text,  
                ),
                customTextField(
                  title: 'Número de telefone',
                  controller: _telefone,
                  hint: 'Digite o numero do telefone',
                  tipo: TextInputType.number,  
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ]),
                customTextField(
                  title: 'Número do CPF',
                  controller: _cpf,
                  hint: 'Digite o numero do cpf',
                  tipo: TextInputType.number,  
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ]),
                customTextField(
                  title: 'E-mail',
                  controller: _email,
                  hint: 'Digite o E-mail do funcionário',
                  tipo: TextInputType.emailAddress,  
                ),
                customTextField(
                  title: 'Data de Admissão',
                  controller: _dataAdmissao,
                  hint: 'Digite a data de contratação',
                  tipo: TextInputType.datetime,  
                  formatacao: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ]),
                  customButton(
                    tap: () {
                      if (_formKey.currentState!.validate ()){
                        colabprovider.cadastrar(
                          context,
                          _nome.text,
                          _ctps.text,
                          _telefone.text,
                          _cpf.text,
                          _email.text,
                          _dataAdmissao.text,
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
                    status: colabprovider.carregando
                  )
              ],  
               )
           ),
         ),
       ),
    );
  });
  }
}