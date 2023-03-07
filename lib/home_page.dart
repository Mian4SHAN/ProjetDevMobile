import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmobile/profil.dart';
import 'package:flutter/material.dart';

import 'article.dart';
import 'détail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Vetement> _vetements = [];

  @override
  void initState() {
    super.initState();
    _getVetements();
  }

  void _getVetements() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('vetements').get();
    List<Vetement> vetements = [];
    snapshot.docs.forEach((doc) {
      Vetement vetement = Vetement(
        nom: doc['titre'],
        description: doc['img'],
        prix: doc['prix'],
        taille: doc['taille'],
      );
      vetements.add(vetement);
    });
    setState(() {
      _vetements = vetements;
    });
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
          )
      ),
      body: ListView.builder(
        itemCount: _vetements.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(_vetements[index].description),
            title: Text(_vetements[index].nom),
            subtitle: Text(_vetements[index].taille),
            trailing: Text('\$${_vetements[index].prix.toStringAsFixed(2)}'),
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => Detail(vetement: _vetements[index])));
            },
          );
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: const Icon(Icons.local_mall),
              label: "panier"
          ),

          new BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: "achat"
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: "profil",
          )
        ],
      ),
    );

  }


  /*Future profil() async{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Profil()));
      }

      Future home() async{
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      }*/



}