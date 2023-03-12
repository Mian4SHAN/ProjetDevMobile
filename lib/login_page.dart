import 'package:devmobile/article.dart';
import 'package:devmobile/profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_page.dart';


class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // texte controleur pour le mail et mdp
  final emailControlleur = TextEditingController();
  final mdpControlleur = TextEditingController();

  //connexion
  Future signIn() async{
      await FirebaseFirestore.instance
          .collection('users')
          .where("mail", isEqualTo: emailControlleur.text)
          .where("mdp", isEqualTo: mdpControlleur.text)
          .get()
          .then((querySnapshot) async {
            if(querySnapshot.docs.isNotEmpty) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
        }       
          else{
              print("erreur");
          }
      });
  }

  @override
  void dispose(){
    super.dispose();
    emailControlleur.dispose();
    mdpControlleur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text('MIAGED',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            )
        ),
        automaticallyImplyLeading: false, // Ajout de cette ligne
      ),
      body: SafeArea (
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart, size: 80),
              SizedBox(height: 50),
              // Bienvenu~
              Text('Bienvenue,'
                  ' veuillez vous connecter pour faire votre shopping',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )
              ),
              SizedBox(height: 50),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: emailControlleur,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide : BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                      )
                  )
              ),

              SizedBox(height: 20),

              // password textfied
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    //rendre invisible
                    controller: mdpControlleur,
                    obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide : BorderSide(color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Mot de passe',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                  )
              ),
              SizedBox(height: 20),
              // sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                          'Connexion',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )
                      ),
                    ),
                  ),
                )
              ),
              SizedBox(height: 20),
              //not a member ? register

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pas de compte ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' Inscrivez vous maintenant',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }


}