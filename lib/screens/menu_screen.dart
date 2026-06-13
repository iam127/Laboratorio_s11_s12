import 'package:flutter/cupertino.dart';
import '../models/persona.dart';
import 'registro_screen.dart';
import 'listado_screen.dart';
import 'perfil_screen.dart';
import 'login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Persona> _personas = [];

  void _logout() {
    showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: const Text('Cerrar sesión'),
        content: const Text('¿Estás seguro que deseas salir?'),
        actions: [
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('Salir'),
          ),
          CupertinoDialogAction(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Menú Principal'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: _logout,
          child: const Text(
            'Salir',
            style: TextStyle(color: CupertinoColors.systemRed),
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Opciones',
                style: TextStyle(
                  fontSize: 13,
                  color: CupertinoColors.systemGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _CardMenuTile(
                icon: CupertinoIcons.person_add_solid,
                label: 'Registrar Persona',
                descripcion: 'Agrega una nueva persona',
                color: CupertinoColors.systemBlue,
                onTap: () async {
                  final nueva = await Navigator.push<Persona>(
                    context,
                    CupertinoPageRoute(builder: (_) => const RegistroScreen()),
                  );
                  if (nueva != null) {
                    setState(() => _personas.add(nueva));
                  }
                },
              ),
              const SizedBox(height: 10),
              _CardMenuTile(
                icon: CupertinoIcons.list_bullet,
                label: 'Listado de Personas',
                descripcion: '${_personas.length} persona(s) registrada(s)',
                color: CupertinoColors.systemGreen,
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => ListadoScreen(personas: _personas),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _CardMenuTile(
                icon: CupertinoIcons.person_circle_fill,
                label: 'Mi Perfil',
                descripcion: 'Ver información personal',
                color: CupertinoColors.systemIndigo,
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => const PerfilScreen()),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: CupertinoColors.systemRed,
                  borderRadius: BorderRadius.circular(10),
                  onPressed: _logout,
                  child: const Text('Cerrar Sesión'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String descripcion;
  final Color color;
  final VoidCallback onTap;

  const _CardMenuTile({
    required this.icon,
    required this.label,
    required this.descripcion,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        width: double.infinity,
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
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: CupertinoColors.white, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CupertinoColors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    descripcion,
                    style: const TextStyle(
                      fontSize: 12,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(CupertinoIcons.chevron_right,
                color: CupertinoColors.systemGrey, size: 16),
          ],
        ),
      ),
    );
  }
}