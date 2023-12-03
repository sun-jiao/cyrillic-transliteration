import 'package:cyrtranslit/cyrtranslit.dart';
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
      final transliteratedSerbianAlphabet = cyr2Lat(serbianAlphabetCyrillic);
      expect(transliteratedSerbianAlphabet, equals(serbianAlphabetLatin));
    });

    test('Special characters should remain the same.', () {
      final transliteratedSpecialChars = cyr2Lat(specialChars);
      expect(transliteratedSpecialChars, equals(specialChars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyr2Lat(diacriticChars);
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyr2Lat(numericalChars);
      expect(transliteratedNumericalChars, equals(numericalChars));
    });

    test('Alphabet characters should remain the same.', () {
      final transliteratedAlphabetChars = cyr2Lat(alphabetChars);
      expect(transliteratedAlphabetChars, equals(alphabetChars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones should not.', () {
      final transliteratedMix = cyr2Lat(mixCharactersSomeCyrillic);
      expect(transliteratedMix, equals(mixCharactersAllLatin));
    });
  });

  group('Test Serbian Transliteration From Latin To Cyrillic', () {
    test('Transliteration of entire Serbian cyrillic alphabet to latin.', () {
      final transliteratedSerbianAlphabet = cyr2Lat(serbianAlphabetCyrillic);
      expect(transliteratedSerbianAlphabet, equals(serbianAlphabetLatin));
    });

    test('Special characters should remain the same.', () {
      final transliteratedSpecialChars = cyr2Lat(specialChars);
      expect(transliteratedSpecialChars, equals(specialChars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyr2Lat(diacriticChars);
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyr2Lat(numericalChars);
      expect(transliteratedNumericalChars, equals(numericalChars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones should not.', () {
      final transliteratedMix = lat2Cyr(mixCharactersAllLatinNoAlpha);
      expect(transliteratedMix, equals(mixCharactersSomeCyrillicNoAlpha));
    });
  });

  group('Test Montenegrin Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(montenegrinAlphabetCyrillic, langCode: 'me');
      expect(transliteratedAlphabet, equals(montenegrinAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(montenegrinAlphabetLatin, langCode: 'me');
      expect(transliteratedAlphabet, equals(montenegrinAlphabetCyrillic));
    });
  });

  group('Test Macedonian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(macedonianAlphabetCyrillic, langCode: 'mk');
      expect(transliteratedAlphabet, equals(macedonianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(macedonianAlphabetLatin, langCode: 'mk');
      expect(transliteratedAlphabet, equals(macedonianAlphabetCyrillic));
    });
  });

  group('Test Russian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(russianAlphabetCyrillic, langCode: 'ru');
      expect(transliteratedAlphabet, equals(russianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(russianAlphabetLatin, langCode: 'ru');
      expect(transliteratedAlphabet, equals(russianAlphabetCyrillic.replaceAll('Ъ', 'ъ').replaceAll('Ь', 'ь').replaceAll('Ы', 'ы')));
    });
  });

  group('Test Tajik Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(tajikAlphabetCyrillic, langCode: 'tj');
      expect(transliteratedAlphabet, equals(tajikAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(tajikAlphabetLatin, langCode: 'tj');
      expect(transliteratedAlphabet, equals(tajikAlphabetCyrillic));
    });
  });

  group('Test Ukrainian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(ukrainianAlphabetCyrillic, langCode: 'ua');
      expect(transliteratedAlphabet, equals(ukrainianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(ukrainianAlphabetLatin, langCode: 'ua');
      expect(transliteratedAlphabet, equals(ukrainianAlphabetCyrillic));
    });

    test('Diacritic characters should remain the same.', () {
      final transliteratedDiacriticChars = cyr2Lat(diacriticChars, langCode: 'tj');
      expect(transliteratedDiacriticChars, equals(diacriticChars));
    });

    test('Numerical characters should remain the same.', () {
      final transliteratedNumericalChars = cyr2Lat(numericalChars, langCode: 'tj');
      expect(transliteratedNumericalChars, equals(numericalChars));
    });
  });

  group('Test Bulgarian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliteratedAlphabet = cyr2Lat(bulgarianAlphabetCyrillic, langCode: 'bg');
      expect(transliteratedAlphabet, equals(bulgarianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedAlphabet = lat2Cyr(bulgarianAlphabetLatin, langCode: 'bg');
      expect(transliteratedAlphabet, equals(bulgarianAlphabetCyrillic));
    });

    test('Check if "sh" at the end of the string doesn\'t cause any exception.', () {
      final transliteratedAlphabet = lat2Cyr("AaBbsh", langCode: 'bg');
      expect(transliteratedAlphabet, equals("АаБбш"));
    });
  });

  group('Test Mongolian Transliteration From Cyrillic To Latin', () {
    test('Transliteration of entire Mongolian cyrillic alphabet to latin.', () {
      final transliteratedMongolianAlphabet = cyr2Lat(mongolianAlphabetCyrillic, langCode: 'mn');
      expect(transliteratedMongolianAlphabet, equals(mongolianAlphabetLatin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliteratedMongolianAlphabet = lat2Cyr(mongolianAlphabetLatin, langCode: 'mn');
      expect(transliteratedMongolianAlphabet, equals(mongolianAlphabetCyrillic));
    });
  });
}
