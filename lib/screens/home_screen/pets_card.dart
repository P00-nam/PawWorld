import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:provider/provider.dart';

import '../../models/pet_model.dart';
import '../../provider/favourite_pets_provider.dart';
import 'adopt_form_screen.dart';

class PetsCard extends StatefulWidget {
  const PetsCard({
    super.key,
    required this.pet,
    required this.favoritePets,
  });

  final PetModel pet;
  final List<PetModel> favoritePets;

  @override
  State<PetsCard> createState() => _PetsCardState();
}

class _PetsCardState extends State<PetsCard> {
  // late SharedPreferences _prefs;

  // @override
  // void initState() {
  //   super.initState();
  //   _initPrefs();
  // }

  // Future<void> _initPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  // Future<void> _markAsFavorite(String petId) async {
  //   final favorites = _prefs.getStringList('favorites') ?? [];
  //   if (!favorites.contains(petId)) {
  //     favorites.add(petId);
  //   } else {
  //     favorites.remove(petId);
  //   }
  //   await _prefs.setStringList('favorites', favorites);
  // }

  @override
  Widget build(BuildContext context) {
    log("image url is ${widget.pet.imagePath}");
    final isFavorite =
        context.watch<FavoritePetsProvider>().isFavorite(widget.pet);
    return Row(
      children: [
        widget.pet.imagePath != null
            ? Container(
                padding: const EdgeInsets.all(5),
                height: 190,
                width: 150,
                child: Image.network(
                  widget.pet.imagePath!.startsWith('http')
                      ? widget.pet.imagePath!
                      : "http://192.168.1.7:3000${widget.pet.imagePath!}",
                  fit: BoxFit.contain,
                ),
              )
            : const Icon(Icons.image_not_supported),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.pet.name ?? '-',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.pet.gender ?? '-',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.pet.color ?? '-',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              widget.pet.description ?? '-',
            ),
            Text(
              widget.pet.category ?? '-',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    final provider = context.read<FavoritePetsProvider>();

                    if (isFavorite) {
                      provider.removeFavoritePet(widget.pet);
                    } else {
                      provider.addFavoritePet(widget.pet);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     final provider = context.read<FavoritePetsProvider>();
                //     if (isFavorite) {
                //       provider.removeFavoritePet(widget.pet);
                //     } else {
                //       provider.addFavoritePet(widget.pet);
                //       _markAsFavorite(widget.pet.id!);
                //     }
                //   },
                //   icon: Icon(
                //     isFavorite ? Icons.favorite : Icons.favorite_border,
                //     color: isFavorite ? Colors.red : null,
                //   ),
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdoptFormScreen(),
                      ),
                    ).then((adopted) {
                      if (adopted) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.primary),
                  ),
                  child: const Text('Adopt'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
