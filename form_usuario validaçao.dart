import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:val/model/us%C3%BAario.dart';

class FormUsuario extends StatefulWidget {
  @override
  _FormUsuarioState createState() => _FormUsuarioState();
}

class _FormUsuarioState extends State<FormUsuario> {
  final _formkey = GlobalKey<FormState>();

  Usuario _usuario = Usuario();

  get confirmacaoSenha => null;

  onSubmit() {
    if (_formkey.currentState.validate()) {
      print('Correto');
    } else {
      print('O formulário contém erros!!');
    }
  }

  String requerido(String valor) {
    if (valor == "") return "Este Campo é requerido";
    return null;
  }

  String confirmacaosenha(String valor) {
    if (valor == _usuario.senha) return null;
    return "A confirmação não é igual á senha";
  }

  @override
  Widget build(BuildContext context) {
    const _corIcones = Colors.yellow;
    const Icon _iconeCampoObrigatorio = Icon(
      Icons.star,
      color: Colors.red,
    );

    var mascaraTelefone = MaskTextInputFormatter(
        mask: '(##) ####-####', filter: {'#': RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(title: Text("Formulários de Validação"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          tooltip: "salvar",
          onPressed: onSubmit,
        )
      ]),
      body: Form(
          key: _formkey,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: _corIcones,
                ),
                trailing: _iconeCampoObrigatorio,
                title: TextFormField(
                  onChanged: (valor) => _usuario.nome = valor,
                  validator: requerido,
                  decoration: InputDecoration(hintText: "nome"),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: _corIcones,
                ),
                trailing: _iconeCampoObrigatorio,
                title: TextFormField(
                  onChanged: (valor) => _usuario.telefone = valor,
                  inputFormatters: [mascaraTelefone],
                  validator: requerido,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(hintText: "telefone"),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.mail,
                  color: _corIcones,
                ),
                trailing: _iconeCampoObrigatorio,
                title: TextFormField(
                  onChanged: (valor) => _usuario.email = valor,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [mascaraTelefone],
                  validator: requerido,
                  decoration: InputDecoration(hintText: "E-mail"),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.security,
                  color: _corIcones,
                ),
                trailing: _iconeCampoObrigatorio,
                title: TextFormField(
                  onChanged: (valor) => _usuario.senha = valor,
                  obscureText: true,
                  inputFormatters: [mascaraTelefone],
                  validator: requerido,
                  decoration: InputDecoration(hintText: "Senha"),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.copyright,
                  color: _corIcones,
                ),
                title: TextFormField(
                  obscureText: true,
                  validator: confirmacaoSenha,
                  decoration: InputDecoration(hintText: "Confirme a Senha"),
                ),
              ),
            ],
          )),
    );
  }
}
