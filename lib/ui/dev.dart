import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    // ignore: unused_element
    void launchEmail(email) async {
      String url = 'mailto:$email';

      await canLaunch(url) ? launch(url) : print('Unable');
    }

    return Scaffold(
      // backgroundColor: Theme.of(context).cardColor,
      
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          childrenPadding:
                              const EdgeInsets.all(16).copyWith(top: 0),
                          title: const Text('Acknowledgement',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          children: const [
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Alex Maina',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Software Dev,  Turing. Nairobi, KE.'),
                            ),
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Patrick Maina',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Expert,  Business Institute. Texas, USA.'),
                            ),
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Dennis Gachie',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'CEO, Basemart Enterprises. Nakuru, Kenya.'),
                            ),
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Francis Alego',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Student, Machakos University. Machakos, Kenya.'),
                            ),
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Stephen  Mwangi',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Student, Machakos University. Machakos, Kenya.'),
                            ),
                            
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Owen Alikula',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Dev, Andela Kenya. Nairobi, Kenya.'),
                            ),
                            
                            ListTile(
                              // leading: MyBullet(),
                              title: Text(
                                'Daniel Gakeri',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Student, Machakos University. Machakos, Kenya.'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget MyBullet() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}