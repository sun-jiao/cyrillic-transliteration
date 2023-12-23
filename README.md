[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.7734906.svg)](https://doi.org/10.5281/zenodo.7734906)

Please note: the author of this repository has no knowledge of any languages ​​that use the Cyrillic characters.  Any issues related to linguistics should be reported directly to the Python repository, and this repository will follow up after it is updated.

## What is CyrTranslit?
A Dart package for bi-directional transliteration of Cyrillic script to Latin script and vice versa.

By default, transliterates for the Serbian language. A language flag can be set in order to transliterate to and from Bulgarian, Montenegrin, Macedonian, Mongolian, Russian, Serbian, Tajik, and Ukrainian.

## What is transliteration?
Transliteration is the conversion of a text from one script to another. For instance, a Latin alphabet transliteration of the Serbian phrase _"Мој ховеркрафт је пун јегуља"_ is _"Moj hoverkraft je pun jegulja"_.

## Citation
This package is based on the [Python project cyrillic-transliteration](https://github.com/opendatakosovo/cyrillic-transliteration) which was originally authored by Open Data Kosovo.

A citation would be much appreciated if you use CyrTranslit in a research publication:

[Georges Labrèche. (2023). CyrTranslit (v1.1.1). Zenodo. https://doi.org/10.5281/zenodo.7734906](https://doi.org/10.5281/zenodo.7734906)

BibTex entry:
```bibtex
@software{georges_labreche_2023_7734906,
  author       = {Georges Labrèche},
  title        = {CyrTranslit},
  month        = mar,
  year         = 2023,
  note         = {{A Python package for bi-directional 
                   transliteration of Cyrillic script to Latin script
                   and vice versa. Supports transliteration for
                   Bulgarian, Montenegrin, Macedonian, Mongolian,
                   Russian, Serbian, Tajik, and Ukrainian.}},
  publisher    = {Zenodo},
  version      = {v1.1.1},
  doi          = {10.5281/zenodo.7734906},
  url          = {https://doi.org/10.5281/zenodo.7734906}
}
```

## Supporting research
CyrTranslit is actively used as a reliable tool to advance research! Here's an incomplete list of publications for research projects that have relied on CyrTranslit:
- Ljajić, Adela & Prodanović, Nikola & Medvecki, Darija & Bašaragin, Bojana & Mitrović, Jelena. (2022). "[Topic Modeling Technique on Covid19 Tweets in Serbian](https://www.researchgate.net/publication/364302202_Topic_Modeling_Technique_on_Covid19_Tweets_in_Serbian)," in 12th International Conference on Information Society and Technology (ICIST), Kopaonik, Serbia.
- Mussylmanbay, Meiirgali. (2022). "[Addresses Standardization and Geocoding using Natural Language Processing](https://nur.nu.edu.kz/handle/123456789/6705)," Nazarbayev University, Kazakhstan.
- Jokic, Danka & Stanković, Ranka & Krstev, Cvetana & Šandrih Todorović, Branislava. (2021). "[A Twitter Corpus and Lexicon for Abusive Speech Detection in Serbian](https://drops.dagstuhl.de/opus/volltexte/2021/14549/)," in 3rd Conference on Language, Data and Knowledge (LDK 2021). 10.4230/OASIcs.LDK.2021.13.
- Lakew, Surafel Melaku (2020). "[Thesis Multilingual Neural Machine Translation for Low Resource Languages](https://surafelml.github.io/phd-thesis/)," University of Trento, Italy.
- Filo, Denis. (2020). "[Neuronový strojový překlad pro jazykové páry s malým množstvím trénovacích dat: Low-Resource Neural Machine Translation](https://www.fit.vut.cz/study/thesis/23087/.en)," Brno University of Technology, Brno, Czechia.
- Batanović, Vuk & Nikolic, Bosko. (2019). "[Using Language Technologies to Automate the UNDP Rapid Integrated Assessment Mechanism in Serbian](https://www.researchgate.net/publication/339615659_Using_Language_Technologies_to_Automate_the_UNDP_Rapid_Integrated_Assessment_Mechanism_in_Serbian)," in International Conference on Language Technologies for All: Enabling Linguistic Diversity and Multilingualism Worldwide (LT4All), Paris, France.
- Brown, J. M. M. & Schmidt, Andreas & Wierzba, Marta (Eds.). (2019). "[Of trees and birds: A Festschrift for Gisbert Fanselow](https://publishup.uni-potsdam.de/opus4-ubp/frontdoor/deliver/index/docId/42654/file/of_trees_and_birds.pdf)," Universitätsverlag Potsdam, Potsdam.
- Lakew, Surafel Melaku & Erofeeva, Aliia & Federico, Marcello. (2018). "[Neural Machine Translation into Language Varieties](https://aclanthology.org/W18-6316/)," in 3rd Conference on Machine Translation: Research Papers, Brussels, Belgium.
- Ljajić, Adela & Marovac, Ulfeta. (2018). "[Improving sentiment analysis for twitter data by handling negation rules in the Serbian language](http://www.doiserbia.nb.rs/Article.aspx?ID=1820-02141800013L)," Computer Science and Information Systems. 16. 13-13. 10.2298/CSIS180122013L.
- Жабран, И., Кикоть, А., Гафияк, А., Бородина, Е., & Алёшин, С. (2017). "[Developing Q-Orca site backend using various Python programming language libraries](https://www.moderntechno.de/index.php/meit/article/view/meit07-03-021)," Modern Engineering and Innovative Technologies, 3(07-03), 48–53.

## How do I install this?
CyrTranslit is [Dart pub repository](https://pub.dev/packages/cyrtranslit) so it can be installed using pub add:
```
dart pub add cyrtranslit          # latest version
dart pub add cyrtranslit: version   # specific version
dart pub add cyrtranslit:'^version'  # minimum version
```

or you can also add this package to your `pubspec.yaml` file.
```yaml
dependencies:
  cyrtranslit: ^1.0.0
```

## What languages are supported?
CyrTranslit currently supports bi-directional transliteration of Bulgarian, Montenegrin, Macedonian, Mongolian, Russian, Serbian, Tajik, and Ukrainian:
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.supported())
['bg', 'me', 'mk', 'mn', 'ru', 'sr', 'tj', 'ua']
```
## How do I use this?
### Bulgarian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Съединението прави силата!", langCode: "bg"))
"Săedinenieto pravi silata!"
print(cyrtranslit.lat2Cyr("Săedinenieto pravi silata!", langCode: "bg"))
"Съединението прави силата!"
```

### Montenegrin
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Република", langCode: "me"))
"Republika"
print(cyrtranslit.lat2Cyr("Republika", langCode: "me"))
"Република"
```

### Macedonian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Моето летачко возило е полно со јагули", langCode: "mk"))
"Moeto letačko vozilo e polno so jaguli"
print(cyrtranslit.lat2Cyr("Moeto letačko vozilo e polno so jaguli", langCode: "mk"))
"Моето летачко возило е полно со јагули"
```

### Mongolian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Амрагаа Сүнжидмаагаа гэсээр ирлээ дээ хө-хө-хө", langCode: "mn"))
"Amragaa Sünjidmaagaa geseer irlee dee khö-khö-khö"
print(cyrtranslit.lat2Cyr("Amragaa Sünjidmaagaa geseer irlee dee khö-khö-khö", langCode: "mn"))
"Амрагаа Сүнжидмаагаа гэсээр ирлээ дээ хө-хө-хө"
```

### Russian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Моё судно на воздушной подушке полно угрей", langCode: "ru"))
"Moyo sudno na vozdushnoj podushke polno ugrej"
print(cyrtranslit.lat2Cyr("Moyo sudno na vozdushnoj podushke polno ugrej", langCode: "ru"))
"Моё судно на воздушной подушке полно угрей"
```

### Serbian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Мој ховеркрафт је пун јегуља"))
"Moj hoverkraft je pun jegulja"
print(cyrtranslit.lat2Cyr("Moj hoverkraft je pun jegulja"))
"Мој ховеркрафт је пун јегуља"
```

### Tajik
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Ман мактуб навишта истодам", langCode: "tj"))
"Man maktub navišta istodam"
print(cyrtranslit.lat2Cyr("Man maktub navišta istodam", langCode: "tj"))
"Ман мактуб навишта истодам"
```

### Ukrainian
```dart
import 'package:cyrtranslit/cyrtranslit.dart' as cyrtranslit;
print(cyrtranslit.cyr2Lat("Під лежачий камінь вода не тече", langCode: "ua"))
"Pid ležačyj kamin' voda ne teče"
print(cyrtranslit.lat2Cyr("Pid ležačyj kamin' voda ne teče", langCode: "ua"))
"Під лежачий камінь вода не тече"
```

## How can I contribute?
You can include support for other Cyrillic script alphabets. Follow these steps in order to do so:

1. Create a new transliteration dictionary in the **[mapping.dart](https://github.com/sun-jiao/cyrillic-transliteration/blob/83efe7056b1af29c73d1b2dff853bf0972f3d220/lib/src/mapping.dart#L435-L476)**_ dictionary.
2. Watch out for cases where two consecutive Latin alphabet letters are meant to transliterate into a single Cyrillic script letter. These cases need to be explicitly checked for [inside the **lat2Cyr()** function in **transliterator.dart**](https://github.com/sun-jiao/cyrillic-transliteration/blob/83efe7056b1af29c73d1b2dff853bf0972f3d220/lib/src/transliterator.dart#L44-L192).
3. Add test cases inside of **[cyrtranslit_test.dart](https://github.com/sun-jiao/cyrillic-transliteration/blob/master/test/cyrtranslit_test.dart)**.
4. Update the documentation in the **[README.md](https://github.com/sun-jiao/cyrillic-transliteration/blob/master/README.md)**.
5. List yourself as one of the contributors.

Before tagging a release version and deploying to [pub.dev](https://pub.dev/):
1. Update the `version` properties in [pubspec.yaml](https://github.com/sun-jiao/cyrillic-transliteration/blob/master/pubspec.yaml).

A big thank you to everyone who contributed:
- Original python package: Members of [@opendatakosovo](https://github.com/opendatakosovo).
- Bulgarian 🇧🇬: [@Syndamia](https://github.com/Syndamia) and [@Sparkycz](https://github.com/Sparkycz).
- Russian 🇷🇺: [@ratijas](https://github.com/ratijas) and [@rominf](https://github.com/rominf).
- Tajik 🇹🇯: [@diejani](https://github.com/diejani).
- Ukrainian 🇺🇦: [@AnonymousVoice1](https://github.com/AnonymousVoice1).
- Mongolian 🇲🇳: [@Serbipunk](https://github.com/Serbipunk).
- Command Line Interface (CLI): [@ZJaume](https://github.com/ZJaume) (Not implemented in dart package).
