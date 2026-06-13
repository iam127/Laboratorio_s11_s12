import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Mi Perfil'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemBlue.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  CupertinoIcons.person_fill,
                  size: 56,
                  color: CupertinoColors.systemBlue,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Matias Galvan Guerrero',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Diseño y Desarrollo de Software',
                style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              CupertinoListSection.insetGrouped(
                header: const Text('INFORMACIÓN PERSONAL'),
                children: const [
                  CupertinoListTile(
                    leading: Icon(CupertinoIcons.person,
                        color: CupertinoColors.systemBlue),
                    title: Text('Nombre'),
                    additionalInfo: Text(
                      'Matias Galvan Guerrero',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  CupertinoListTile(
                    leading: Icon(CupertinoIcons.mail,
                        color: CupertinoColors.systemBlue),
                    title: Text('Correo'),
                    additionalInfo: Text(
                      'matias.galvan@tecsup.edu.pe',
                      style: TextStyle(
                        fontSize: 11,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ),
                  CupertinoListTile(
                    leading: Icon(CupertinoIcons.phone,
                        color: CupertinoColors.systemBlue),
                    title: Text('Ciclo'),
                    additionalInfo: Text('5to ciclo'),
                  ),
                ],
              ),
              CupertinoListSection.insetGrouped(
                header: const Text('INSTITUCIÓN'),
                children: const [
                  CupertinoListTile(
                    leading: Icon(CupertinoIcons.building_2_fill,
                        color: CupertinoColors.systemIndigo),
                    title: Text('Instituto'),
                    additionalInfo: Text('TECSUP'),
                  ),
                  CupertinoListTile(
                    leading: Icon(CupertinoIcons.book_fill,
                        color: CupertinoColors.systemIndigo),
                    title: Text('Carrera'),
                    additionalInfo: Text('DDS'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'UBICACIÓN',
                      style: TextStyle(
                        fontSize: 13,
                        color: CupertinoColors.systemGrey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey4.withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(-12.0853, -77.0538),
                            initialZoom: 16,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(-12.0853, -77.0538),
                                  child: const Icon(
                                    CupertinoIcons.location_solid,
                                    color: CupertinoColors.systemRed,
                                    size: 36,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'TECSUP — Lima, Perú',
                      style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}