

import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF2F2F2),
      ),

      home: const LoginPage(),
    );
  }
}

// LOGIN

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          // TOPO VERDE
          Container(
            height: 120,
            width: double.infinity,

            decoration: const BoxDecoration(
              color: Color(0xFF006B1F),
            ),

            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    // LOGO
                    Container(
                      width: 60,
                      height: 60,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),

                      child: const Center(
                        child: Text(
                          'Ð',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // PERFIL
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.purple,

                      child: Text(
                        'J',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 35),

          // LOGO GRANDE
          Container(
            width: 130,
            height: 130,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              shape: BoxShape.circle,
            ),

            child: const Center(
              child: Text(
                'Ð',
                style: TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 35),

          // ÁREA LOGIN
          Expanded(
            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(25),

              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),

              child: Column(
                children: [

                  Container(
                    width: 70,
                    height: 4,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 40),

                  // EMAIL
                  TextField(
                    decoration: InputDecoration(
                      hintText: '@gmail.com',

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // SENHA
                  TextField(
                    obscureText: true,

                    decoration: InputDecoration(
                      hintText: '********',

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // BOTÃO ENTRAR
                  SizedBox(
                    width: 200,
                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },

                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // CRIAR CONTA
                  TextButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CadastroPage(),
                        ),
                      );
                    },

                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CADASTRO

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  Widget campo(String texto) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),

      child: TextField(
        decoration: InputDecoration(
          hintText: texto,

          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
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
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: ListView(
          children: [

            const Text(
              'Nome',
              style: TextStyle(fontSize: 18),
            ),

            campo('Digite seu nome'),

            const Text(
              'Telefone',
              style: TextStyle(fontSize: 18),
            ),

            campo('(xx)xxxxx-xxxx'),

            const Text(
              'E-mail',
              style: TextStyle(fontSize: 18),
            ),

            campo('@gmail.com'),

            const Text(
              'Senha',
              style: TextStyle(fontSize: 18),
            ),

            campo('********'),

            const Text(
              'Confirmar senha',
              style: TextStyle(fontSize: 18),
            ),

            campo('********'),

            const SizedBox(height: 20),

            SizedBox(
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),

                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
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

// HOME

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget cardMenu({
    required IconData icon,
    required String texto,
    required VoidCallback onTap,
  }) {

    return InkWell(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 25),

        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(25),

          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
            ),
          ],
        ),

        child: Column(
          children: [

            Icon(
              icon,
              size: 70,
              color: Colors.green,
            ),

            const SizedBox(height: 10),

            Text(
              texto,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
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
          'Finance App',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),

        child: ListView(
          children: [

            cardMenu(
              icon: Icons.trending_up,
              texto: 'Investimentos',

              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tela na Parte 2'),
                  ),
                );
              },
            ),

            cardMenu(
              icon: Icons.savings,
              texto: 'Poupança',

              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tela na Parte 2'),
                  ),
                );
              },
            ),

            cardMenu(
              icon: Icons.pie_chart,
              texto: 'Despesas',

              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tela na Parte 2'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
