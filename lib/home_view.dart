import 'package:contactapp/contact_details_view.dart';
import 'package:contactapp/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> data = [
    {
      "name": "Emmanuel",
      "phone": "233247902348",
      "email": "emmanuelakyeam@gmail.net",
      "country": "Ghana",
      "region": "Western Region"
    },
    {
      "name": "Sharon Adjei",
      "phone": "233557001326",
      "email": "sharonadjei@yahoo.com",
      "country": "Turkey",
      "region": "Munster"
    },
    {
      "name": "kweku Manu",
      "phone": "233247923489",
      "email": "kwekuamanu@aol.com",
      "country": "Austria",
      "region": "Pernambuco"
    },
    {
      "name": "Malcolm Monney",
      "phone": "233248790234",
      "email": "malcommonney@yahoo.ca",
      "country": "Ghana",
      "region": "Gilgit Baltistan"
    },
    {
      "name": "Fuller Hopper",
      "phone": "23320897540",
      "email": "accumsan.interdum@hotmail.edu",
      "country": "Australia",
      "region": "Puglia"
    },
    {
      "name": "Zeph Oneil",
      "phone": "1-253-315-7668",
      "email": "aliquet.vel.vulputate@google.edu",
      "country": "Costa Rica",
      "region": "Niger"
    },
    {
      "name": "Samson William",
      "phone": "1-943-239-6547",
      "email": "donec@aol.ca",
      "country": "Canada",
      "region": "Kayseri"
    },
    {
      "name": "Donna Cash",
      "phone": "1-572-257-7378",
      "email": "luctus.sit.amet@aol.couk",
      "country": "Costa Rica",
      "region": "Radnorshire"
    },
    {
      "name": "Lani Morgan",
      "phone": "808-2443",
      "email": "iaculis@protonmail.com",
      "country": "Sweden",
      "region": "Putumayo"
    },
    {
      "name": "killer Man",
      "phone": "2332479803",
      "email": "killerman233@hotmail.edu",
      "country": "Sweden",
      "region": "Ninh Thuận"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var ASC;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "My Contacts",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
        actions: const [
          Center(
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/pic1.jpg'),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Recents",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            ListView.separated(
                //controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                name: 'Elikplim Manuel',
                                phone: '+233 24 790 23 48',
                                email: 'emmanuelakyeam@gmail.com',
                                country: 'Ghana',
                                region: 'Western Region'));
                      }));
                    },
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(
                          'https://scontent-los2-1.xx.fbcdn.net/v/t1.6435-9/121432580_2681772562087927_3672236635661945506_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeHw5uBwjGh7cxKso21elzgKUU11gknjm5lRTXWCSeObmbxsgMJmN8shTXyaAJMCZxsEFn33I7lKVSANgSOZHS8U&_nc_ohc=m1XmA_TZRiQAX9TrnxS&_nc_ht=scontent-los2-1.xx&oh=00_AT_-6EOZ0X4Bl6ReV8qqlJXAO1CCKZ6uwkYJI5Zh8NQHJw&oe=61E535F7'),
                      radius: 25,
                    ),
                    title: const Text(
                      "Elikplim",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: const Text(
                      "+233 24 790 2348",
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Contacts",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
            GroupedListView<Map<String, dynamic>, String>(
              shrinkWrap: true,
              //controller: _scrollController,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, dynamic> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                            'https://scontent-los2-1.xx.fbcdn.net/v/t1.6435-9/121085068_2681773802087803_6974322218000786227_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeG55JAiNydNzjuVIHiHFzWqAXNE_bVmUCwBc0T9tWZQLKhQcrML_MI6ZQjxpD-4-cvhrKM1cxDJtFR600fUpB-q&_nc_ohc=lHJroK9O1QsAX9o4BYH&tn=VL3qc3hAEmKEzunr&_nc_ht=scontent-los2-1.xx&oh=00_AT8BCPjIisUJvwEwsuOOiYKty6cFiM25vQPr3vjdAJcwwA&oe=61E56B95'),
                        radius: 25,
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      subtitle: Text(
                        '${element['phone']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name'].compareTo(item2['name']), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
