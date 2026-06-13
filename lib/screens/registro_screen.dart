import 'package:flutter/cupertino.dart';
import '../models/persona.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _edadController = TextEditingController();
  final _emailController = TextEditingController();

  void _guardar() {
    if (_nombreController.text.isEmpty || _apellidoController.text.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Campos requeridos'),
          content: const Text('Nombre y apellido son obligatorios.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    final persona = Persona(
      nombre: _nombreController.text,
      apellido: _apellidoController.text,
      edad: _edadController.text,
      email: _emailController.text,
    );

    Navigator.pop(context, persona);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Registrar Persona'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Icon(
                CupertinoIcons.person_add_solid,
                size: 60,
                color: CupertinoColors.systemBlue,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey4.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildField(_nombreController, 'Nombre', CupertinoIcons.person),
                    const SizedBox(height: 12),
                    _buildField(_apellidoController, 'Apellido', CupertinoIcons.person),
                    const SizedBox(height: 12),
                    _buildField(_edadController, 'Edad', CupertinoIcons.number,
                        type: TextInputType.number),
                    const SizedBox(height: 12),
                    _buildField(_emailController, 'Correo electrónico', CupertinoIcons.mail,
                        type: TextInputType.emailAddress),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(10),
                  onPressed: _guardar,
                  child: const Text('Guardar Persona'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String placeholder,
    IconData icon, {
    TextInputType type = TextInputType.text,
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      keyboardType: type,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(icon, color: CupertinoColors.systemGrey, size: 18),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}