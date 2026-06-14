import 'package:flutter/material.dart';

class SimuladorInvestimentoPage extends StatefulWidget {
  const SimuladorInvestimentoPage({super.key});

  @override
  State<SimuladorInvestimentoPage> createState() =>
      _SimuladorInvestimentoPageState();
}

class _SimuladorInvestimentoPageState
    extends State<SimuladorInvestimentoPage> {

  final TextEditingController valorController =
      TextEditingController();

  final TextEditingController taxaController =
      TextEditingController();

  final TextEditingController mesesController =
      TextEditingController();

  double resultado = 0;
  bool mostrarResultado = false;

  void calcular() {
    double valor =
        double.tryParse(valorController.text) ?? 0;

    double taxa =
        double.tryParse(taxaController.text) ?? 0;

    int meses =
        int.tryParse(mesesController.text) ?? 0;

    double montante = valor;

    for (int i = 0; i < meses; i++) {
      montante *= (1 + taxa / 100);
    }

    setState(() {
      resultado = montante;
      mostrarResultado = true;
    });
  }

  Widget campo(
    String texto,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: TextField(
        controller: controller,

        keyboardType: TextInputType.number,

        decoration: InputDecoration(
          hintText: texto,

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF006B1F),

        title: const Text(
          'Simulador',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [

            campo(
              'Valor Inicial (R\$)',
              valorController,
            ),

            campo(
              'Taxa Mensal (%)',
              taxaController,
            ),

            campo(
              'Meses',
              mesesController,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),

                onPressed: calcular,

                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            AnimatedOpacity(
              opacity: mostrarResultado ? 1 : 0,
              duration: const Duration(
                milliseconds: 800,
              ),

              child: Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20),

                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black12,
                    ),
                  ],
                ),

                child: Text(
                  'Valor Final: R\$ ${resultado.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}