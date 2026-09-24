import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, String>> listaNoticias = [
    {
      'titulo': 'Nova IA generativa revoluciona a criação de aplicativos',
      'resumo':
          'Ferramenta promete reduzir o tempo de desenvolvimento de apps mobile em até 50% utilizando inteligência artificial avançada.',
      'categoria': 'Tecnologia',
      'data': '2026-09-23',
    },
    {
      'titulo': 'Seleção Brasileira vence amistoso internacional por 3 a 1',
      'resumo':
          'Com atuação de gala dos estreantes, o time garante a vitória e mostra evolução tática sob o comando do novo treinador.',
      'categoria': 'Esportes',
      'data': '2026-09-22',
    },
    {
      'titulo': 'Inflação recua e Banco Central projeta corte na taxa de juros',
      'resumo':
          'O índice de preços ao consumidor fechou o mês abaixo das expectativas, trazendo otimismo para o mercado financeiro.',
      'categoria': 'Economia',
      'data': '2026-09-21',
    },
    {
      'titulo':
          'Festival de Cinema de Gramado divulga lista de filmes premiados',
      'resumo':
          'O grande vencedor da noite levou quatro estatuetas, incluindo as categorias de Melhor Filme e Melhor Direção.',
      'categoria': 'Cultura',
      'data': '2026-09-20',
    },
    {
      'titulo': 'Cientistas descobrem nova espécie de planta na Amazônia',
      'resumo':
          'A espécie possui propriedades botânicas únicas que podem auxiliar no desenvolvimento de novos medicamentos fitoterápicos.',
      'categoria': 'Ciência',
      'data': '2026-09-19',
    },
  ];

  static final List<String> categorias = [
    "Todas",
    'Tecnologia',
    'Esportes',
    'Economia',
    'Cultura',
    'Ciência',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/img/logotipo.png',
          height: 22,
        ),
        centerTitle: true,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              children: categorias.map((categoria) {
                final selecionada = categoria == "Todas";

                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selecionada
                          ? Colors.black
                          : const Color(0xFFEDEDED),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(categoria, style: const TextStyle(fontSize: 12)),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
