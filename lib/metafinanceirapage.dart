import 'package:flutter/material.dart';

class MetaFinanceiraPage extends StatefulWidget {
  const MetaFinanceiraPage({super.key});

  @override
  State<MetaFinanceiraPage> createState() =>
      _MetaFinanceiraPageState();
}

class _MetaFinanceiraPageState extends State<MetaFinanceiraPage> {

  final TextEditingController metaController =
      TextEditingController();

  final TextEditingController atualController =
      TextEditingController();

  double porcentagem = 0;
  double falta = 0;
  bool mostrarResultado = false;

  void calcularMeta() {

    double meta =
        double.tryParse(metaController.text) ?? 0;

    double atual =
        double.tryParse(atualController.text) ?? 0;

    if (meta <= 0) return;

    setState(() {

      porcentagem = (atual / meta) * 100;

      if (porcentagem > 100) {
        porcentagem = 100;
      }

      falta = meta - atual;

      if (falta < 0) {
        falta = 0;
      }

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
          "Meta Financeira",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(

          children: [

            campo(
              "Valor da Meta (R\$)",
              metaController,
            ),

            campo(
              "Quanto você já possui",
              atualController,
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 55,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),

                onPressed: calcularMeta,

                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            AnimatedSwitcher(

              duration: const Duration(
                milliseconds: 700,
              ),

              child: mostrarResultado
                  ? Container(
                      key: const ValueKey(1),

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

                      child: Column(

                        children: [

                          Text(
                            "${porcentagem.toStringAsFixed(1)}% da meta concluída",

                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Text(
                            "Faltam R\$ ${falta.toStringAsFixed(2)}",

                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),

                        ],
                      ),
                    )
                  : const SizedBox(
                      key: ValueKey(0),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}