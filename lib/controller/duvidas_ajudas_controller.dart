import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicon_card/model/duvidas_ajudas_model.dart';

class DuvidasAjudasController extends GetxController {
  final controllerPerguntas = TextEditingController();

  RxList<DuvidasAjudasModel> perguntas = <DuvidasAjudasModel>[
    DuvidasAjudasModel(name: 'Como posso recuperar minha senha do cartão?'),
    DuvidasAjudasModel(name: 'Como faço para bloquear meu cartão?'),
    DuvidasAjudasModel(name: 'Quais são os benefícios do meu cartão?'),
    DuvidasAjudasModel(name: 'Como visualizar minha fatura atual?'),
    DuvidasAjudasModel(name: 'Como faço para ativar meu cartão?'),
    DuvidasAjudasModel(
        name: 'Posso adicionar um cartão de crédito adicional à minha conta?'),
    DuvidasAjudasModel(
        name: 'Como funciona o processo de contestação de uma transação?'),
    DuvidasAjudasModel(name: 'Como posso aumentar meu limite de crédito?'),
    DuvidasAjudasModel(name: 'Quais são as taxas associadas ao meu cartão?'),
  ].obs;

  List<DuvidasAjudasModel> perguntasOriginais = <DuvidasAjudasModel>[];

  @override
  void onInit() {
    super.onInit();
    // Copia os dados originais para a lista perguntasOriginais
    perguntasOriginais.addAll(perguntas);
  }

  void pesquisar(String value) {
    if (value.isEmpty) {
      // Se o campo de pesquisa estiver vazio, redefina a lista para o estado original
      perguntas.addAll(perguntasOriginais);
    } else {
      final perguntasFiltradas = perguntasOriginais
          .where((e) => e.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
      perguntas.assignAll(perguntasFiltradas);
    }
  }
}
