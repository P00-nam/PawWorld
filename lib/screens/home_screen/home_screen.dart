import 'package:flutter/material.dart';
import 'package:paw_world/models/pet_model.dart';
import 'package:paw_world/provider/category_pets_provider.dart';
import 'package:paw_world/screens/app_color.dart';
import 'package:paw_world/screens/home_screen/pets_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PetModel> pets = [];
  List<PetModel> favoritePets = [];
  late String selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = 'all';
    filterPetsByCategory('all');
  }

  void filterPetsByCategory(String category) {
    context.read<CategoryPetsProvider>().fetchCategoryPets(category);
  }

  @override
  Widget build(BuildContext context) {
    final petsCategoryProvider = Provider.of<CategoryPetsProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Paw World",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            floating: true,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SearchPage()));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                        ),
                        Text(
                          "Search for pet",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.sort),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Pet Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      String category = categories[index]['name'];
                      debugPrint("Category tapped: $category");
                      setState(() {
                        selectedCategory = category;
                      });
                      filterPetsByCategory(category);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedCategory == categories[index]['name'] ||
                                (selectedCategory == 'all' && index == 0)
                            ? AppColor.primary.shade200
                            : Colors.transparent,
                      ),
                      child: Image.asset(categories[index]['iconPath']),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              ' Pet list for adoption',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final pet = petsCategoryProvider.categoryPets.data![index];
                return PetsCard(
                  pet: pet,
                  favoritePets: const [],
                );
              },
              childCount: petsCategoryProvider.categoryPets.data?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}
