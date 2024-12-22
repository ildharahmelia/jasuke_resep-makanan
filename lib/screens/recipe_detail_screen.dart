import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  final Map<String, String> recipe;

  const RecipeDetailPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          recipe['name']!,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          hoverColor: Colors.green,
          color: Colors.white,
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: AlwaysStoppedAnimation(0.5),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Resep dengan efek rounded dan shadow
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  recipe['image']!,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 20),
              // Nama Resep dengan tampilan bold dan warna hijau
              Text(
                recipe['name']!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 10),
              // Detail resep dengan style teks yang lebih halus
              Text(
                recipe['details']!,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      // FloatingActionButton dengan animasi
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action untuk tombol "Add to Favorites"
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}
