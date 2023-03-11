import 'package:flutter/material.dart';
import 'article.dart';
import 'panier.dart';

class Detail extends StatefulWidget {
  final Vetement vetement;
  const Detail({Key? key, required this.vetement}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int _quantite = 1;

  void _ajouterAuPanier() {
    Panier.ajouterAuPanier(widget.vetement, _quantite);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.vetement.nom} a été ajouté au panier.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.vetement.nom),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(widget.vetement.description),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.vetement.nom}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '\$${widget.vetement.prix.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Taille : ${widget.vetement.taille}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Description :',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${widget.vetement.description}',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantité',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_quantite > 1) {
                                  _quantite--;
                                }
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(
                            '$_quantite',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _quantite++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _ajouterAuPanier,
                    child: Text('Ajouter au panier'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
