import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late String _mail;
  late String _mdp;
  late String _dateAnniv;
  late String _adress;
  late String _codePostal;
  late String _ville;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {

    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    print(snapshot);
    print(snapshot.docs[0]['mail']);
    if (snapshot.docs.isNotEmpty) {
      setState(() {
        _mail = snapshot.docs[0]['mail'];
        _mdp = snapshot.docs[0]['mdp'];
        _dateAnniv = snapshot.docs[0]['dateAnniv'];
        _adress = snapshot.docs[0]['adresse'];
        _codePostal = snapshot.docs[0]['codePostal'];
        _ville = snapshot.docs[0]['ville'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: 8.0),
            Text('Mon profil', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ],
        ),
      ),
      body: _mail != null
          ? ListView(
        children: [
          _buildInfoTile('Email', _mail),
          _buildInfoTile('Mot de passe', _mdp),
          _buildInfoTile('Date de naissance', _dateAnniv),
          _buildInfoTile('Adresse', _adress),
          _buildInfoTile('Code postal', _codePostal),
          _buildInfoTile('Ville', _ville),
        ],
      )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.local_mall), label: 'Panier'),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: 'Achat'),
          BottomNavigationBarItem(icon: const Icon(Icons.account_circle), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[300],
      ),
    );
  }

  Widget _buildInfoTile(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text(value),
      ),
    );
  }
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
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
