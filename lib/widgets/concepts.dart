import 'package:flutter/material.dart';

class ConceptsWidget extends StatelessWidget {
  const ConceptsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 6,
            height: 80,
            child: const Card(
                color: Colors.white60,
                surfaceTintColor: Colors.white60,
                elevation: 7,
                shadowColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Padding(
                    padding: EdgeInsets.all(12), child: FlutterLogo()))));
  }
}
