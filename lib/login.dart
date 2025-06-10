import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;
  final String language;
  final Function(String) onLanguageChanged;

  LoginScreen({
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.language,
    required this.onLanguageChanged,
    super.key,
  });

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {
      'title': 'Log in',
      'greeting': 'Hello!',
      'username': 'Username',
      'password': 'Password',
      'login': 'Log in',
      'darkMode': 'Dark Mode',
    },
    'fr': {
      'title': 'Connexion',
      'greeting': 'Salut!',
      'username': 'Nom d\'utilisateur',
      'password': 'Mot de passe',
      'login': 'Connexion',
      'darkMode': 'Mode sombre',
    },
    'kh': {
      'title': 'ចូល',
      'greeting': 'សួស្ដី!',
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសម្ងាត់',
      'login': 'ចូល',
      'darkMode': 'របៀបងងឹត',
    },
  };

  Widget _langButton(String langCode, String asset, String label, BuildContext context) {
    final isSelected = language == langCode;
    return GestureDetector(
      onTap: () => onLanguageChanged(langCode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
              : Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Row(
          children: [
            Image.asset('assets/images/$asset', width: 24, height: 24),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = localizedStrings[language]!;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 68),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings['title']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const SizedBox(
                    width: 60,
                    child: Divider(thickness: 2, color: Colors.orange),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 54),
            Image.asset(
              'assets/images/logo.png',
              width: 260,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 56),
            Text(
              strings['greeting']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 54),
            TextField(
              decoration: InputDecoration(
                labelText: strings['username'],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: strings['password'],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  strings['login']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _langButton('en', 'gb-eng.png', 'EN', context),
                _langButton('fr', 'fr.png', 'FR', context),
                _langButton('kh', 'kh.png', 'KH', context),
              ],
            ),
            const SizedBox(height: 32),
            SwitchListTile(
              title: Text(strings['darkMode']!),
              value: isDarkMode,
              onChanged: onThemeChanged,
            ),
          ],
        ),
      ),
    );
  }
}
