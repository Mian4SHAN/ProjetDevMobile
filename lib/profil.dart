import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devmobile/panier.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

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

  void _saveUserData() async {
    await FirebaseFirestore.instance.collection('users').doc('user1').set({
      'mail': _mail,
      'mdp': _mdp,
      'dateAnniv': _dateAnniv,
      'adresse': _adress,
      'codePostal': _codePostal,
      'ville': _ville,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Données sauvegardées')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text('Mon Profil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          TextButton(
            onPressed: _saveUserData,
            child: Text('Valider', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: _mail != null
          ? ListView(
        children: [
          _buildEditableTextField('Email', _mail, (value) => setState(() => _mail = value)),
          _buildEditableTextField('Mot de passe', '********', (value) => setState(() => _mdp = value)),
          _buildEditableTextField('Date de naissance', _dateAnniv, (value) => setState(() => _dateAnniv = value)),
          _buildEditableTextField('Adresse', _adress, (value) => setState(() => _adress = value)),
          _buildEditableTextField('Code postal', _codePostal, (value) => setState(() => _codePostal = value)),
          _buildEditableTextField('Ville', _ville, (value) => setState(() => _ville = value)),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Déconnexion'),
            ),
          ),
        ],
      )
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.local_mall), label: 'Home'),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: 'Panier'),
          BottomNavigationBarItem(icon: const Icon(Icons.account_circle), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[300],
      ),
    );
  }

  Widget _buildEditableTextField(String label, String value, void Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 8.0),
          TextFormField(
            initialValue: value,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 2;

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
