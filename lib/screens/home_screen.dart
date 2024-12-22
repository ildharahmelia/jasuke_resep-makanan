import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/recipe_detail_screen.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allRecipes = [
    {
      'name': 'Nasi Goreng',
      'image':
          'https://asset.kompas.com/crops/VMupLYa-zBYTf5h5GnEjMW6-Nxg=/0x0:1000x667/1200x800/data/photo/2020/11/22/5fba747cef43d.jpg',
      'details': 'Resep untuk membuat nasi goreng dengan bahan-bahan sederhana.'
    },
    {
      'name': 'Mie Goreng',
      'image':
          'https://asset.kompas.com/crops/VMupLYa-zBYTf5h5GnEjMW6-Nxg=/0x0:1000x667/1200x800/data/photo/2020/11/22/5fba747cef43d.jpg',
      'details': 'Mie goreng yang pedas dan enak, cocok untuk makan malam.'
    },
    {
      'name': 'Sate Ayam',
      'image':
          'https://asset.kompas.com/crops/VMupLYa-zBYTf5h5GnEjMW6-Nxg=/0x0:1000x667/1200x800/data/photo/2020/11/22/5fba747cef43d.jpg',
      'details': 'Sate ayam dengan bumbu kacang yang lezat.'
    },
    {
      'name': 'Soto Ayam',
      'image':
          'https://asset.kompas.com/crops/VMupLYa-zBYTf5h5GnEjMW6-Nxg=/0x0:1000x667/1200x800/data/photo/2020/11/22/5fba747cef43d.jpg',
      'details': 'Soto ayam dengan kuah kaldu yang kaya rasa.'
    },
    // Tambahkan resep lainnya di sini
  ];

  List<Map<String, String>> filteredRecipes = [];

  @override
  void initState() {
    super.initState();
    filteredRecipes = allRecipes; // Default showing all recipes
  }

  void _searchRecipes() {
    setState(() {
      filteredRecipes = allRecipes
          .where((recipe) => recipe['name']!
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resep Makanan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pencarian
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Resep...',
                hintText: 'Masukkan nama resep',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                _searchRecipes();
              },
            ),
            const SizedBox(height: 20),
            // Grid resep makanan
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Tampilkan 2 kolom per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2, // Menyesuaikan ukuran grid item
                ),
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Arahkan ke halaman detail resep
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailPage(
                              recipe: filteredRecipes[index],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Gambar resep
                          Image.network(
                            filteredRecipes[index]['image']!,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          // Nama resep
                          Text(
                            filteredRecipes[index]['name']!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

