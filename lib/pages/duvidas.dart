import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicon_card/controller/duvidas_ajudas_controller.dart';
import 'package:sicon_card/widget/app_bar_padrao.dart';

class DuvidasAjudas extends StatefulWidget {
  const DuvidasAjudas({super.key});

  @override
  State<DuvidasAjudas> createState() => _DuvidasAjudasState();
}

class _DuvidasAjudasState extends State<DuvidasAjudas> {
  
  final controler = Get.put(DuvidasAjudasController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(19, 55),
        child: AppBarPadrao(
          isMenu: true,
          titulo: 'Duvidas e Ajudas ',
          isArrowBack: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (String value) {
                  controler.pesquisar(controler.controllerPerguntas.text);
                },
                controller: controler.controllerPerguntas,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Pesquisar',
                  border: OutlineInputBorder(),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controler.perguntas.length,
                    itemBuilder: (cotext, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              controler.perguntas[index].name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
