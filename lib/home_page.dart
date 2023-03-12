import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmobile/panier.dart';
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
                  fontSize: 24,
                  color: Colors.white,
              ),
          ),
          actions: [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          ),
          IconButton(
         icon: Icon(Icons.notifications),
          onPressed: () {},
          ),],
      ),
      body: ListView.builder(
        itemCount: _vetements.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              leading: Image.network(
                _vetements[index].description,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.contain,
              ),
              title: Text(
                _vetements[index].nom,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                'Taille: ${_vetements[index].taille}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[800],
                ),
              ),
              trailing: Text(
                '\$${_vetements[index].prix.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.blue[700],
                ),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(vetement: _vetements[index])),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: const Icon(Icons.local_mall),
              label: "Home"
          ),

          new BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: "Panier"
          ),

          new BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: "Profil",
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[300],
      ),
    );

  }
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PanierPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Profil()),
        );
        break;
    }
  }

}