import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:waste_map/partials/custom_button.dart';
import 'package:waste_map/partials/icon_text_button.dart';
import 'package:waste_map/repos/service_repo.dart';
import 'package:waste_map/services/location_service.dart';

class DropoutPage extends StatefulWidget {
  const DropoutPage({super.key});

  @override
  State<DropoutPage> createState() => _DropoutPageState();
}

class _DropoutPageState extends State<DropoutPage> {
  List<String> selected_services = [];
  String endereco = "Endereço";
  bool serviceHighlight = false;
  bool enderecoHighlight = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CENTRO DE RECICLAGEM",
                    style: GoogleFonts.handjet(
                        color: Colors.white, fontSize: 48, height: 1)),
                const SizedBox(height: 30),
                IconTextButton(
                  icon: LucideIcons.mapPin,
                  text: endereco,
                  width: 350,
                  highlighted: enderecoHighlight,
                  onTap: () async {
                    LocationService locationService = LocationService();
                    LocationData location =
                        await locationService.getCurrentLocation();
                    setState(() {
                      endereco = "${location.latitude} ${location.longitude}";
                      enderecoHighlight = false;
                    });
                  },
                ),
                const SizedBox(height: 30),
                Text(
                  "SELECIONE OS TIPOS DE SERVIÇO FORNECIDOS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inder(
                      color: Colors.white, fontSize: 18, height: 1),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 500,
                  height: 290,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: (serviceHighlight) ? Colors.red : Colors.blue),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 60,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: Materials.values.length,
                    itemBuilder: (context, index) {
                      var material = Materials.values[index];

                      return Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: materials_color[material],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            if (selected_services.contains(material.name)) {
                              selected_services.remove(material.name);
                            } else {
                              selected_services.add(material.name);
                            }
                            setState(() {
                              serviceHighlight = false;
                            });
                          },
                          icon: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                (selected_services.contains(material.name))
                                    ? CupertinoIcons.checkmark_circle_fill
                                    : CupertinoIcons.circle_fill,
                                color: Colors.black45,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                material.name,
                                style: GoogleFonts.inder(
                                    color: Colors.black,
                                    fontSize: 18,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  width: 200,
                  child: Text("CADASTAR",
                      style: GoogleFonts.inder(
                          color: Colors.white, fontSize: 18, height: 1)),
                  onTap: () {
                    if (endereco != "Endereço" &&
                        selected_services.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ponto de coleta adicionado"),
                        ),
                      );
                    } else if (endereco == "Endereço") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Selecione um endereço valido"),
                        ),
                      );

                      setState(() {
                        enderecoHighlight = true;
                      });
                      Timer(
                        const Duration(seconds: 5),
                        () {
                          setState(() {
                            enderecoHighlight = false;
                          });
                        },
                      );
                    } else if (selected_services.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Selecione pelo menos um serviço"),
                        ),
                      );
                      setState(() {
                        serviceHighlight = true;
                      });
                      Timer(
                        const Duration(seconds: 5),
                        () {
                          setState(() {
                            serviceHighlight = false;
                          });
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
