import 'package:flutter/material.dart';

void main() => runApp(const ScanEatApp());

/// ============================
/// App Constants & Theming
/// ============================
class AppColors {
  static const greenOverlay = Color(0xAA1B8E3E);
  static const seed = Color(0xFF1E8E3E);
  static const gold = Color(0xFFD4A11D);
  static const inputBorder = Color(0xFFBDBDBD);
  static const hint = Color(0xFF9E9E9E);
}

class AppAssets {
  static const bg = 'assets/food.png';
  static const fb = 'assets/facebook.png';
  static const google = 'assets/google.png';
}

class AppStrings {
  static const appTitle = 'Scan Eat';
  static const fullName = 'Full Name';
  static const email = 'Email';
  static const password = 'Password';
  static const hintFullName = 'Enter your Full Name';
  static const hintEmail = 'example@gmail.com';
  static const hintPassword = 'Enter Your Password';
  static const signIn = 'Sign In';
  static const dialogTitle = 'Sample lang muna';
  static const dialogBody = 'dsfdsfsdf';
}

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.seed),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 1.6, color: Color(0xFF787878)),
      ),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
      hintStyle: const TextStyle(color: AppColors.hint),
    ),
  );
}

/// ============================
/// App Root
/// ============================
class ScanEatApp extends StatelessWidget {
  const ScanEatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const SignInScreen(),
    );
  }
}

/// ============================
/// Sign In Screen
/// ============================
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _onSignIn() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.dialogTitle),
        content: const Text(AppStrings.dialogBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImageOverlay(),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 380),
              child: const SignInCard(),
            ),
          ),
        ],
      ),
    );
  }
}

/// ============================
/// Widgets
/// ============================
class BackgroundImageOverlay extends StatelessWidget {
  const BackgroundImageOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.bg, fit: BoxFit.cover),
        ),
        Container(color: AppColors.greenOverlay),
      ],
    );
  }
}

class SignInCard extends StatelessWidget {
  const SignInCard({super.key});

  static const double _cardRadius = 16.0;
  static const double _vGap = 16.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 22),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LabeledTextField(label: AppStrings.fullName, hint: AppStrings.hintFullName, keyboardType: TextInputType.name),
            const SizedBox(height: _vGap),
            const LabeledTextField(label: AppStrings.email, hint: AppStrings.hintEmail, keyboardType: TextInputType.emailAddress),
            const SizedBox(height: _vGap),
            const LabeledTextField(label: AppStrings.password, hint: AppStrings.hintPassword, obscure: true),
            const SizedBox(height: 18),
            const _SignInButton(),
            const SizedBox(height: 18),
            const Divider(thickness: 0.7, color: AppColors.inputBorder),
            const SizedBox(height: 10),
            const SocialLoginRow(),
          ],
        ),
      ),
    );
  }
}

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final bool obscure;

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          obscureText: obscure,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
        onPressed: () => _showDialog(context),
        child: const Text(AppStrings.signIn, style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text(AppStrings.dialogTitle),
        content: const Text(AppStrings.dialogBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }
}

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialCircle(assetPath: AppAssets.fb),
        SizedBox(width: 22),
        SocialCircle(assetPath: AppAssets.google),
      ],
    );
  }
}

class SocialCircle extends StatelessWidget {
  final String assetPath;
  const SocialCircle({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white,
      child: Image.asset(assetPath, width: 20, height: 20),
    );
  }
}
