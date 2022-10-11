import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/test_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.presenter});

  final LoginPresenter presenter;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        (MediaQuery.of(context).size.height > 350 ? .30 : .25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text(
                        'Login',
                        style: context.textStyle.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    validator: Validatorless.multiple([
                      Validatorless.required('Campo obrigatório'),
                      Validatorless.email('Email inválido'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordEC,
                    decoration: const InputDecoration(
                      label: Text('Senha'),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    obscureText: true,
                    validator: Validatorless.required('campo obrigatório'),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      'Esqueceu a senha?',
                      style: context.textStyle.textSecondaryFontMedium.copyWith(
                        fontSize: 14,
                        color: context.color.yellow,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Button(
                    width: MediaQuery.of(context).size.width * .9,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        showLoader();
                        widget.presenter.login(
                          email: emailEC.text,
                          password: passwordEC.text,
                        );
                      }
                    },
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyle.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Entrar',
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                            text: 'Não possui uma conta? ',
                            style: context.textStyle.textSecondaryFontMedium
                                .copyWith(
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: 'Cadastre-se ',
                                style: context.textStyle.textSecondaryFontMedium
                                    .copyWith(
                                  color: context.color.yellow,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (() => Navigator.of(context)
                                      .pushNamed('/auth/register')),
                              ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
