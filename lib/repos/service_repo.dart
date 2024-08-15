import 'package:flutter/material.dart';

enum Materials {
  Organico,
  Vidro,
  Papel,
  Pilha_Bateria,
  Plastico,
  Metal,
  Eletronicos,
  Remedios,
}

Map<Materials, Color> materials_color = {
  Materials.Organico: Color.fromRGBO(224, 192, 151, 1),
  Materials.Vidro: Color.fromRGBO(163, 221, 203, 1),
  Materials.Papel: Color.fromRGBO(158, 161, 212, 1),
  Materials.Pilha_Bateria: Color.fromRGBO(248, 177, 149, 1),
  Materials.Plastico: Color.fromRGBO(212, 93, 121, 1),
  Materials.Metal: Color.fromRGBO(241, 239, 153, 1),
  Materials.Eletronicos: Color.fromRGBO(1, 148, 221, 1),
  Materials.Remedios: Color.fromRGBO(254, 246, 251, 1),
};
