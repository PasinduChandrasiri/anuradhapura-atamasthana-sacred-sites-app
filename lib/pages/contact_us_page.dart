import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  Future<void> _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    final messenger = ScaffoldMessenger.of(context); // Get messenger before async gap
    try {
      if (await canLaunchUrl(uri)) {
        bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (!launched) {
          print('launchUrl returned false for $url');
          messenger.showSnackBar(
            const SnackBar(content: Text('Failed to open the link')),
          );
        } else {
          print('Launched URL successfully: $url');
        }
      } else {
        print('canLaunchUrl returned false for $url');
        messenger.showSnackBar(
          const SnackBar(content: Text('Cannot launch this URL')),
        );
      }
    } catch (e) {
      print('Exception caught trying to launch URL: $e');
      messenger.showSnackBar(
        const SnackBar(content: Text('Error occurred while opening the link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final links = [
      {
        'name': 'LinkedIn',
        'url': 'https://www.linkedin.com/in/pasinduchandrasiri',
        'icon': FontAwesomeIcons.linkedin,
        'color': Color(0xFF0077B5),
      },
      {
        'name': 'Instagram',
        'url': 'https://www.instagram.com/pasindu_chandrasiri/',
        'icon': FontAwesomeIcons.instagram,
        'color': Color(0xFFC13584),
      },
      {
        'name': 'Facebook',
        'url': 'https://web.facebook.com/pasindu.chandrasiri.493',
        'icon': FontAwesomeIcons.facebook,
        'color': Color(0xFF1877F2),
      },
      {
        'name': 'WhatsApp',
        'url': 'https://wa.me/940765839061',
        'icon': FontAwesomeIcons.whatsapp,
        'color': Color(0xFF25D366),
      },
      {
        'name': 'Twitter',
        'url': 'https://x.com/Pasindu_493',
        'icon': FontAwesomeIcons.twitter,
        'color': Color(0xFF1DA1F2),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: links.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final link = links[index];
          return ListTile(
            leading: FaIcon(
              link['icon'] as IconData,
              color: link['color'] as Color,
              size: 30,
            ),
            title: Text(
              link['name'] as String,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _launchURL(context, link['url'] as String),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            tileColor: Colors.grey.shade100,
            selectedTileColor: Colors.grey.shade300,
          );
        },
      ),
    );
  }
}
