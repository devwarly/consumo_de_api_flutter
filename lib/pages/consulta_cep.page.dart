import 'package:flutter/material.dart';

class ConsultaCepPage extends StatefulWidget {
  const new({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  TextEditingController cepController = TextEditingController();

  void consultarCep(){}

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
          ],
        ),
      ),
    );
  }
}
