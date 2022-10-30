import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/pages/auth/register/presenter/register_presenter.dart';
import 'package:fwc_album/app/pages/auth/register/view/register_view_impl.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';

class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({super.key, required this.presenter});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {
  final formKey = GlobalKey<FormState>();
  final nameEc = TextEditingController();
  final emailEc = TextEditingController();
  final passwordEc = TextEditingController();
  final confirmPasswordEc = TextEditingController();

  @override
  void dispose() {
    nameEc.dispose();
    emailEc.dispose();
    passwordEc.dispose();
    confirmPasswordEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              Container(
                height: 106.82,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/bola.png'),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'Cadastrar usuário',
                style:
                    context.textStyles.titleWhite.copyWith(color: Colors.black),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameEc,
                      decoration: const InputDecoration(
                        label: Text('Nome completo'),
                      ),
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: emailEc,
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.email('E-mail inválido')
                      ]),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: passwordEc,
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres'),
                      ]),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      controller: confirmPasswordEc,
                      decoration: const InputDecoration(
                        label: Text('Confirme a senha'),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(
                            6, 'Senha deve conter pelo menos 6 caracteres'),
                        Validatorless.compare(
                            passwordEc, 'Senha devem ser iguais')
                      ]),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Button.primary(
                      onPressed: () {
                        final formValid =
                            formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          showLoader();
                          widget.presenter.register(
                            name: nameEc.text,
                            email: emailEc.text,
                            password: passwordEc.text,
                            confirmPassword: confirmPasswordEc.text,
                          );
                        }
                      },
                      width: MediaQuery.of(context).size.width * 0.9,
                      label: 'Cadastrar',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
