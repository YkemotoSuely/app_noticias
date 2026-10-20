import 'dart:convert';

import '../models/categoria.dart';
import 'package:http/http.dart' as http;

class CategoriasService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<Categoria>> getCategorias() async {
    try {
      final resposta = await http.get(Uri.parse('$baseUrl/categorias'));

      if (resposta.statusCode == 200) {
        final List dados = jsonDecode(resposta.body);
        return dados.map((item) => Categoria.fromJson(item)).toList();
      } else {
        throw Exception("Não foi possível carregar as categorias");
      }
    } catch (e) {
      throw Exception("Não conectou erro: $e");
    }
  }
}
