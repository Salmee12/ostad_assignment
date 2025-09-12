
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ostad_assignment/trending_page.dart';


import 'package:flutter/material.dart';

class TravelHomePage extends StatefulWidget {
  TravelHomePage({Key? key}) : super(key: key);

  final String bannerImage =
      "https://images.unsplash.com/photo-1507525428034-b723cf961d3e";

  final List<Map<String, dynamic>> destinations = [
    {
      "name": "Bali, Indonesia",
      "picture": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
      "subtitle": "Tropical paradise of beaches & temples",
      "duration": "5 Days 4 Nights",
      "price": 1300,
      "rating": 4.8,
    },
    {
      "name": "Swiss Alps, Switzerland",
      "picture": "https://s1.it.atcdn.net/wp-content/uploads/2015/11/shutterstock_279572969.jpg",
      "subtitle": "Snowy mountains & scenic train rides",
      "duration": "7 Days 6 Nights",
      "price": 2200,
      "rating": 4.9,
    },
    {
      "name": "Cairo, Egypt",
      "picture": "https://d3rr2gvhjw0wwy.cloudfront.net/uploads/mandators/49581/file-manager/nile-river-journey-to-egypt.jpg",
      "subtitle": "Pyramids & Nile river adventures",
      "duration": "6 Days 5 Nights",
      "price": 1800,
      "rating": 4.6,
    },
    {
      "name": "Sydney, Australia",
      "picture": "https://cdn.sydneycitytour.com.au/wp-content/uploads/2024/10/Sydney-Opera-House.png",
      "subtitle": "Opera House & sunny beaches",
      "duration": "5 Days 4 Nights",
      "price": 1700,
      "rating": 4.7,
    },
    {
      "name": "Rome, Italy",
      "picture": "https://tourismmedia.italia.it/is/image/mitur/20220127150143-colosseo-roma-lazio-shutterstock-756032350-1?wid=1600&hei=900&fit=constrain,1&fmt=webp",
      "subtitle": "Colosseum & timeless culture",
      "duration": "4 Days 3 Nights",
      "price": 1400,
      "rating": 4.5,
    },
    {
      "name": "Maldives",
      "picture": "https://enqafm7df2v.exactdn.com/wp-content/uploads/2024/12/Landscape-resizer-for-socials-posting-2024-12-10T093800.227-1024x683.jpg?strip=all&lossy=1&ssl=1",
      "subtitle": "Overwater villas & crystal clear waters",
      "duration": "6 Days 5 Nights",
      "price": 2500,
      "rating": 5.0,
    },
  ];

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Banner with search bar
            SliverAppBar(
              expandedHeight: 280,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(widget.bannerImage, fit: BoxFit.cover),
                    Container(color: Colors.black38),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Discover Your Next Adventure",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          const TextField(
                            decoration: InputDecoration(
                              hintText: "Search destinations",
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                            ),
                          ),
                          const SizedBox(height: 12),
                          // category chips row
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                _categoryChip("Beaches"),
                                _categoryChip("Mountains"),
                                _categoryChip("Cities"),
                                _categoryChip("History"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Top Destinations Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Top Destinations",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),

            // Grid of top destinations (6)
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final place = widget.destinations[index];
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(place["picture"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            color: Colors.black54,
                            child: Text(
                              place["name"],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            // Trending Packages Title
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  "Trending Packages",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
            ),

            // Trending list (uses custom TrendingCard)
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverList.builder(
                itemCount: widget.destinations.length,
                itemBuilder: (context, index) {
                  final place = widget.destinations[index];
                  return TrendingCard(
                    img: place["picture"],
                    subtitle: place["subtitle"],
                    duration: place["duration"],
                    price: place["price"],
                    rating: (place["rating"] as num).toDouble(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // helper to make a chip (kept inside state but could be top-level)
  Widget _categoryChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.white,
        shape: const StadiumBorder(side: BorderSide(color: Colors.blueAccent)),
      ),
    );
  }
}



