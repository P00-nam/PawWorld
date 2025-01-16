import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/pet_provider.dart';
import '../home_screen/pets_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required List favouritePets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Pets'),
      ),
      body: Consumer<PetProvider>(
        builder: (context, provider, child) {
          final favoritePets = provider.favoritePets;

          if (favoritePets.isEmpty) {
            return const Center(
              child: Text('You have not added any favorite pets yet.'),
            );
          }

          return ListView.builder(
            itemCount: favoritePets.length,
            itemBuilder: (BuildContext context, int index) {
              final pet = favoritePets[index];
              return PetsCard(
                pet: pet,
                favoritePets: favoritePets,
              );
            },
          );
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../provider/pet_provider.dart';

// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Favorite Pets'),
//       ),
//       body: Consumer<PetProvider>(
//         builder: (context, provider, child) {
//           final favoritePets = provider.favoritePets;

//           if (favoritePets.isEmpty) {
//             return const Center(
//               child: Text('You have not added any favorite pets yet.'),
//             );
//           }

//           return ListView.builder(
//             itemCount: favoritePets.length,
//             itemBuilder: (context, index) {
//               final pet = favoritePets[index];
//               return ListTile(
//                 leading: Image.asset(pet.imagePath),
//                 title: Text(pet.name),
//                 subtitle: Text(pet.description),
//                 trailing: IconButton(
//                   icon: Icon(
//                     Icons.favorite,
//                     color:
//                         provider.isPetFavorite(pet) ? Colors.red : Colors.grey,
//                   ),
//                   onPressed: () {
//                     provider.removeFavoritePet(pet);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
