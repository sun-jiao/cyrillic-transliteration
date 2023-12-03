import "mapping.dart";

String cyrillic2Latin(String stringToTransliterate, {String langCode = 'sr'}) {
// ''' Transliterate cyrillic string of characters to latin string of characters.
//     :param string_to_transliterate: The cyrillic string to transliterate into latin characters.
//     :param lang_code: Indicates the cyrillic language code we are translating from. Defaults to Serbian (sr).
//     :return: A string of latin characters transliterated from the given cyrillic string.
//     '''
  mappingInit();
// First check if we support the cyrillic alphabet we want to transliterate to latin.

  if (!translitDict.containsKey(langCode.toLowerCase())) {
// If we don't support it, then just return the original string.
    return stringToTransliterate;
  } else if (!translitDict[langCode.toLowerCase()]!.containsKey('tolatin')) {
    // If we do support it, check if the implementation is not missing before proceeding.
    return stringToTransliterate;
  }

// Everything checks out, proceed with transliteration.

// Get the character per character transliteration dictionary
  final transliterationDict = translitDict[langCode.toLowerCase()]!['tolatin']!;

// Initialize the output latin string variable
  String latinizedStr = '';

// Transliterate by traversing the input string character by character.
  stringToTransliterate = stringToTransliterate;

  for (String c in stringToTransliterate.split('')) {
    // If character is in dictionary, it means it's a cyrillic so let's transliterate that character.
    if (transliterationDict.containsKey(c)) {
      // Transliterate current character.
      latinizedStr += transliterationDict[c]!;
    } else {
      latinizedStr += c;
    }
  }
// Return the transliterated string.
  return latinizedStr;
}

String latin2Cyrillic(String stringToTransliterate, {String langCode = 'sr'}) {
// ''' Transliterate latin string of characters to cyrillic string of characters.
//     :param string_to_transliterate: The latin string to transliterate into cyrillic characters.
//     :param lang_code: Indicates the cyrillic language code we are translating to. Defaults to Serbian (sr).
//     :return: A string of cyrillic characters transliterated from the given latin string.
//     '''

  mappingInit();

  if (!translitDict.containsKey(langCode.toLowerCase())) {
// If we don't support it, then just return the original string.
    return stringToTransliterate;
  } else if (!translitDict[langCode.toLowerCase()]!.containsKey('tolatin')) {
// If we do support it, check if the implementation is not missing before proceeding.
    return stringToTransliterate;
  }
// First check if we support the cyrillic alphabet we want to transliterate to latin.
  if (!translitDict.containsKey(langCode.toLowerCase())) {
// If we don't support it, then just return the original string.
    return stringToTransliterate;
  } else if (!translitDict[langCode.toLowerCase()]!.containsKey('tocyrillic')) {
// If we do support it, check if the implementation is not missing before proceeding.
    return stringToTransliterate;
  }

// Get the character per character transliteration dictionary
  final transliterationDict = translitDict[langCode.toLowerCase()]!['tocyrillic']!;

// Initialize the output cyrillic string variable
  String cyrillicStr = '';

  stringToTransliterate = stringToTransliterate;

// Transliterate by traversing the inputted string character by character.
  final lengthOfStringToTransliterate = stringToTransliterate.length;
  int index = 0;

  while (index < lengthOfStringToTransliterate) {
    // Grab a character from the string at the current index
    String c = stringToTransliterate[index];

    // Watch out for Lj and lj. Don't want to interpret Lj/lj as L/l and j.
    // Watch out for Nj and nj. Don't want to interpret Nj/nj as N/n and j.
    // Watch out for Dž and and dž. Don't want to interpret Dž/dž as D/d and j.
    String cPlus1 = '';
    if (index != lengthOfStringToTransliterate - 1) {
      cPlus1 = stringToTransliterate[index + 1];
    }

    // String cPlus2 = '';
    // if (index + 2 <= lengthOfStringToTransliterate - 1) {
    //   cPlus2 = stringToTransliterate[index + 2];
    // }

    if (((c == 'L' || c == 'l') && cPlus1 == 'j') ||
        ((c == 'N' || c == 'n') && cPlus1 == 'j') ||
        ((c == 'D' || c == 'd') && cPlus1 == 'ž') ||
        (langCode == 'mk' && (c == 'D' || c == 'd') && cPlus1 == 'z') ||
        (langCode == 'bg' &&
            (('Zz'.contains(c) && 'Hh'.contains(cPlus1)) || // Zh, zh
                ('Tt'.contains(c) && 'Ss'.contains(cPlus1)) || // Ts, ts
                ('Ss'.contains(c) &&
                    'Hh'.contains(cPlus1)) || // Sh, sh (and also covers Sht, sht)
                ('Cc'.contains(c) && 'Hh'.contains(cPlus1)) || // Ch, ch
                ('Yy'.contains(c) && 'Uu'.contains(cPlus1)) || // Yu, yu
                ('Yy'.contains(c) && 'Aa'.contains(cPlus1)) // Ya, ya
            )) ||
        (langCode == 'ru' &&
            (('Cc'.contains(c) && 'HhKkZz'.contains(cPlus1)) || // c, ch, ck, cz
                ('Tt'.contains(c) && 'Hh'.contains(cPlus1)) || // th
                ('Ww'.contains(c) && 'Hh'.contains(cPlus1)) || // wh
                ('Pp'.contains(c) && 'Hh'.contains(cPlus1)) || // ph
                ('Ee'.contains(c) && cPlus1 == '\'') || // e'

                (c == 'i' &&
                    cPlus1 == 'y' &&
                    'aou'.contains(stringToTransliterate[index + 2])) || // iy[^AaOoUu]
                ('Jj'.contains(c) && 'UuAaEeIiOo'.contains(cPlus1)) || // j, ju, ja, je, ji, jo
                ('Ss'.contains(c) && 'HhZz'.contains(cPlus1)) || // s, sh, sz
                ('Yy'.contains(c) &&
                    "AaOoUuEeIi'".contains(cPlus1)) || // y, ya, yo, yu, ye, yi, y'
                ('Zz'.contains(c) && 'Hh'.contains(cPlus1)) || // z, zh
                (c == '\'' && cPlus1 == '\'') // ''
            )) ||
        (langCode == 'ua' &&
            (('Jj'.contains(c) && 'eau'.contains(cPlus1)) || //je, ja, ju
                ('Šš'.contains(c) && 'č'.contains(cPlus1)) //šč
            )) ||
        (langCode == "mn" &&
            (('Kk'.contains(c) && cPlus1 == 'h') || // Х х
                ('Ss'.contains(c) && cPlus1 == 'h') || // Ш ш
                ('Tt'.contains(c) && cPlus1 == 's') || // Ц ц
                ('Cc'.contains(c) && cPlus1 == 'h') || // Ч ч
                ('Yy'.contains(c) && 'eoua'.contains(cPlus1)) // Е Ё Ю Я
            ))) {
      index += 1;
      c += cPlus1;

      // In Bulgarian, the letter "щ" is represented by three latin letters: "sht",
      // so we need this logic to support the third latin letter
      if (langCode == 'bg' &&
          index + 2 <= lengthOfStringToTransliterate - 1 &&
          (c == 'sh' || c == 'Sh' || c == 'SH') &&
          'Tt'.contains(stringToTransliterate[index + 1])) {
        index += 1;
        c += stringToTransliterate[index];
      }
      // Similarly in Russian, the letter "щ" шы represented by "shh".
      if (langCode == 'ru' &&
          index + 2 <= lengthOfStringToTransliterate - 1 &&
          (c == 'sh' || c == 'Sh' || c == 'SH') &&
          'Hh'.contains(stringToTransliterate[index + 1])) {
        // shh
        index += 1;
        c += stringToTransliterate[index];
      }
      // In Mongolia the begining of if statement is not the truth
      //                ((c =='L' ||c =='l') &&c_plus_1 =='j') ||\
      //                ((c =='N' ||c =='n') &&c_plus_1 =='j') ||\
      //                ((c =='D' ||c =='d') &&c_plus_1 =='ž') ||\
      // Sü(nj)idmaa -> Сүнжидмаагаа  not  Сүnjидмаа
      // I add post-processing , wonder if @georgeslabreche would like to change the old code, thx
      if (langCode == 'mn' && ['Lj', 'lj', 'Nj', 'nj'].contains(c)) {
        index -= 1;
        c = c.substring(0, c.length - 1);
      }
    }
    // If character is in dictionary, it means it's a cyrillic so let's transliterate that character.
    if (transliterationDict.containsKey(c)) {
      // ay, ey, iy, oy, uy
      if (langCode == 'ru' &&
          'Yy'.contains(c) &&
          cyrillicStr.isNotEmpty &&
          "аеиоуэя".contains(cyrillicStr[-1].toLowerCase())) {
        cyrillicStr += c == 'y' ? "й" : "Й";
      } else {
        // Transliterate current character.
        cyrillicStr += transliterationDict[c]!;
      }
    } else {
      // If character is not in character transliteration dictionary,
      // it is most likely a number or a special character so just keep it.
      cyrillicStr += c;
    }

    index += 1;
  }
  return cyrillicStr;
}

List supported() {
// ''' Returns list of supported languages, sorted alphabetically.
//     :return:
//     '''
  return translitDict.keys.toList();
}
