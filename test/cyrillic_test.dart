import 'package:cyrillic/cyrillic.dart';
import 'package:test/test.dart';

// Test inputs and output strings
final serbianAlphabetCyrillic = 'АаБбВвГгДдЂђЕеЖжЗзИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЋћУуФфХхЦцЧчЏџШш';
final serbianAlphabetLatin = 'AaBbVvGgDdĐđEeŽžZzIiJjKkLlLjljMmNnNjnjOoPpRrSsTtĆćUuFfHhCcČčDždžŠš';

final montenegrinAlphabetCyrillic = 'АаБбВвГгДдЂђЕеЖжЗзЗ́з́ИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЋћУуФфХхЦцЧчЏџШшС́с́';
final montenegrinAlphabetLatin = 'AaBbVvGgDdĐđEeŽžZzŹźIiJjKkLlLjljMmNnNjnjOoPpRrSsTtĆćUuFfHhCcČčDždžŠšŚś';

final macedonianAlphabetCyrillic = 'АаБбВвГгДдЃѓЕеЖжЗзЅѕИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЌќУуФфХхЦцЧчЏџШш';
final macedonianAlphabetLatin = 'AaBbVvGgDdǴǵEeŽžZzDzdzIiJjKkLlLjljMmNnNjnjOoPpRrSsTtḰḱUuFfHhCcČčDždžŠš';

final russianAlphabetCyrillic = 'АаБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыьЭэЮюЯя';
final russianAlphabetLatin = 'AaBbVvGgDdEeYOyoZHzhZzIiJjKkLlMmNnOoPpRrSsTtUuFfXxCZczCHchSHshSHHshh\'\'\'\'Y\'y\'\'E\'e\'YUyuYAya';

final tajikAlphabetCyrillic = 'АаБбВвГгҒғДдЕеЁёЖжЗзИиӢӣЙйКкЛлМмНнОоПпРрСсТтУуӮӯФфХхҲҳЧчҶҷШшъЭэЮюЯя';
final tajikAlphabetLatin = 'AaBbVvGgǦǧDdEeËëŽžZzIiĪīJjKkLlMmNnOoPpRrSsTtUuŪūFfHhḨḩČčÇçŠš’ÈèÛûÂâ';

final bulgarianAlphabetCyrillic = 'АаБбВвГгДдЕеЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЬьЮюЯя';
final bulgarianAlphabetLatin = 'AaBbVvGgDdEeZHzhZzIiYyKkLlMmNnOoPpRrSsTtUuFfHhTStsCHchSHshSHTshtĂăJjYUyuYAya';

final ukrainianAlphabetCyrillic = 'АаБбВвГгҐґДдЕеЄєЖжЗзИиІіЇїЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЮюЯяь'; // not testing Ь for the apostrophe, sticking with just ь. Both will transliterate to '.
final ukrainianAlphabetLatin = 'AaBbVvHhGgDdEeJejeŽžZzYyIiÏïJjKkLlMmNnOoPpRrSsTtUuFfXxCcČčŠšŠčščJujuJaja\'';

final mongolianAlphabetCyrillic = 'АаЭэИиОоУуӨөҮүНнМмЛлВвПпФфКкХхГгСсШшТтДдЦцЧчЗзЖжРрБбЕеЁёЫыЮюЯя';  // exclude (Й Ъ Ь)<->I  Щ<->Sh
final mongolianAlphabetLatin = 'AaEeIiOoUuÖöÜüNnMmLlVvPpFfKkKhkhGgSsShshTtDdTstsChchZzJjRrBbYeyeYoyoYyYuyuYaya';

final specialChars = '‘’‚“”„†‡‰‹›♠♣♥♦‾←↑→↓™!"#\$%&\'()*+,-./ :;<=>?@[\\]^_`{|}~…–—¡¢£¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿×';

final diacriticChars = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïðñòóôõöøùúûüý';

final numericalChars = '1234567890';

final alphabetChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

final mixCharactersSomeCyrillic = '!ЉFљñМ мНÈÆнЊњО)*+,оП>пР?р';
final mixCharactersAllLatin = '!LjFljñM mNÈÆnNjnjO)*+,oP>pR?r';

final mixCharactersSomeCyrillicNoAlpha = '\'Ћ<=>?ћУуФфХхЦцЧчЏ%4џШ12ш♥';
final mixCharactersAllLatinNoAlpha = '\'Ć<=>?ćUuFfHhCcČčDž%4džŠ12š♥';

void main() {
  group('Test Serbian Transliteration From Cyrillic To Latin', () {
    test('Transliteration of entire Serbian cyrillic alphabet to latin.', () {
      final transliteratedSerbianAlphabet = cyrillic2Latin(serbianAlphabetCyrillic);
      expect(transliteratedSerbianAlphabet, equals(serbianAlphabetLatin));
    });

    test('Special characters should remain the same.', () {
      final transliteratedSpecialChars = cyrillic2Latin(specialChars);
      expect(transliteratedSpecialChars, equals(specialChars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyrillic2Latin(diacriticChars);
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyrillic2Latin(numericalChars);
      expect(transliteratedNumericalChars, equals(numericalChars));
    });

    test('Alphabet characters should remain the same.', () {
      final transliteratedAlphabetChars = cyrillic2Latin(alphabetChars);
      expect(transliteratedAlphabetChars, equals(alphabetChars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones should not.', () {
      final transliteratedMix = cyrillic2Latin(mixCharactersSomeCyrillic);
      expect(transliteratedMix, equals(mixCharactersAllLatin));
    });
  });

  group('Test Serbian Transliteration From Latin To Cyrillic', () {
    test('Transliteration of entire Serbian cyrillic alphabet to latin.', () {
      final transliteratedSerbianAlphabet = cyrillic2Latin(serbianAlphabetCyrillic);
      expect(transliteratedSerbianAlphabet, equals(serbianAlphabetLatin));
    });

    test('Special characters should remain the same.', () {
      final transliteratedSpecialChars = cyrillic2Latin(specialChars);
      expect(transliteratedSpecialChars, equals(specialChars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyrillic2Latin(diacriticChars);
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyrillic2Latin(numericalChars);
      expect(transliteratedNumericalChars, equals(numericalChars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones should not.', () {
      final transliteratedMix = latin2Cyrillic(mixCharactersAllLatinNoAlpha);
      expect(transliteratedMix, equals(mixCharactersSomeCyrillicNoAlpha));
    });
  });

  group('Test Montenegrin Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(montenegrinAlphabetCyrillic, langCode: 'me');
      expect(transliteratedAlphabet, equals(montenegrinAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(montenegrinAlphabetLatin, langCode: 'me');
      expect(transliteratedAlphabet, equals(montenegrinAlphabetCyrillic));
    });
  });

  group('Test Macedonian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(macedonianAlphabetCyrillic, langCode: 'mk');
      expect(transliteratedAlphabet, equals(macedonianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(macedonianAlphabetLatin, langCode: 'mk');
      expect(transliteratedAlphabet, equals(macedonianAlphabetCyrillic));
    });
  });

  group('Test Russian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(russianAlphabetCyrillic, langCode: 'ru');
      expect(transliteratedAlphabet, equals(russianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(russianAlphabetLatin, langCode: 'ru');
      expect(transliteratedAlphabet, equals(russianAlphabetCyrillic.replaceAll('Ъ', 'ъ').replaceAll('Ь', 'ь').replaceAll('Ы', 'ы')));
    });
  });

  group('Test Tajik Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(tajikAlphabetCyrillic, langCode: 'tj');
      expect(transliteratedAlphabet, equals(tajikAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(tajikAlphabetLatin, langCode: 'tj');
      expect(transliteratedAlphabet, equals(tajikAlphabetCyrillic));
    });
  });

  group('Test Ukrainian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(ukrainianAlphabetCyrillic, langCode: 'ua');
      expect(transliteratedAlphabet, equals(ukrainianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(ukrainianAlphabetLatin, langCode: 'ua');
      expect(transliteratedAlphabet, equals(ukrainianAlphabetCyrillic));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyrillic2Latin(diacriticChars, langCode: 'tj');
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyrillic2Latin(numericalChars, langCode: 'tj');
      expect(transliteratedNumericalChars, equals(numericalChars));
    });
  });

  group('Test Bulgarian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyrillic2Latin(bulgarianAlphabetCyrillic, langCode: 'bg');
      expect(transliteratedAlphabet, equals(bulgarianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = latin2Cyrillic(bulgarianAlphabetLatin, langCode: 'bg');
      expect(transliteratedAlphabet, equals(bulgarianAlphabetCyrillic));
    });

    test('Check if "sh" at the end of the string doesn\'t cause any exception.', () {
      final transliteratedAlphabet = latin2Cyrillic("AaBbsh", langCode: 'bg');
      expect(transliteratedAlphabet, equals("АаБбш"));
    });
  });

  group('Test Mongolian Transliteration From Cyrillic To Latin', () {
    test('Transliteration of entire Mongolian cyrillic alphabet to latin.', () {
      final transliteratedMongolianAlphabet = cyrillic2Latin(mongolianAlphabetCyrillic, langCode: 'mn');
      expect(transliteratedMongolianAlphabet, equals(mongolianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedMongolianAlphabet = latin2Cyrillic(mongolianAlphabetLatin, langCode: 'mn');
      expect(transliteratedMongolianAlphabet, equals(mongolianAlphabetCyrillic));
    });
  });
}
