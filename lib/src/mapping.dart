import 'package:deepcopy/deepcopy.dart';

bool isInited = false;
late Map SR_CYR_TO_LAT_DICT;
late Map SR_LAT_TO_CYR_DICT;
late Map ME_CYR_TO_LAT_DICT;
late Map ME_LAT_TO_CYR_DICT;
late Map MK_CYR_TO_LAT_DICT;
late Map MK_LAT_TO_CYR_DICT;
late Map RU_CYR_TO_LAT_DICT;
late Map RU_LAT_TO_CYR_DICT;
late Map TJ_CYR_TO_LAT_DICT;
late Map TJ_LAT_TO_CYR_DICT;
late Map BG_CYR_TO_LAT_DICT;
late Map BG_LAT_TO_CYR_DICT;
late Map UA_CYR_TO_LAT_DICT;
late Map UA_LAT_TO_CYR_DICT;
late Map MN_CYR_TO_LAT_DICT;
late Map MN_LAT_TO_CYR_DICT;
late Map TRANSLIT_DICT;

void mappingInit() {
  if (isInited) {
    return;
  }

  // Build the dictionaries to transliterate Serbian cyrillic to latin and vice versa.

  // This dictionary is to transliterate from cyrillic to latin.
  SR_CYR_TO_LAT_DICT = {
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
  SR_LAT_TO_CYR_DICT = SR_CYR_TO_LAT_DICT.kvSwap();

// Build the dictionaries to transliterate Montenegrin cyrillic to latin and vice versa.

// Montenegrin Latin is based on Serbo-Croatian Latin, with the addition of the two letters Ś and Ź,
// to replace the digraphs SJ and ZJ.
// These parallel the two letters of the Montenegrin Cyrillic alphabet not found in Serbian, С́ and З́.
// These, respectively, could also be represented in the original alphabets as šj and žj, and шj and жj.
// Source: https://en.wikipedia.org/wiki/Montenegrin_alphabet#Latin_alphabet
// Also see: http://news.bbc.co.uk/2/hi/8520466.stm
  ME_CYR_TO_LAT_DICT = SR_CYR_TO_LAT_DICT.deepcopy();

  ME_CYR_TO_LAT_DICT.addAll({
    'С́': 'Ś', 'с́': 'ś', // Montenegrin
    'З́': 'Ź', 'з́': 'ź' // Montenegrin
  });

// This dictionary is to transliterate from Montenegrin latin to cyrillic.
  ME_LAT_TO_CYR_DICT = ME_CYR_TO_LAT_DICT.kvSwap();

// Build the dictionaries to transliterate Macedonian cyrillic to latin and vice versa.
  MK_CYR_TO_LAT_DICT = SR_CYR_TO_LAT_DICT.deepcopy();

// Differences with Serbian:
// 1) Between Ze (З з) and I (И и) is the letter Dze (Ѕ ѕ), which looks like the Latin letter S and represents /d͡z/.
  MK_CYR_TO_LAT_DICT['Ѕ'] = 'Dz';
  MK_CYR_TO_LAT_DICT['ѕ'] = 'dz';

// 2) Dje (Ђ ђ) is replaced by Gje (Ѓ ѓ), which represents /ɟ/ (voiced palatal stop).
// In some dialects, it represents /d͡ʑ/ instead, like Dje
// It is written ⟨Ǵ ǵ⟩ in the corresponding Macedonian Latin alphabet.
  MK_CYR_TO_LAT_DICT.remove('Ђ');
  MK_CYR_TO_LAT_DICT.remove('ђ');
  MK_CYR_TO_LAT_DICT['Ѓ'] = 'Ǵ';
  MK_CYR_TO_LAT_DICT['ѓ'] = 'ǵ';

// 3) Tshe (Ћ ћ) is replaced by Kje (Ќ ќ), which represents /c/ (voiceless palatal stop).
// In some dialects, it represents /t͡ɕ/ instead, like Tshe.
// It is written ⟨Ḱ ḱ⟩ in the corresponding Macedonian Latin alphabet.
  MK_CYR_TO_LAT_DICT.remove('Ћ');
  MK_CYR_TO_LAT_DICT.remove('ћ');
  MK_CYR_TO_LAT_DICT['Ќ'] = 'Ḱ';
  MK_CYR_TO_LAT_DICT['ќ'] = 'ḱ';

// This dictionary is to transliterate from Macedonian latin to cyrillic.
  MK_LAT_TO_CYR_DICT = MK_CYR_TO_LAT_DICT.kvSwap();

// This dictionary is to transliterate from Russian cyrillic to latin (GOST_7.79-2000 System B).
  RU_CYR_TO_LAT_DICT = {
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
  RU_LAT_TO_CYR_DICT = RU_CYR_TO_LAT_DICT.kvSwap();
  RU_LAT_TO_CYR_DICT.addAll({
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
  TJ_CYR_TO_LAT_DICT = RU_CYR_TO_LAT_DICT.deepcopy();
// Change Mapping according to ISO 9 (1995)
  TJ_CYR_TO_LAT_DICT["Э"] = "È";
  TJ_CYR_TO_LAT_DICT["э"] = "è";
  TJ_CYR_TO_LAT_DICT["ъ"] = "’";
  TJ_CYR_TO_LAT_DICT["Х"] = "H";
  TJ_CYR_TO_LAT_DICT["х"] = "h";
  TJ_CYR_TO_LAT_DICT["Ч"] = "Č";
  TJ_CYR_TO_LAT_DICT["ч"] = "č";
  TJ_CYR_TO_LAT_DICT["Ж"] = "Ž";
  TJ_CYR_TO_LAT_DICT["ж"] = "ž";
  TJ_CYR_TO_LAT_DICT["Ё"] = "Ë";
  TJ_CYR_TO_LAT_DICT["ё"] = "ë";
  TJ_CYR_TO_LAT_DICT["Ш"] = "Š";
  TJ_CYR_TO_LAT_DICT["ш"] = "š";
  TJ_CYR_TO_LAT_DICT["Ю"] = "Û";
  TJ_CYR_TO_LAT_DICT["ю"] = "û";
  TJ_CYR_TO_LAT_DICT["Я"] = "Â";
  TJ_CYR_TO_LAT_DICT["я"] = "â";
// delete letters not used
  TJ_CYR_TO_LAT_DICT.remove("Ц");
  TJ_CYR_TO_LAT_DICT.remove("ц");
  TJ_CYR_TO_LAT_DICT.remove("Щ");
  TJ_CYR_TO_LAT_DICT.remove("щ");
  TJ_CYR_TO_LAT_DICT.remove("Ы");
  TJ_CYR_TO_LAT_DICT.remove("ы");

// update the dict for the additional letters in the tajik cyrillic alphabet ( Ғ, Ӣ, Қ, Ӯ, Ҳ, Ҷ )
// see https://en.wikipedia.org/wiki/Tajik_alphabet//Cyrillic
  TJ_CYR_TO_LAT_DICT.addAll({
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
  TJ_LAT_TO_CYR_DICT = TJ_CYR_TO_LAT_DICT.kvSwap();

// Transliterate from Bulgarian cyrillic to latin
  BG_CYR_TO_LAT_DICT = RU_CYR_TO_LAT_DICT.deepcopy();

// There are a couple of letters that don't exist in Bulgarian:
  BG_CYR_TO_LAT_DICT.remove("Ё");
  BG_CYR_TO_LAT_DICT.remove("ё");
  BG_CYR_TO_LAT_DICT.remove("Ы");
  BG_CYR_TO_LAT_DICT.remove("ы");
  BG_CYR_TO_LAT_DICT.remove("Э");
  BG_CYR_TO_LAT_DICT.remove("э");

// Some letters that are pronounced differently
  BG_CYR_TO_LAT_DICT["Й"] = "Y";
  BG_CYR_TO_LAT_DICT["й"] = "y";
  BG_CYR_TO_LAT_DICT["Х"] = "H";
  BG_CYR_TO_LAT_DICT["х"] = "h";
  BG_CYR_TO_LAT_DICT["Ц"] = "TS";
  BG_CYR_TO_LAT_DICT["ц"] = "ts";
  BG_CYR_TO_LAT_DICT["Щ"] = "SHT";
  BG_CYR_TO_LAT_DICT["щ"] = "sht";
  BG_CYR_TO_LAT_DICT["Ю"] = "YU";
  BG_CYR_TO_LAT_DICT["ю"] = "yu";
  BG_CYR_TO_LAT_DICT["Я"] = "YA";
  BG_CYR_TO_LAT_DICT["я"] = "ya";
// The following letters use the pre-2012 "Andreichin" system for lettering,
// because in the newest "Ivanov" system "a" and "y" translate to two Bulgarian
// letters and choosing to which one depends on the word and text context
// https://en.wikipedia.org/wiki/Romanization_of_Bulgarian
  BG_CYR_TO_LAT_DICT["Ъ"] = "Ă";
  BG_CYR_TO_LAT_DICT["ъ"] = "ă";
  BG_CYR_TO_LAT_DICT["Ь"] = "J";
  BG_CYR_TO_LAT_DICT["ь"] = "j";

// Transliterate from latin Bulgarian to cyrillic.
  BG_LAT_TO_CYR_DICT = BG_CYR_TO_LAT_DICT.kvSwap();
  BG_LAT_TO_CYR_DICT.addAll({
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
  UA_CYR_TO_LAT_DICT = RU_CYR_TO_LAT_DICT.deepcopy();
// Change mapping to match with Scientific Ukrainian
  UA_CYR_TO_LAT_DICT["Г"] = "H";
  UA_CYR_TO_LAT_DICT["г"] = "h";
  UA_CYR_TO_LAT_DICT["Ж"] = "Ž";
  UA_CYR_TO_LAT_DICT["ж"] = "ž";
  UA_CYR_TO_LAT_DICT["И"] = "Y";
  UA_CYR_TO_LAT_DICT["и"] = "y";
  UA_CYR_TO_LAT_DICT["Х"] = "X";
  UA_CYR_TO_LAT_DICT["х"] = "x";
  UA_CYR_TO_LAT_DICT["Ц"] = "C";
  UA_CYR_TO_LAT_DICT["ц"] = "c";
  UA_CYR_TO_LAT_DICT["Ч"] = "Č";
  UA_CYR_TO_LAT_DICT["ч"] = "č";
  UA_CYR_TO_LAT_DICT["Ш"] = "Š";
  UA_CYR_TO_LAT_DICT["ш"] = "š";
  UA_CYR_TO_LAT_DICT["Щ"] = "Šč";
  UA_CYR_TO_LAT_DICT["щ"] = "šč";
  UA_CYR_TO_LAT_DICT["Ю"] = "Ju";
  UA_CYR_TO_LAT_DICT["ю"] = "ju";
  UA_CYR_TO_LAT_DICT["Я"] = "Ja";
  UA_CYR_TO_LAT_DICT["я"] = "ja";
// Delete unused letters;
  UA_CYR_TO_LAT_DICT.remove("Ё");
  UA_CYR_TO_LAT_DICT.remove("ё");
  UA_CYR_TO_LAT_DICT.remove("Ъ");
  UA_CYR_TO_LAT_DICT.remove("ъ");
  UA_CYR_TO_LAT_DICT.remove("Ы");
  UA_CYR_TO_LAT_DICT.remove("ы");
  UA_CYR_TO_LAT_DICT.remove("Э");
  UA_CYR_TO_LAT_DICT.remove("э");

// Update for Ukrainian letters
  UA_CYR_TO_LAT_DICT
      .addAll({"Ґ": "G", "ґ": "g", "Є": "Je", "є": "je", "І": "I", "і": "i", "Ї": "Ï", "ї": "ï"});

// Latin to Cyrillic
  UA_LAT_TO_CYR_DICT = UA_CYR_TO_LAT_DICT.kvSwap();

// This version of Mongolian Latin <-> Cyrillic is based on  MNS 5217:2012
// as far as I know this is the latest standard. Imform me @ https://github.com/Serbipunk
// https://gogo.mn/r/101115
// https://en.wikipedia.org/wiki/Mongolian_Cyrillic_alphabet
  MN_CYR_TO_LAT_DICT = {
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
  MN_LAT_TO_CYR_DICT = MN_CYR_TO_LAT_DICT.kvSwap();
  MN_LAT_TO_CYR_DICT.addAll({
    "I": "И",
    "i": "и",
    "Sh": "Ш",
    "sh": "ш",
  });

// Bundle up all the dictionaries in a lookup dictionary
  TRANSLIT_DICT = {
    'sr': {
      // Serbia
      'tolatin': SR_CYR_TO_LAT_DICT,
      'tocyrillic': SR_LAT_TO_CYR_DICT,
    },
    'me': {
      // Montenegro
      'tolatin': ME_CYR_TO_LAT_DICT,
      'tocyrillic': ME_LAT_TO_CYR_DICT,
    },
    'mk': {
      // Macedonia
      'tolatin': MK_CYR_TO_LAT_DICT,
      'tocyrillic': MK_LAT_TO_CYR_DICT
    },
    'ru': {
      // Russian
      'tolatin': RU_CYR_TO_LAT_DICT,
      'tocyrillic': RU_LAT_TO_CYR_DICT,
    },
    'tj': {
      // Tajik
      'tolatin': TJ_CYR_TO_LAT_DICT,
      'tocyrillic': TJ_LAT_TO_CYR_DICT,
    },
    'bg': {
      // Bulgarian
      'tolatin': BG_CYR_TO_LAT_DICT,
      'tocyrillic': BG_LAT_TO_CYR_DICT,
    },
    'ua': {
      // Ukrainian
      'tolatin': UA_CYR_TO_LAT_DICT,
      'tocyrillic': UA_LAT_TO_CYR_DICT,
    },
    'mn': {
      // Mongolian
      'tolatin': MN_CYR_TO_LAT_DICT,
      'tocyrillic': MN_LAT_TO_CYR_DICT,
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
