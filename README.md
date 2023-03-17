# devmobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

##Lancer le code 
Pour démarrer le projet : lancer l'application avec Edge(web) 

##Login & Password du compte par defaut
Login : test@hotmail.com 
MDP : 123456

##Realisation 
Interface de login : 
- Critère d’acceptance #1 : Au lancement de l’application, une interface de login composée d’un headerBar
  qui contient le nom de l’application, de deux champs et d’un bouton m’est proposée
- Critère d’acceptance #2 : Les deux champs de saisie sont : Login et Password
- Critère d’acceptance #3 : Le champ de saisie du password est obfusqué
- Critère d’acceptance #4 : Le label du bouton est : Se connecter 
- Critère d’acceptance #5 : Au clic sur le bouton « Se connecter », une vérification en base est réalisée.
  Si l’utilisateur existe, celui-ci est redirigé sur la page suivante. Si celui-ci n’existe pas, à minima un log
  est affiché dans la console et l’application reste fonctionnelle
- Critère d’acceptance #6 : Au clic sur le bouton « Se connecter » avec les deux champs vides, l’application
  doit rester fonctionnelle

Liste de vêtements :
- Critère d’acceptance #1 : Une fois connecté, l’utilisateur arrive sur cette page composée du contenu
principal et d’une BottomNavigationBar composée de trois entrées et leurs icones correspondantes : Acheter, Panier et Profil
- Critère d’acceptance #2 : La page actuelle est la page Acheter. Son icone et son texte sont d’une couleur
différente des autres entrées
- Critère d’acceptance #3 : Une liste déroulante de tous les vêtements m’est proposé à l’écran
- Critère d’acceptance #4 : Chaque vêtement affiche les informations suivantes :
• Une image (ne pas gérer les images dans l’application, seulement insérer des liens vers des
images d’internet)
• Un titre
• La taille
• Le prix
- Critère d’acceptance #5 : Au clic sur une entrée de la liste, le détail est affiché (voir US#3)
- Critère d’acceptance #6 : Cette liste de vêtements est récupérée de la base de données
  
Détail d’un vêtement
- Critère d’acceptance #1 : La page de détail est composée des informations suivantes :
• Une image
• Un titre
• La taille
• La marque
• Le prix
- Critère d’acceptance #2 : La page est également composée d’un bouton « Retour » pour retourner à la
liste des vétements et d’un bouton « Ajouter au panier », ajoutant le vêtement dans le panier de
l’utilisateur (ajout en base)

Le panier
- Critère d’acceptance #1 : Au clic sur le bouton « Panier », la liste des vêtements du panier de l’utilisateur
est affichée avec les informations suivantes :
• Une image (ne pas gérer les images dans l’application, seulement insérer des liens vers des
images d’internet)
• Un titre
• La taille
• Le prix
- Critère d’acceptance #2 : Un total général est affiché à l’utilisateur (somme de tous les vêtements du
panier)
- Critère d’acceptance #3 : A droite de chaque vetement, une croix permet à l’utilisateur de retirer un
produit. Au clic sur celle-ci, le produit est retiré de la liste et le total général mis à jour
- Critère d’acceptance #4 : Aucun autre bouton d’action n’est présent sur la page (pas de paiement pour
le moment)
  
Profil utilisateur
- Critère d’acceptance #1 : Au clic sur le bouton « Profil », les informations de l’utilisateur s’affichent
(récupérées en base de données)
- Critère d’acceptance #2 : Les informations sont :
• Le login (readonly)
• Le password (offusqué)
• L’anniversaire
• L’adresse
• Le code postal (affiche le clavier numérique et n’accepte que les chiffres)
• La ville
- Critère d’acceptance #4 : Un bouton « Se déconnecter » permet de revenir à la page de login
