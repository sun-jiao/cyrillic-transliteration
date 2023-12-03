import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;

void main() {
  print(cyrtranslit.supported());

  // text is copied from wikipedia, CC BY-SA 4.0, url:https://sh.wikipedia.org/wiki/Glavna_stranica
  final serbianAlphabetCyrillic = 'Wикипедија је енциклопедијски пројект слободног садржаја на интернету на више од 300 језика који развијају добровољци. Чланке на њој може мијењати сватко с приступом интернету. Притом је неопходно држати се правила и смјерница које је усвојила заједница. ';
  print(cyrtranslit.cyr2Lat(serbianAlphabetCyrillic));
}
