import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicon_card/widget/app_bar_padrao.dart';

class ContatosPessoais extends StatefulWidget {
  const ContatosPessoais({super.key});

  @override
  State<ContatosPessoais> createState() => _ContatosPessoaisState();
}

class _ContatosPessoaisState extends State<ContatosPessoais> {
  final controllerName = TextEditingController();

  List<String> listUsers = [];

  // salva uma lista de usuarios permanentemente
  void salvarUsuario(String value) async {
    final prefs = await SharedPreferences.getInstance();
    // adiciona um novo usuario a listUsers
    listUsers.add(value);
    // espera setStringList (permite salvar uma lista e strings)e duas chaves listUsers e listUsers
    await prefs.setStringList('listUsers', listUsers);
    setState(() {});
  }

  // incrementa um usuario a listUsers
  void incrementarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // prefs.getStringList('listUsers') Obtém a lista de strings associada à chave 'listUsers'
      listUsers = prefs.getStringList('listUsers') ?? [];
    });
  }

  void removerUsuario(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      listUsers.removeAt(index);
    });
    await prefs.setStringList('listUsers', listUsers);
  }

  @override
  void initState() {
    super.initState();
    incrementarUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF550F12),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Adicionar um novo Contato'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      controller: controllerName,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Novo Contato',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Não'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              salvarUsuario(controllerName.text);
                              controllerName.clear();
                              Get.back();
                            });
                          });
                        },
                        child: const Text('Sim'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          child: const Icon(Icons.person_add_alt_1_outlined),
        ),
        appBar: const PreferredSize(
          preferredSize: Size(19, 55),
          child: AppBarPadrao(
            imagem: null,
            isMenu: true,
            titulo: 'Contatos Pessoais',
            isArrowBack: true,
          ),
        ),
        body: listUsers.isEmpty
            ? const Center(child: Text('Sua lista de contatos está vazia'))
            : ListView.builder(
                itemCount: listUsers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Editar Nome do Usuário'),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 10),
                                        child: TextFormField(
                                          onChanged: (String newValue) {
                                            setState(() {
                                              listUsers[index] = newValue;
                                            });
                                          },
                                          decoration: InputDecoration(
                                            labelText: listUsers[index],
                                            prefixIcon:
                                                const Icon(Icons.person),
                                            border: const OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text('Não'),
                                          ),
                                          const SizedBox(width: 10),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                Get.back();
                                              });
                                            },
                                            child: const Text('Sim'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 23,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                removerUsuario(index);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 23,
                              ),
                            ),
                          ],
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [BoxShadow(blurRadius: 1)],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.person,
                              size: 23,
                            ),
                          ),
                        ),
                        title: Text(
                          listUsers[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
