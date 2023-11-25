import 'package:flutter/material.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            children: [
        TextField(
        // onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        hintText: "Search",
        suffixIcon: const Icon(Icons.search),
        // prefix: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(),
        ),
      ),
    ),
    ],
    ),
    ),
    );
  }
}
