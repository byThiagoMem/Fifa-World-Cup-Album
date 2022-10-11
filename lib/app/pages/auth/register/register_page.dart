import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';
import 'package:fwc_album/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.presenter});

  final RegisterPresenter presenter;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bola.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Cadastrar usuário',
                style: context.textStyle.titleBlack,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEC,
                      decoration: const InputDecoration(
                        label: Text('Nome completo*'),
                      ),
                      validator: Validatorless.required('Campo obrigatório'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailEC,
                      decoration: const InputDecoration(
                        label: Text('Email*'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.email('E-mail obrigatório'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordEC,
                      decoration: const InputDecoration(
                        label: Text('Senha*'),
                      ),
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Campo obrigatório'),
                        Validatorless.min(
                          6,
                          'Deve conter ao menos 6 caracteres',
                        ),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: confirmPasswordEC,
                        decoration: const InputDecoration(
                          label: Text('Confirma senha*'),
                        ),
                        obscureText: true,
                        validator: Validatorless.multiple([
                          Validatorless.required('Campo obrigatório'),
                          Validatorless.compare(
                            passwordEC,
                            'Senha diferente de confirma senha',
                          ),
                        ])),
                    const SizedBox(height: 20),
                    Button.primary(
                      onPressed: () {
                        showLoader();
                        if (formKey.currentState?.validate() ?? false) {
                          widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            confirmPassword: confirmPasswordEC.text,
                          );
                        }
                      },
                      label: 'Cadastrar',
                      width: MediaQuery.of(context).size.width * .9,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
