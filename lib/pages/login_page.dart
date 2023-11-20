import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicon_card/pages/inicial_page.dart';
import 'package:sicon_card/widget/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool olho = true;

  void visibility() {
    setState(() {
      olho = !olho;
    });
  }

  final _formKey = GlobalKey<FormState>();

  final _usuarioController = TextEditingController();

  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Image.asset('images/chat.png'),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 90),
                    child: Image.asset(
                      'images/siconcardimage.png',
                      width: 295,
                      height: 75,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  LoginTextField(
                    keyboardType: TextInputType.text,
                    controller: _usuarioController,
                    validar: (String value) {
                      if (value.isEmpty) {
                        return 'Usuário não pode ser nullo';
                      } else {
                        return null;
                      }
                    },
                    icon: const Icon(
                      Icons.person_outline_sharp,
                      size: 30,
                      color: Color(0xFF550F12),
                    ),
                    name: 'Usuário',
                    isObscureText: false,
                  ),
                  LoginTextField(
                    keyboardType: TextInputType.number,
                    controller: _senhaController,
                    validar: (String value) {
                      if (value.isEmpty) {
                        return 'A senha não pode ser nulla';
                      } else {
                        return null;
                      }
                    },
                    sufiIcon: IconButton(
                      onPressed: () {
                        visibility();
                      },
                      icon: olho == false
                          ? const Icon(
                              Icons.visibility,
                              color: Color(0xFF550F12),
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Color(0xFF550F12),
                            ),
                    ),
                    icon: const Icon(
                      Icons.password,
                      size: 30,
                      color: Color(0xFF550F12),
                    ),
                    name: 'Senha',
                    isObscureText: olho,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF550F12),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(const InicialPage());
                          _senhaController.clear();
                        } else {
                          return;
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Esqueci minha senha',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF555555)),
                  ),
                  const SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
