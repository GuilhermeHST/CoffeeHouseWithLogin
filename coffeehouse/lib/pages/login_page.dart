import 'package:flutter/material.dart';
import 'package:coffeehouse/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState  createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: buildBody(),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              buildCardCafeHeader(),
              const SizedBox(height: 42),
              TextFormField(
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return 'Campo e-mail obrigatório';
                  }
                  return null;
                },
                controller: userController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Usuário'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return 'Campo e-mail obrigatório';
                  }
                  return null;
                },
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-mail'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo senha obrigatório';
                  } else if (value.length < 8) {
                    return 'Senha deve possuir no mínimo 8 digitos';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Senha'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                style:
                ElevatedButton.styleFrom(primary: const Color(0xFF3E2723)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() {
    if (_formKey.currentState!.validate()) {
      String userDigitado = userController.text;
      String emailDigitado = emailController.text;
      String passwordDigitado = passwordController.text;

      String user = "iris";
      String email = "isf2@gmail.com";
      String password = "12345678";

      if (user == userDigitado && password == passwordDigitado && email == emailDigitado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      } else {
        print('Usuário/Senha incorretos');
      }
    } else {
      print("Erro na validação");
    }

  }

  buildCardCafeHeader() {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF8EFE9),
        image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/originals/55/57/43/555743eae8ab6f20333e5c55d0789713.jpg'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
          bottomRight: Radius.circular(36),
          bottomLeft: Radius.circular(36),
        ),
      ),
      padding: EdgeInsets.all(160),
    );
  }


  /*onPressed() {
    if (_formKey.currentState!.validate()) {
      String userDigitado = userController.text;
      String emailDigitado = emailController.text;
      String passwordDigitado = passwordController.text;

      String user = "iris";
      String email = "isf2@gmail.com";
      String password = "12345678";

      if (user == userDigitado && password == passwordDigitado && email == emailDigitado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      } else {
        print('Usuário/Senha/email incorretos');
      }
    } else {
      print("Erro na validação");
    }

  }

  buildBody() {
    return Container(
      child: ListView(
        children: [
          buildCardCafeHeader(),
          buildPadding(),
        ],
      ),
    );
  }
  buildPadding(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.black, fontSize: 25 ),
            decoration: InputDecoration(
                labelText: 'Usuário:',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25)),
          ),
          const SizedBox(height: 25),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.text,
            style: new TextStyle(color: Colors.black, fontSize: 25 ),
            decoration: InputDecoration(
                labelText: 'E-mail:',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25)),

          ),
          const SizedBox(height: 25),
          TextFormField(
            autofocus: true,
            obscureText: true,
            keyboardType: TextInputType.number,
            style: new TextStyle(color: Colors.black, fontSize: 25),
            decoration: InputDecoration(
                labelText: 'Senha:',
                labelStyle: TextStyle(color: Colors.black, fontSize: 25)),

          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: onPressed,
            style:
            ElevatedButton.styleFrom(primary: const Color(0xFF3E2723)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  */
}