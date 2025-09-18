import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/me.jpg', // Your photo filename in assets folder
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pasindu Chandrasiri',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Final Year Undergraduate Student',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Department of Computer Engineering\nFaculty of Engineering\nUniversity of Jaffna',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.5,
                fontSize: 16,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1.2),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Passionate about Artificial Intelligence and Machine Learning, I\'ve actively developed projects involving transformer models and multimodal data. Skilled in full-stack web and mobile development, I enjoy crafting efficient, user-friendly applications and contribute to open source projects. As a detail-oriented problem solver, I strive to innovate and learn continuously.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.grey.shade900,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Skills & Interests',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _skillChip('Machine Learning'),
                _skillChip('Flutter & Dart'),
                _skillChip('Python'),
                _skillChip('Full-stack Development'),
                _skillChip('Firebase'),
                _skillChip('AI Research'),
                _skillChip('Web Development'),
                _skillChip('Entrepreneurship'),
              ],
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.email, color: Colors.black87),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    'pasinduchandrasiri493@gmail.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.phone, color: Colors.black87),
                SizedBox(width: 10),
                Text(
                  '+94 76 583 9061',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.black12,
      labelStyle: const TextStyle(color: Colors.black87),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }
}
