import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> places = [
    {
      "name": "ශ්‍රී මහාබෝධිය",
      "images": [
        "assets/Jaya-Sri-Maha-Bodhi.jpg",
        "assets/SriMahaBodiyaRanVeta.jpg",
        "assets/jaya-srimaha-bodi-0.jpg"
      ],
      "description": "ශ්‍රී මහා බෝධිය ශ්‍රී ලංකාවේ අනුරාධපුරයේ පිහිටි පූජනීය ඇසතු වෘක්‍ෂයකි. බුදුන් වහන්සේ බුද්ධත්වය ලබා ගැනීමේදී පිට දුන් ඓතිහාසික බෝධි වෘක්ෂයේ දකුණු අංකුර පැලයකි. මෙය පැල කරන ලද්දේ කි.පූ 288 දීය. එය මේ දක්වා ලෝකයේ තිබෙන මිනිස් අතකින් සිටවූ සහ එසේ සිට‍වූ කාලය දන්නා පැරණිම වෘක්ෂය ලෙස වාර්තාගත වෙයි. මෙම ශ්‍රී මහා බෝධිය බුදුන් වහන්සේ බුද්ධත්වයට පැමිණිමේදී පිට දුන් ඉන්දියාවේ බුද්ධගයාවේ තිබූ මහ බෝධියේ දකුණු ශාඛාවකි.",
      "wiki": "https://si.wikipedia.org/wiki/ශ්%E2%80%8Dරී_මහා_බෝධිය,_අනුරාධපුර"
    },
    {
      "name": "ලෝවාමහාපාය",
      "images": [
        "assets/Lowamahapaya_1.jpg",
        "assets/Lovamahapaya.jpg",
        "assets/Lovamahapaya_2.JPG"
      ],
      "description": "ලෝවාමහාපාය යනු ක්‍රි. පූ. 1 වන සියවසේදී මහා විහාරයේ ඉදි කරනු ලැබූ උපෝසථාගාරයකි. මෙය අනුරාධපුරයේ පිහිටා ඇත. එහි වහලය ලෝහ උළු වලින් කල නිසා ලෝහ ප්‍රාසදය යනුවෙන්ද හැඳින්විනි. ලෝවාමහා ප්‍රාසාදය කරවන ලද්දේ දුටුගැමුණු රජතුමා විසිනි. මෙහි මහල් නමයක් වූ බව වංශ කථා වල සඳහන් වේ. මෙය සාදන ලද්දේ තව්තිසා දෙව්ලොව 'බරණී' නැමැති දිව්‍යාංගනාවගේ රන් මාළිගයේ ආකාර සැලැස්මට අනුවයි.",
      "wiki": "https://si.wikipedia.org/wiki/ලෝවාමහාපාය"
    },
    {
      "name": "රුවන්වැලිසෑය",
      "images": [
        "assets/Ruwanweli Maha Seya.jpg",
        "assets/Ruwanweli Maha Seya Day Time.jpg",
        "assets/Ruwanweli Maha Seya at Night.jpg"
      ],
      "description": "රුවන්වැලි මහා සෑය හෙවත් ස්වර්ණමාලි මහා සෑය ශ්‍රී ලංකාවේ අනුරාධපුර නගරයේ පිහිටි, බෞද්ධයන්ගේ අතිශය පූජනීය ස්ථූපයකි. මෙය දුටුගැමුණු මහා රජතුමා විසින් ක්‍රි.පූ. 140 වසරේ ඉදිකරනු ලැබීය. මෙය ශ්‍රී ලංකාවේ අටමස්ථානයන්ගෙන් එකකි. මෙහි ගෞතම බුදුරජාණන් වහන්සේගේ ද්‍රෝණයක් ධාතූන් වහන්සේලා නිධන් කොට ඇත. එය ලොව පුරා බෞද්ධයන්ගේ විශිෂ්ටම වන්දනාවට පාත්‍ර වූ ස්ථූපයක් ලෙස සැලකේ.",
      "wiki": "https://si.wikipedia.org/wiki/රුවන්වැලි_මහා_සෑය"
    },
    {
      "name": "අභයගිරිය",
      "images": [
        "assets/abayagiriya_1.jpg",
        "assets/Abhayagiriya Stupa.jpg",
        "assets/Abhayagiriya-2.jpg"
      ],
      "description": "අභයගිරි විහාරය යනු ලක්දිව අනුරාධපුරයේ පිහිටා තිබූ මහායාන, ථෙරවාද සහ වජ්‍රයාන බුදුදහමේ ප්‍රධාන ආරාම සහ අධ්‍යාපන භූමියකි. එය ලෝකයේ වඩාත්ම පුළුල් නටබුන් වලින් එකක් වන අතර ජාතියේ වඩාත්ම පූජනීය බෞද්ධ වන්දනා නගරවලින් එකකි. ඓතිහාසික වශයෙන්, එය විශිෂ්ට ආරාම මධ්‍යස්ථානයක් මෙන්ම, රන්වන් පැහැයෙන් යුත් ලෝකඩ හෝ පිළිස්සුණු මැටි උළු වලින් සෙවිලි කරන ලද විශිෂ්ට ආරාම සහිත රාජකීය අගනුවරකි.",
      "wiki": "https://si.wikipedia.org/wiki/අභයගිරි_විහාරය"
    },
    {
      "name": "ථූපාරාමය",
      "images": [
        "assets/Thuparamaya_Stupa.jpg",
        "assets/Thuparamaya_1.JPG",
        "assets/Thuparamaya_3.jpg"
      ],
      "description": "බුද්ධාගම හඳුන්වාදීමෙන් පසු ශ්‍රී ලංකා‍වේ ඉදි කරන ලද පළමු චෙෙත්‍ය ථූපාරාමය යයි සළකනු ලැ‍බේ. ශ්‍රී ලංකා‍වේ වංශ කථාවල සඳහන් වන මුල්ම ‍චෙෙත්‍යද ‍මෙය යැයි සළකනු ලැ‍බේ. ‍මෙම ස්ථානය සංඝයා වහන්සේලා වැඩ සිටි ආරාමයක් විය. ශ්‍රී ලංකාවට බුද්ධාගම සහ ‍චෙෙත්‍ය වන්දනාව හඳුන්වා ‍දෙන ලද්දේ මිහිදු මහරහතන් වහන්සේ විසිනි. මහින්ද තෙරණුවෝ ලද ඉල්ලීමක් පරිදි දේවානම්පිය තිස්ස රජු ථූපාරාමය චෙෙත්‍ය ඉදි ක‍ළේය.",
      "wiki": "https://si.wikipedia.org/wiki/ථූපාරාමය,_අනුරාධපුර"
    },
    {
      "name": "ජේතවනාරාමය",
      "images": [
        "assets/jetavanaramaya-03.jpg",
        "assets/Jetavanaramaya_Stupa_profile.jpg",
        "assets/jethawanaramaya_1.jpg"
      ],
      "description": "ජේතවනාරාමය දාගැබකි. අඩි 269 ක් (මීටර් 120) උසින් යුතු එය ලෝකයේ උසම ස්ථූපයයි. මෙය ශ්‍රී ලංකාවේ විශාලතම ස්ථූපය ඉදි කරවූවේ මහායාන බෞද්ධ මහසෙන් රජුයි. බුදුන් වහන්සේ පැළඳි පටී ධාතුවේ කොටසක් එහි නිධන් කර ඇතැයි විශ්වාස කෙරේ. එබැවින් මෙය පාරිභෝගික චෛත්‍යයක් වේ. පුරාණ ලෝකයේ 'ගීසා' හි පිහිටි මහා පිරමීඩ දෙක හැරුණු විට 3 වැනි විශාලතම ඉදි කිරීමයි. දළ වශයෙන් එය ඉදි කිරීමට පිළිස්සූ ගඩොල් 93,300,000 ක් යොදන්නට ඇත.",
      "wiki": "https://si.wikipedia.org/wiki/ජේතවනාරාමය,_අනුරාධපුර"
    },
    {
      "name": "මිරිසවැටිය",
      "images": [
        "assets/Mirisawetiya Stupa.jpg",
        "assets/mirissavetiya-1.jpg",
        "assets/Mirisawetiya-Stupa.jpg"
      ],
      "description": "ක්‍රිස්තු පූර්ව 161 - 137 කාලය තුළ ලංකාවේ රජ කළ දුටුගැමුණු මහ රජතුමා ඉදි කළ ප්‍රථම චෛත්‍යය ලෙස මිරිසවැටිය චෛත්‍යය හැඳින් වේ. සර්වඥ ධාතු සහිත රජතුමාගේ කොන්තය (රජුගේ රාජ්‍ය බලය සංකේතවත් කරන ආයුධය) නිධානයක් වශයෙන් පූජා කොට දහනව කෝටියක් ධනය ද වැය කර ඉදි කර ඇති මෙම චෛත්‍යය ආරම්භයේදී උසින් අඩි හැටක් සහ වට ප්‍රමාණයෙන් අඩි පන්සිය හැටකි. මෙම චෛත්‍යය එකල පැවති අග්‍රගණ්‍ය චෛත්‍යයක් බව පුරාවෘත්තවල සඳහන් වේ",
      "wiki": "https://si.wikipedia.org/wiki/මිරිසවැටිය"
    },
    {
      "name": "මිහින්තලේ මහා සෑය",
      "images": [
        "assets/Mihintale Mahaseya.jpg",
        "assets/mihinthale_1.jpg",
        "assets/mihinthale_2.jpg"
      ],
      "description": "ශ්‍රී ලංකාවේ අනුරාධපුර මිහින්තලා පුදබිමෙහි ඉදිකොට ඇති චෙෙත්‍යයන් අතුරින් විශාලතම චෙෙත්‍යය මහාසෑය වේ. මෙම චෙෙත්‍යය මහාථූපය, මහාචේතිය නම් වලින්ද හඳුන්වනු ලබයි. පූජාවලියෙහි සහ සිව්වන මිහිදු රජුගේ මිහින්තලා පුවරු ලිපියෙහි මෙම දාගැබ අම්බුලු දාගැබ ලෙස හඳුන්වා තිබේ. මේ වනවිට සංරක්ෂණය කොට තිබෙන මහා සෑයේ උස අඩි 153 ක් පමණ වේ. බුදුරජාණන් වහන්සේගේ ඌර්ණ රෝම ධාතුව මෙහි නිදන් කොට ඇති බව විශ්වාස කෙරේ.",
      "wiki": "https://si.wikipedia.org/wiki/මිහින්තලය_මහාසෑය"
    },
  ];

  Future<void> _openWikipedia(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (!launched) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to open the link')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cannot open the link on this device')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error occurred while opening the link')),
      );
    }
  }

  void _showPositionedMenu(BuildContext context) {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Menu",
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation1, animation2) {
        return Stack(
          children: [
            Positioned(
              top: kToolbarHeight + MediaQuery.of(context).padding.top + 6,
              left: overlay.size.width * 0.05,
              right: overlay.size.width * 0.05,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Material(
                    color: Colors.white.withAlpha((0.4 * 255).round()),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withAlpha((0.6 * 255).round()),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _glassMenuItem(context, 'Contact Us', () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/contact');
                          }),
                          Divider(color: Colors.white.withAlpha((0.5 * 255).round()), height: 0.5),
                          _glassMenuItem(context, 'About Us', () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/about');
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation1, animation2, widget) {
        return FadeTransition(
          opacity: animation1,
          child: widget,
        );
      },
    );
  }

  Widget _glassMenuItem(BuildContext context, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white24,
      highlightColor: Colors.white10,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: places.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 8,
        title: const Text(
          "අටමස්ථාන වන්දනාව",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, size: 30, color: Colors.white),
                onPressed: () {
                  _showPositionedMenu(context);
                },
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade400,
          indicatorColor: Colors.white,
          tabs: places.map((place) => Tab(text: place["name"])).toList(),
        ),
        backgroundColor: Colors.black,
      ),
      body: TabBarView(
        controller: _tabController,
        children: places.map((place) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: (place["images"] as List<String>).map((imgPath) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        imgPath,
                        height: 275,
                        width: 275,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 275,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  place["description"]!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15),
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => _openWikipedia(context, place["wiki"]!),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "වැඩිදුර තොරතුරු",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
