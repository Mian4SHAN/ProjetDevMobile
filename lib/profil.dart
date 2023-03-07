import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _Profil  createState() => _Profil();
}

Future users() async {
  var firestore = FirebaseFirestore.instance;
  QuerySnapshot qn = await firestore.collection("users").get();
  return qn.docs;
}

class _Profil  extends State<Profil > {
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
      body: Container(
        child: FutureBuilder(
            future: users(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(snapshot.data[index].data()["nom"]),
                        subtitle: Text(snapshot.data[index].data()["prenom"]),
                      );
                    });
              }
            }),
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
                label: "profil"
            )
          ]

      ),
    );
  }

}