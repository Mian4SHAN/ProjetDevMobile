import 'article.dart';

class Panier {
  static final Map<Vetement, int> _items = {};

  static void ajouterAuPanier(Vetement vetement, int quantite) {
    /*_items.putIfAbsent(vetement, () => 0);
    _items[vetement]! += quantite;
    print('Article ${vetement.nom} ajouté au panier : '
        'quantité = ${_items[vetement]}, '
        'prix total = ${vetement.prix * _items[vetement]!}');
    afficherPanier();*/
  }

  static void afficherPanier() {
    print('--- Contenu du panier ---');
    if (_items.isEmpty) {
      print('Le panier est vide.');
    } else {
      double prixTotal = 0;
      _items.forEach((vetement, quantite) {
        double prixArticle = vetement.prix * quantite;
        print('${vetement.nom} (taille : ${vetement.taille}) : '
            'quantité = $quantite, '
            'prix unitaire = \$${vetement.prix}, '
            'prix total = \$${prixArticle.toStringAsFixed(2)}');
        prixTotal += prixArticle;
      });
      print('Prix total : \$${prixTotal.toStringAsFixed(2)}');
    }
  }
}