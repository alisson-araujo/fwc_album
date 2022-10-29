import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';

import '../../../core/ui/widgets/button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Form(
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
                      decoration: const InputDecoration(
                        label: Text('Nome completo'),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail'),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Confirme a senha'),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Button.primary(
                      onPressed: () {},
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
