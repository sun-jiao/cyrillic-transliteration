import 'package:cyrillic/cyrillic.dart';
import 'package:test/test.dart';

// Test inputs and output strings
final serbian_alphabet_cyrillic = 'АаБбВвГгДдЂђЕеЖжЗзИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЋћУуФфХхЦцЧчЏџШш';
final serbian_alphabet_latin = 'AaBbVvGgDdĐđEeŽžZzIiJjKkLlLjljMmNnNjnjOoPpRrSsTtĆćUuFfHhCcČčDždžŠš';

final montenegrin_alphabet_cyrillic = 'АаБбВвГгДдЂђЕеЖжЗзЗ́з́ИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЋћУуФфХхЦцЧчЏџШшС́с́';
final montenegrin_alphabet_latin = 'AaBbVvGgDdĐđEeŽžZzŹźIiJjKkLlLjljMmNnNjnjOoPpRrSsTtĆćUuFfHhCcČčDždžŠšŚś';

final macedonian_alphabet_cyrillic = 'АаБбВвГгДдЃѓЕеЖжЗзЅѕИиЈјКкЛлЉљМмНнЊњОоПпРрСсТтЌќУуФфХхЦцЧчЏџШш';
final macedonian_alphabet_latin = 'AaBbVvGgDdǴǵEeŽžZzDzdzIiJjKkLlLjljMmNnNjnjOoPpRrSsTtḰḱUuFfHhCcČčDždžŠš';

final russian_alphabet_cyrillic = 'АаБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыьЭэЮюЯя';
final russian_alphabet_latin = 'AaBbVvGgDdEeYOyoZHzhZzIiJjKkLlMmNnOoPpRrSsTtUuFfXxCZczCHchSHshSHHshh\'\'\'\'Y\'y\'\'E\'e\'YUyuYAya';

final tajik_alphabet_cyrillic = 'АаБбВвГгҒғДдЕеЁёЖжЗзИиӢӣЙйКкЛлМмНнОоПпРрСсТтУуӮӯФфХхҲҳЧчҶҷШшъЭэЮюЯя';
final tajik_alphabet_latin = 'AaBbVvGgǦǧDdEeËëŽžZzIiĪīJjKkLlMmNnOoPpRrSsTtUuŪūFfHhḨḩČčÇçŠš’ÈèÛûÂâ';

final bulgarian_alphabet_cyrillic = 'АаБбВвГгДдЕеЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЬьЮюЯя';
final bulgarian_alphabet_latin = 'AaBbVvGgDdEeZHzhZzIiYyKkLlMmNnOoPpRrSsTtUuFfHhTStsCHchSHshSHTshtĂăJjYUyuYAya';

final ukrainian_alphabet_cyrillic = 'АаБбВвГгҐґДдЕеЄєЖжЗзИиІіЇїЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЮюЯяь'; // not testing Ь for the apostrophe, sticking with just ь. Both will transliterate to '.
final ukrainian_alphabet_latin = 'AaBbVvHhGgDdEeJejeŽžZzYyIiÏïJjKkLlMmNnOoPpRrSsTtUuFfXxCcČčŠšŠčščJujuJaja\'';

final mongolian_alphabet_cyrillic = 'АаЭэИиОоУуӨөҮүНнМмЛлВвПпФфКкХхГгСсШшТтДдЦцЧчЗзЖжРрБбЕеЁёЫыЮюЯя';  // exclude (Й Ъ Ь)<->I  Щ<->Sh
final mongolian_alphabet_latin = 'AaEeIiOoUuÖöÜüNnMmLlVvPpFfKkKhkhGgSsShshTtDdTstsChchZzJjRrBbYeyeYoyoYyYuyuYaya';

final special_chars = '‘’‚“”„†‡‰‹›♠♣♥♦‾←↑→↓™!"#\$%&\'()*+,-./ :;<=>?@[\\]^_`{|}~…–—¡¢£¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿×';

final diacritic_chars = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝàáâãäåæçèéêëìíîïðñòóôõöøùúûüý';

final numerical_chars = '1234567890';

final alphabet_chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';

final mix_characters_some_cyrillic = '!ЉFљñМ мНÈÆнЊњО)*+,оП>пР?р';
final mix_characters_all_latin = '!LjFljñM mNÈÆnNjnjO)*+,oP>pR?r';

final mix_characters_some_cyrillic_no_alpha = '\'Ћ<=>?ћУуФфХхЦцЧчЏ%4џШ12ш♥';
final mix_characters_all_latin_no_alpha = '\'Ć<=>?ćUuFfHhCcČčDž%4džŠ12š♥';


void main() {
  group('Test Serbian Transliteration From Cyrillic To Latin', () {
    test('Transliteration of entire Serbian cyrillic alphabet to latin.', () {
      final transliterated_serbian_alphabet = cyrillic2Latin(serbian_alphabet_cyrillic);
      expect(transliterated_serbian_alphabet, equals(serbian_alphabet_latin));
    });

    test('Special characters should remain the same.', () {
      final transliterated_special_chars = cyrillic2Latin(special_chars);
      expect(transliterated_special_chars, equals(special_chars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliterated_diacritic_chars = cyrillic2Latin(diacritic_chars);
      expect(transliterated_diacritic_chars, equals(diacritic_chars));
    });

    test('Numerical characters should remain the same.', () {
      final transliterated_numerical_chars = cyrillic2Latin(numerical_chars);
      expect(transliterated_numerical_chars, equals(numerical_chars));
    });

    test('Alphabet characters should remain the same.', () {
      final transliterated_alphabet_chars = cyrillic2Latin(alphabet_chars);
      expect(transliterated_alphabet_chars, equals(alphabet_chars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones should not.', () {
      final transliterated_mix = cyrillic2Latin(mix_characters_some_cyrillic);
      expect(transliterated_mix, equals(mix_characters_all_latin));
    });
  });

  group('Test Serbian Transliteration From Latin To Cyrillic', () {
    test('Transliteration of entire Serbian cyrillic alphabet to latin.', () {
      final transliterated_serbian_alphabet = cyrillic2Latin(serbian_alphabet_cyrillic);
      expect(transliterated_serbian_alphabet, equals(serbian_alphabet_latin));
    });

    test('Special characters should remain the same.', () {
      final transliterated_special_chars = cyrillic2Latin(special_chars);
      expect(transliterated_special_chars, equals(special_chars));
    });

    test('Diacritic characters should remain the same.', () {
      final transliterated_diacritic_chars = cyrillic2Latin(diacritic_chars);
      expect(transliterated_diacritic_chars, equals(diacritic_chars));
    });

    test('Numerical characters should remain the same.', () {
      final transliterated_numerical_chars = cyrillic2Latin(numerical_chars);
      expect(transliterated_numerical_chars, equals(numerical_chars));
    });

    test('Serbian cyrillic characters should be transliterated but non-Serbian cyrillic ones shouldn\'t.', () {
      final transliterated_mix = latin2Cyrillic(mix_characters_all_latin_no_alpha);
      expect(transliterated_mix, equals(mix_characters_some_cyrillic_no_alpha));
    });
  });

  group('Test Montenegrin Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(montenegrin_alphabet_cyrillic, langCode: 'me');
      expect(transliterated_alphabet, equals(montenegrin_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(montenegrin_alphabet_latin, langCode: 'me');
      expect(transliterated_alphabet, equals(montenegrin_alphabet_cyrillic));
    });
  });

  group('Test Macedonian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(macedonian_alphabet_cyrillic, langCode: 'mk');
      expect(transliterated_alphabet, equals(macedonian_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(macedonian_alphabet_latin, langCode: 'mk');
      expect(transliterated_alphabet, equals(macedonian_alphabet_cyrillic));
    });
  });

  group('Test Russian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(russian_alphabet_cyrillic, langCode: 'ru');
      expect(transliterated_alphabet, equals(russian_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(russian_alphabet_latin, langCode: 'ru');
      expect(transliterated_alphabet, equals(russian_alphabet_cyrillic.replaceAll('Ъ', 'ъ').replaceAll('Ь', 'ь').replaceAll('Ы', 'ы')));
    });
  });

  group('Test Tajik Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(tajik_alphabet_cyrillic, langCode: 'tj');
      expect(transliterated_alphabet, equals(tajik_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(tajik_alphabet_latin, langCode: 'tj');
      expect(transliterated_alphabet, equals(tajik_alphabet_cyrillic));
    });
  });

  group('Test Ukrainian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(ukrainian_alphabet_cyrillic, langCode: 'ua');
      expect(transliterated_alphabet, equals(ukrainian_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(ukrainian_alphabet_latin, langCode: 'ua');
      expect(transliterated_alphabet, equals(ukrainian_alphabet_cyrillic));
    });

    test('Diacritic characters should remain the same.', () {
      final transliterated_diacritic_chars = cyrillic2Latin(diacritic_chars, langCode: 'tj');
      expect(transliterated_diacritic_chars, equals(diacritic_chars));
    });

    test('Numerical characters should remain the same.', () {
      final transliterated_numerical_chars = cyrillic2Latin(numerical_chars, langCode: 'tj');
      expect(transliterated_numerical_chars, equals(numerical_chars));
    });
  });

  group('Test Bulgarian Transliteration', () {
    test('Transliteration of entire cyrillic alphabet to latin.', () {
      final transliterated_alphabet = cyrillic2Latin(bulgarian_alphabet_cyrillic, langCode: 'bg');
      expect(transliterated_alphabet, equals(bulgarian_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_alphabet = latin2Cyrillic(bulgarian_alphabet_latin, langCode: 'bg');
      expect(transliterated_alphabet, equals(bulgarian_alphabet_cyrillic));
    });

    test('Check if "sh" at the end of the string doesn\'t cause any exception.', () {
      final transliterated_alphabet = latin2Cyrillic("AaBbsh", langCode: 'bg');
      expect(transliterated_alphabet, equals("АаБбш"));
    });
  });

  group('Test Mongolian Transliteration From Cyrillic To Latin', () {
    test('Transliteration of entire Mongolian cyrillic alphabet to latin.', () {
      final transliterated_mongolian_alphabet = cyrillic2Latin(mongolian_alphabet_cyrillic, langCode: 'mn');
      expect(transliterated_mongolian_alphabet, equals(mongolian_alphabet_latin));
    });

    test('Transliteration of entire latin alphabet to cyrillic.', () {
      final transliterated_mongolian_alphabet = latin2Cyrillic(mongolian_alphabet_latin, langCode: 'mn');
      expect(transliterated_mongolian_alphabet, equals(mongolian_alphabet_cyrillic));
    });
  });
}
