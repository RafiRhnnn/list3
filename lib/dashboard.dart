import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  List<String> originList = [
    "Ahmad Zaenal",
    "Saiful Anam",
    "Vincent",
    "Noufal",
    "Mikail",
    "Eben",
    "Nurul",
    "Anissa",
    "Bunga",
    "Evi",
    "raihan",
    "putra",
    "Dzikri",
    "Uray",
    "Yogi",
    "rafi",
    "ikhsan",
    "ikbal",
  ];
  late List<String> filteredList;
  String keyword = '';

  @override
  void initState() {
    super.initState();
    originList.sort();
    filteredList = List.from(originList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  keyword = value.toLowerCase();
                  filteredList = originList
                      .where((item) => item.toLowerCase().contains(keyword))
                      .toList();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      Icon(Icons.image, size: 40), // Placeholder icon for image
                  title: Text(filteredList[index]),
                  onTap: () {
                    // Handle onTap if necessary
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
