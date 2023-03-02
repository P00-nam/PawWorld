import 'package:flutter/material.dart';
import 'package:paw_world/home_screen/categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Find a New Pet",
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
                    onPressed: () {},
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
              ' Pet Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5.5,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          debugPrint("Item tapped");
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            //color: Colors.brown.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(categories[index]['iconPath']),
                        ),
                      ),
                      Text(categories[index]['name']),
                    ],
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
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 3.5,
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    "asset/dog_image.png",
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / 3,
                    height: 200,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Name: abcd",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Color: brown",
                            style: TextStyle(
                              fontFamily: "poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
