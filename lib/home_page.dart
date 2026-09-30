import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Map<String, dynamic>> noticias = [
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
          //digito: 'ListView', clico na lâmpada e seleciono a opção: 'Wrap with Expanded' para programa assumir a função: Expanded, pois não podemos usar + 1 ListView dentro de uma Column
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: noticias.length,
              itemBuilder: (context, index) {
                final noticia = noticias[index];
                //
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  color: Colors.white,
                  clipBehavior: Clip.antiAlias, //arredonda os cantos dos cards
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0XFFCBD2D9),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120,
                        color: const Color(0xFFE4E9Ef),
                        child: const Icon(Icons.image_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsetsGeometry.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0XFFeFF4FF),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  child: Text(noticia['categoria']),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  noticia['data'],
                                  style: const TextStyle(
                                    color: Color(0XFF858D96),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              noticia['titulo'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF1b2A4A),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              noticia['resumo'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0XFF5B6B79),
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
