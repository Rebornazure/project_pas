import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: const EdgeInsets.all(18),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const CircleAvatar(
          radius: 52,
          backgroundColor: Color(0xFFDDF3E7),
          child: Text(
            'GA',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF087E72),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Galuh Adjie Abiyyu Akbar',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w800,
            color: Color(0xFF173B35),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          '11 PPLG 3 • No. absen: 09',
          style: TextStyle(color: Color(0xFF667873)),
        ),
        const SizedBox(height: 20),
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline, color: Color(0xFF087E72)),
                    SizedBox(width: 9),
                    Text(
                      'Tentang Saya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF173B35),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Saya Galuh Adjie Abiyyu Akbar sedang sekolah di smk radn umar said jurusan PPLG',
                  style: TextStyle(height: 1.5, color: Color(0xFF667873)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Card(
          elevation: 0,
          color: Colors.white,
          child: ListTile(
            leading: Icon(Icons.school_outlined, color: Color(0xFF087E72)),
            title: Text('Kelas'),
            subtitle: Text('11 PPLG 3'),
          ),
        ),
        const Card(
          elevation: 0,
          color: Colors.white,
          child: ListTile(
            leading: Icon(
              Icons.assignment_ind_outlined,
              color: Color(0xFF087E72),
            ),
            title: Text('Nomor Absen'),
            subtitle: Text('09'),
          ),
        ),
      ],
    ),
  );
}
