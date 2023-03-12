import 'package:devmobile/profil.dart';
import 'package:flutter/material.dart';
import 'article.dart';
import 'home_page.dart';

class Panier {
  static List<ArticlePanier> _articles = [];

  static void ajouterAuPanier(Vetement vetement, int quantite) {
    int index = _articles.indexWhere((element) => element.vetement == vetement);
    if (index >= 0) {
      _articles[index].quantite += quantite;
    } else {
      _articles.add(ArticlePanier(vetement: vetement, quantite: quantite));
    }
  }

  static void supprimerDuPanier(ArticlePanier article) {
    _articles.remove(article);
  }

  static double getTotal() {
    double total = 0;
    for (var article in _articles) {
      total += article.getTotal();
    }
    return total;
  }

  static List<ArticlePanier> getArticles() {
    return _articles;
  }
}

class ArticlePanier {
  final Vetement vetement;
  int quantite;

  ArticlePanier({required this.vetement, required this.quantite});

  double getTotal() {
    return vetement.prix * quantite;
  }
}

class PanierPage extends StatefulWidget {
  @override
  _PanierPageState createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  List<ArticlePanier> _articles = Panier.getArticles();

  @override
  Widget build(BuildContext context) {
    double total = Panier.getTotal();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        title: Text('Mon Panier',
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
          ),],
      ),
      body: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Image.network(_articles[index].vetement.description),
                title: Text(_articles[index].vetement.nom),
                subtitle: Text(
                    'Quantité : ${_articles[index].quantite} | Prix total : \$${_articles[index].getTotal().toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      Panier.supprimerDuPanier(_articles[index]);
                      _articles = Panier.getArticles();
                    });
                  },
                ),
              );
            },
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.local_mall), label: 'Home'),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: 'Panier'),
          BottomNavigationBarItem(icon: const Icon(Icons.account_circle), label: 'Profil'),],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue[300],  
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total : \$${total.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  int _selectedIndex = 1;

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
          MaterialPageRoute(builder: (context) =>  PanierPage()),
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