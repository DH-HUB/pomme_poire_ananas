import 'package:flutter_test/flutter_test.dart';
import 'package:pomme_poire_ananas/main.dart';
import 'package:flutter/material.dart';

void main() {
  // Ce test vérifie que le widget MyHomePage est créé avec succès
  testWidgets('MyHomePage est créé', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Recherche du widget MyHomePage dans l'arborescence des widgets
    final titleFinder = find.text('Pomme, Poire et Ananas');
    expect(titleFinder,
        findsOneWidget); // Vérifie qu'un seul widget MyHomePage est trouvé
  });

  // Ce test vérifie que le compteur est initialisé à zéro
  testWidgets('Le compteur est initialisé à zéro', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Recherche du widget Text contenant la valeur initiale du compteur
    final counterTextFinder = find.text('0');
    expect(counterTextFinder,
        findsOneWidget); // Vérifie que le widget Text est trouvé
  });

  // Ce test vérifie que le compteur s'incrémente correctement après un clic sur le bouton FloatingActionButton
  testWidgets('Le compteur s\'incrémente après un clic',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Recherche du bouton FloatingActionButton
    final buttonFinder = find.byIcon(Icons.add);

    // Clic sur le bouton
    await tester.tap(buttonFinder);
    await tester.pump();

    // Recherche du widget Text affichant la nouvelle valeur du compteur
    final counterTextFinder = find.text('1');
    expect(counterTextFinder,
        findsOneWidget); // Vérifie que le widget Text est trouvé
  });
}
