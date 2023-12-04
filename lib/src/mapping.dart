import 'package:deepcopy/deepcopy.dart';

bool isInited = false;
late Map<String, String> srCyr2lat;
late Map<String, String> srLat2Cyr;
late Map<String, String> meCyr2Lat;
late Map<String, String> meLat2Cyr;
late Map<String, String> mkCyr2Lat;
late Map<String, String> mkLat2Cyr;
late Map<String, String> ruCyr2Lat;
late Map<String, String> ruLat2Cyr;
late Map<String, String> tjCyr2Lat;
late Map<String, String> tjLat2Cyr;
late Map<String, String> bgCyr2Lat;
late Map<String, String> bgLat2Cyr;
late Map<String, String> uaCyr2Lat;
late Map<String, String> uaLat2Cyr;
late Map<String, String> mnCyr2Lat;
late Map<String, String> mnLat2Cyr;
late Map<String, Map<String, Map<String, String>>> translitDict;

void mappingInit() {
  if (isInited) {
    return;
  }

  // Build the dictionaries to transliterate Serbian cyrillic to latin and vice versa.

  // This dictionary is to transliterate from cyrillic to latin.
  srCyr2lat = {
    'А': 'A',
    'а': 'a',
    'Б': 'B',
    'б': 'b',
    'В': 'V',
    'в': 'v',
    'Г': 'G',
    'г': 'g',
    'Д': 'D',
    'д': 'd',
    'Ђ': 'Đ',
    'ђ': 'đ',
    'Е': 'E',
    'е': 'e',
    'Ж': 'Ž',
    'ж': 'ž',
    'З': 'Z',
    'з': 'z',
    'И': 'I',
    'и': 'i',
    'Ј': 'J',
    'ј': 'j',
    'К': 'K',
    'к': 'k',
    'Л': 'L',
    'л': 'l',
    'Љ': 'Lj',
    'љ': 'lj',
    'М': 'M',
    'м': 'm',
    'Н': 'N',
    'н': 'n',
    'Њ': 'Nj',
    'њ': 'nj',
    'О': 'O',
    'о': 'o',
    'П': 'P',
    'п': 'p',
    'Р': 'R',
    'р': 'r',
    'С': 'S',
    'с': 's',
    'Т': 'T',
    'т': 't',
    'Ћ': 'Ć',
    'ћ': 'ć',
    'У': 'U',
    'у': 'u',
    'Ф': 'F',
    'ф': 'f',
    'Х': 'H',
    'х': 'h',
    'Ц': 'C',
    'ц': 'c',
    'Ч': 'Č',
    'ч': 'č',
    'Џ': 'Dž',
    'џ': 'dž',
    'Ш': 'Š',
    'ш': 'š',
  };

// This dictionary is to transliterate from Serbian latin to cyrillic.
// Let's build it by simply swapping keys and values of previous dictionary.
  srLat2Cyr = srCyr2lat.kvSwap();

// Build the dictionaries to transliterate Montenegrin cyrillic to latin and vice versa.

// Montenegrin Latin is based on Serbo-Croatian Latin, with the addition of the two letters Ś and Ź,
// to replace the digraphs SJ and ZJ.
// These parallel the two letters of the Montenegrin Cyrillic alphabet not found in Serbian, С́ and З́.
// These, respectively, could also be represented in the original alphabets as šj and žj, and шj and жj.
// Source: https://en.wikipedia.org/wiki/Montenegrin_alphabet#Latin_alphabet
// Also see: http://news.bbc.co.uk/2/hi/8520466.stm
  meCyr2Lat = srCyr2lat.deepcopy();

  meCyr2Lat.addAll({
    'С́': 'Ś', 'с́': 'ś', // Montenegrin
    'З́': 'Ź', 'з́': 'ź' // Montenegrin
  });

// This dictionary is to transliterate from Montenegrin latin to cyrillic.
  meLat2Cyr = meCyr2Lat.kvSwap();

// Build the dictionaries to transliterate Macedonian cyrillic to latin and vice versa.
  mkCyr2Lat = srCyr2lat.deepcopy();

// Differences with Serbian:
// 1) Between Ze (З з) and I (И и) is the letter Dze (Ѕ ѕ), which looks like the Latin letter S and represents /d͡z/.
  mkCyr2Lat['Ѕ'] = 'Dz';
  mkCyr2Lat['ѕ'] = 'dz';

// 2) Dje (Ђ ђ) is replaced by Gje (Ѓ ѓ), which represents /ɟ/ (voiced palatal stop).
// In some dialects, it represents /d͡ʑ/ instead, like Dje
// It is written ⟨Ǵ ǵ⟩ in the corresponding Macedonian Latin alphabet.
  mkCyr2Lat.remove('Ђ');
  mkCyr2Lat.remove('ђ');
  mkCyr2Lat['Ѓ'] = 'Ǵ';
  mkCyr2Lat['ѓ'] = 'ǵ';

// 3) Tshe (Ћ ћ) is replaced by Kje (Ќ ќ), which represents /c/ (voiceless palatal stop).
// In some dialects, it represents /t͡ɕ/ instead, like Tshe.
// It is written ⟨Ḱ ḱ⟩ in the corresponding Macedonian Latin alphabet.
  mkCyr2Lat.remove('Ћ');
  mkCyr2Lat.remove('ћ');
  mkCyr2Lat['Ќ'] = 'Ḱ';
  mkCyr2Lat['ќ'] = 'ḱ';

// This dictionary is to transliterate from Macedonian latin to cyrillic.
  mkLat2Cyr = mkCyr2Lat.kvSwap();

// This dictionary is to transliterate from Russian cyrillic to latin (GOST_7.79-2000 System B).
  ruCyr2Lat = {
    "А": "A",
    "а": "a",
    "Б": "B",
    "б": "b",
    "В": "V",
    "в": "v",
    "Г": "G",
    "г": "g",
    "Д": "D",
    "д": "d",
    "Е": "E",
    "е": "e",
    "Ё": "YO",
    "ё": "yo",
    "Ж": "ZH",
    "ж": "zh",
    "З": "Z",
    "з": "z",
    "И": "I",
    "и": "i",
    "Й": "J",
    "й": "j",
    "К": "K",
    "к": "k",
    "Л": "L",
    "л": "l",
    "М": "M",
    "м": "m",
    "Н": "N",
    "н": "n",
    "О": "O",
    "о": "o",
    "П": "P",
    "п": "p",
    "Р": "R",
    "р": "r",
    "С": "S",
    "с": "s",
    "Т": "T",
    "т": "t",
    "У": "U",
    "у": "u",
    "Ф": "F",
    "ф": "f",
    "Х": "X",
    "х": "x",
    "Ц": "CZ",
    "ц": "cz",
    "Ч": "CH",
    "ч": "ch",
    "Ш": "SH",
    "ш": "sh",
    "Щ": "SHH",
    "щ": "shh",
    "Ъ": "''",
    "ъ": "''",
    "Ы": "Y'",
    "ы": "y'",
    "Ь": "'",
    "ь": "'",
    "Э": "E'",
    "э": "e'",
    "Ю": "YU",
    "ю": "yu",
    "Я": "YA",
    "я": "ya",
  };

// This dictionary is to transliterate from Russian latin to cyrillic.
  ruLat2Cyr = ruCyr2Lat.kvSwap();
  ruLat2Cyr.addAll({
    "''": "ъ",
    "'": "ь",
    "C": "К", "c": "к",
    "CK": "К", "Ck": "К", "ck": "к",
    "JA": "ЖА", "Ja": "Жа", "ja": "жа",
    "JE": "ЖЕ", "Je": "Же", "je": "же",
    "JI": "ЖИ", "Ji": "Жи", "ji": "жи",
    "JO": "ЖО", "Jo": "Жо", "jo": "жо",
    "JU": "ЖУ", "Ju": "Жу", "ju": "жу",
    "PH": "Ф", "Ph": "Ф", "ph": "ф",
    "TH": "З", "Th": "З", "th": "з",
    "W": "В", "w": "в", "Q": "К", "q": "к",
    "WH": "В", "Wh": "В", "wh": "в",
    "Y": "И", "y": "и",
    "YA": "Я", "Ya": "я", "ya": "я",
    "YE": "Е", "Ye": "е", "ye": "е",
    "YI": "И", "Yi": "и", "yi": "и",
    "YO": "Ё", "Yo": "ё", "yo": "ё",
    "YU": "Ю", "Yu": "ю", "yu": "ю",
    "Y'": "ы", "y'": "ы",
    "iy": "ый", "ij": "ый", // dobriy => добрый
  });

// Transliterate from Tajik cyrillic to latin
  tjCyr2Lat = ruCyr2Lat.deepcopy();
// Change Mapping according to ISO 9 (1995)
  tjCyr2Lat["Э"] = "È";
  tjCyr2Lat["э"] = "è";
  tjCyr2Lat["ъ"] = "’";
  tjCyr2Lat["Х"] = "H";
  tjCyr2Lat["х"] = "h";
  tjCyr2Lat["Ч"] = "Č";
  tjCyr2Lat["ч"] = "č";
  tjCyr2Lat["Ж"] = "Ž";
  tjCyr2Lat["ж"] = "ž";
  tjCyr2Lat["Ё"] = "Ë";
  tjCyr2Lat["ё"] = "ë";
  tjCyr2Lat["Ш"] = "Š";
  tjCyr2Lat["ш"] = "š";
  tjCyr2Lat["Ю"] = "Û";
  tjCyr2Lat["ю"] = "û";
  tjCyr2Lat["Я"] = "Â";
  tjCyr2Lat["я"] = "â";
// delete letters not used
  tjCyr2Lat.remove("Ц");
  tjCyr2Lat.remove("ц");
  tjCyr2Lat.remove("Щ");
  tjCyr2Lat.remove("щ");
  tjCyr2Lat.remove("Ы");
  tjCyr2Lat.remove("ы");

// update the dict for the additional letters in the tajik cyrillic alphabet ( Ғ, Ӣ, Қ, Ӯ, Ҳ, Ҷ )
// see https://en.wikipedia.org/wiki/Tajik_alphabet//Cyrillic
  tjCyr2Lat.addAll({
    "Ғ": "Ǧ",
    "ғ": "ǧ",
    "Ӣ": "Ī",
    "ӣ": "ī",
    "Қ": "Q",
    "қ": "q",
    "Ӯ": "Ū",
    "ӯ": "ū",
    "Ҳ": "Ḩ",
    "ҳ": "ḩ",
    "Ҷ": "Ç",
    "ҷ": "ç"
  });

// transliterate from latin tajik to cyrillic
  tjLat2Cyr = tjCyr2Lat.kvSwap();

// Transliterate from Bulgarian cyrillic to latin
  bgCyr2Lat = ruCyr2Lat.deepcopy();

// There are a couple of letters that don't exist in Bulgarian:
  bgCyr2Lat.remove("Ё");
  bgCyr2Lat.remove("ё");
  bgCyr2Lat.remove("Ы");
  bgCyr2Lat.remove("ы");
  bgCyr2Lat.remove("Э");
  bgCyr2Lat.remove("э");

// Some letters that are pronounced differently
  bgCyr2Lat["Й"] = "Y";
  bgCyr2Lat["й"] = "y";
  bgCyr2Lat["Х"] = "H";
  bgCyr2Lat["х"] = "h";
  bgCyr2Lat["Ц"] = "TS";
  bgCyr2Lat["ц"] = "ts";
  bgCyr2Lat["Щ"] = "SHT";
  bgCyr2Lat["щ"] = "sht";
  bgCyr2Lat["Ю"] = "YU";
  bgCyr2Lat["ю"] = "yu";
  bgCyr2Lat["Я"] = "YA";
  bgCyr2Lat["я"] = "ya";
// The following letters use the pre-2012 "Andreichin" system for lettering,
// because in the newest "Ivanov" system "a" and "y" translate to two Bulgarian
// letters and choosing to which one depends on the word and text context
// https://en.wikipedia.org/wiki/Romanization_of_Bulgarian
  bgCyr2Lat["Ъ"] = "Ă";
  bgCyr2Lat["ъ"] = "ă";
  bgCyr2Lat["Ь"] = "J";
  bgCyr2Lat["ь"] = "j";

// Transliterate from latin Bulgarian to cyrillic.
  bgLat2Cyr = bgCyr2Lat.kvSwap();
  bgLat2Cyr.addAll({
    "ZH": "Ж",
    "Zh": "Ж",
    "zh": "ж",
    "TS": "Ц",
    "Ts": "Ц",
    "ts": "ц",
    "CH": "Ч",
    "Ch": "Ч",
    "ch": "ч",
    "SH": "Ш",
    "Sh": "Ш",
    "sh": "ш",
    "SHT": "Щ",
    "Sht": "Щ",
    "sht": "щ",
    "YU": "Ю",
    "Yu": "Ю",
    "yu": "ю",
    "YA": "Я",
    "Ya": "Я",
    "ya": "я",
  });

// Transliterate from Ukrainian
  uaCyr2Lat = ruCyr2Lat.deepcopy();
// Change mapping to match with Scientific Ukrainian
  uaCyr2Lat["Г"] = "H";
  uaCyr2Lat["г"] = "h";
  uaCyr2Lat["Ж"] = "Ž";
  uaCyr2Lat["ж"] = "ž";
  uaCyr2Lat["И"] = "Y";
  uaCyr2Lat["и"] = "y";
  uaCyr2Lat["Х"] = "X";
  uaCyr2Lat["х"] = "x";
  uaCyr2Lat["Ц"] = "C";
  uaCyr2Lat["ц"] = "c";
  uaCyr2Lat["Ч"] = "Č";
  uaCyr2Lat["ч"] = "č";
  uaCyr2Lat["Ш"] = "Š";
  uaCyr2Lat["ш"] = "š";
  uaCyr2Lat["Щ"] = "Šč";
  uaCyr2Lat["щ"] = "šč";
  uaCyr2Lat["Ю"] = "Ju";
  uaCyr2Lat["ю"] = "ju";
  uaCyr2Lat["Я"] = "Ja";
  uaCyr2Lat["я"] = "ja";
// Delete unused letters;
  uaCyr2Lat.remove("Ё");
  uaCyr2Lat.remove("ё");
  uaCyr2Lat.remove("Ъ");
  uaCyr2Lat.remove("ъ");
  uaCyr2Lat.remove("Ы");
  uaCyr2Lat.remove("ы");
  uaCyr2Lat.remove("Э");
  uaCyr2Lat.remove("э");

// Update for Ukrainian letters
  uaCyr2Lat
      .addAll({"Ґ": "G", "ґ": "g", "Є": "Je", "є": "je", "І": "I", "і": "i", "Ї": "Ï", "ї": "ï"});

// Latin to Cyrillic
  uaLat2Cyr = uaCyr2Lat.kvSwap();

// This version of Mongolian Latin <-> Cyrillic is based on  MNS 5217:2012
// as far as I know this is the latest standard. Imform me @ https://github.com/Serbipunk
// https://gogo.mn/r/101115
// https://en.wikipedia.org/wiki/Mongolian_Cyrillic_alphabet
  mnCyr2Lat = {
    "А": "A", "а": "a",
    "Э": "E", "э": "e",
    "И": "I", "и": "i", // i
    "О": "O", "о": "o",
    "У": "U", "у": "u",
    "Ө": "Ö", "ө": "ö",
    "Ү": "Ü", "ү": "ü",
    "Н": "N", "н": "n",
    "М": "M", "м": "m",
    "Л": "L", "л": "l",
    "В": "V", "в": "v",
    "П": "P", "п": "p",
    "Ф": "F", "ф": "f",
    "К": "K", "к": "k",
    "Х": "Kh", "х": "kh", // lat 1
    "Г": "G", "г": "g",
    "С": "S", "с": "s",
    "Ш": "Sh", "ш": "sh", // sh  // lat2
    "Т": "T", "т": "t",
    "Д": "D", "д": "d",
    "Ц": "Ts", "ц": "ts", // lat3
    "Ч": "Ch", "ч": "ch", // lat4
    "З": "Z", "з": "z",
    "Ж": "J", "ж": "j",
    "Й": "I", "й": "i", // i * 2
    "Р": "R", "р": "r",
    "Б": "B", "б": "b",
    "Е": "Ye", "е": "ye", // lat 5
    "Ё": "Yo", "ё": "yo", // lat 6
    "Щ": "Sh", "щ": "sh", // sh x 2   // lat 7
    "Ъ": "I", "ъ": "i", // i * 3
    "Ы": "Y", "ы": "y",
    "Ь": "I", "ь": "i", // i * 4
    "Ю": "Yu", "ю": "yu", // lat 8
    "Я": "Ya", "я": "ya", // lat 9
  };
  mnLat2Cyr = mnCyr2Lat.kvSwap();
  mnLat2Cyr.addAll({
    "I": "И",
    "i": "и",
    "Sh": "Ш",
    "sh": "ш",
  });

// Bundle up all the dictionaries in a lookup dictionary
  translitDict = {
    'sr': {
      // Serbia
      'tolatin': srCyr2lat,
      'tocyrillic': srLat2Cyr,
    },
    'me': {
      // Montenegro
      'tolatin': meCyr2Lat,
      'tocyrillic': meLat2Cyr,
    },
    'mk': {
      // Macedonia
      'tolatin': mkCyr2Lat,
      'tocyrillic': mkLat2Cyr
    },
    'ru': {
      // Russian
      'tolatin': ruCyr2Lat,
      'tocyrillic': ruLat2Cyr,
    },
    'tj': {
      // Tajik
      'tolatin': tjCyr2Lat,
      'tocyrillic': tjLat2Cyr,
    },
    'bg': {
      // Bulgarian
      'tolatin': bgCyr2Lat,
      'tocyrillic': bgLat2Cyr,
    },
    'ua': {
      // Ukrainian
      'tolatin': uaCyr2Lat,
      'tocyrillic': uaLat2Cyr,
    },
    'mn': {
      // Mongolian
      'tolatin': mnCyr2Lat,
      'tocyrillic': mnLat2Cyr,
    },
  };

  isInited = true;
}

extension<K, V> on Map<K, V> {
  Map<V, K> kvSwap() {
    final List<MapEntry<K, V>> list = entries.toList();
    return Map.fromEntries(
        List.generate(list.length, (index) => MapEntry(list[index].value, list[index].key)));
  }
}
