import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {

  // Pega o Cep digitado pelo usuário
  TextEditingController cepController = TextEditingController();

  String resultado = "";

  // Função para consultar o Cep
  Future<void> consultarCep() async{

    

    // Montando a URL para consultar o Cep
    String url = "https://viacep.com.br/ws/${cepController.text.trim()}/json/";

    var response = await http.get(Uri.parse(url));

    Map dados = json.decode(response.body);

    setState((){
      resultado = "Cep: ${dados["cep"]}\n"
          "Logradouro: ${dados["logradouro"]}\n"
          "Bairro: ${dados["bairro"]}\n"
          "Cidade: ${dados["localidade"]}\n"
          "Estado: ${dados["uf"]}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta Cep"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),

        child: Column(
          children: [
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite seu CEP",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(onPressed: consultarCep, child: const Text("Consultar")),

            const SizedBox(height: 20,),

            // Alterado para exibir a variável resultado
            Text(resultado, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}