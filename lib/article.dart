import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Vetement {
  final String nom;
  final String description;
  final double prix;
  final String taille;

  Vetement({required this.nom, required this.description, required this.prix, required this.taille});
}

class VetementList extends StatefulWidget {
  @override
  _VetementListState createState() => _VetementListState();
}

class _VetementListState extends State<VetementList> {
  List<Vetement> _vetements = [];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste de vêtements'),
      )
    );
  }
}