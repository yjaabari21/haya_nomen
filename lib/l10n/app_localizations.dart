import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @hayaNomen.
  ///
  /// In en, this message translates to:
  /// **'Haya nomen'**
  String get hayaNomen;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// No description provided for @appAppearance.
  ///
  /// In en, this message translates to:
  /// **'App appearance'**
  String get appAppearance;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @followsPhoneSettings.
  ///
  /// In en, this message translates to:
  /// **'Follows your phone settings'**
  String get followsPhoneSettings;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @whatIfLostSight.
  ///
  /// In en, this message translates to:
  /// **'What if we lost our sight?'**
  String get whatIfLostSight;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Our faith education is designed for children and young people. In Haya Nomen, we draw inspiration from the Quran and Sunnah and accompany children on unique journeys of faith.'**
  String get aboutDescription;

  /// No description provided for @copyrightTitle.
  ///
  /// In en, this message translates to:
  /// **'Intellectual property rights'**
  String get copyrightTitle;

  /// No description provided for @copyrightText.
  ///
  /// In en, this message translates to:
  /// **'All content in this application is dedicated to Allah. It may be shared and used without prior permission, provided it is not altered and the source is credited.'**
  String get copyrightText;

  /// No description provided for @tadborTitle1.
  ///
  /// In en, this message translates to:
  /// **'The Best Form'**
  String get tadborTitle1;

  /// No description provided for @tadborDescription1.
  ///
  /// In en, this message translates to:
  /// **'Allah created human beings intelligent, upright, and able to use their hands and fingers.'**
  String get tadborDescription1;

  /// No description provided for @tadborTitle2.
  ///
  /// In en, this message translates to:
  /// **'Between Strength and Flexibility'**
  String get tadborTitle2;

  /// No description provided for @tadborDescription2.
  ///
  /// In en, this message translates to:
  /// **'Allah gave human fingers precise joints combining strength and flexibility, connected to tendons and nerves for quick control and response.'**
  String get tadborDescription2;

  /// No description provided for @tadborTitle3.
  ///
  /// In en, this message translates to:
  /// **'The Thumb and Recording Knowledge'**
  String get tadborTitle3;

  /// No description provided for @tadborDescription3.
  ///
  /// In en, this message translates to:
  /// **'Allah swears by the pen and by what writers record. Without the thumb, writing and documenting knowledge would not be possible.'**
  String get tadborDescription3;

  /// No description provided for @tadborTitle4.
  ///
  /// In en, this message translates to:
  /// **'Knowing Allah Is the Foundation of Knowledge'**
  String get tadborTitle4;

  /// No description provided for @tadborDescription4.
  ///
  /// In en, this message translates to:
  /// **'Useful knowledge begins by knowing Allah, who created, honored, and taught us, and to whom the believer returns every blessing.'**
  String get tadborDescription4;

  /// No description provided for @tadborTitle5.
  ///
  /// In en, this message translates to:
  /// **'Bringing the Dead to Life'**
  String get tadborTitle5;

  /// No description provided for @tadborDescription5.
  ///
  /// In en, this message translates to:
  /// **''**
  String get tadborDescription5;

  /// No description provided for @tadborTitle6.
  ///
  /// In en, this message translates to:
  /// **'A Call to Use Our Sight'**
  String get tadborTitle6;

  /// No description provided for @tadborDescription6.
  ///
  /// In en, this message translates to:
  /// **'The barren, dry earth where no plants grow.'**
  String get tadborDescription6;

  /// No description provided for @tadborTitle7.
  ///
  /// In en, this message translates to:
  /// **'A Quranic Miracle in Soil Science'**
  String get tadborTitle7;

  /// No description provided for @tadborDescription7.
  ///
  /// In en, this message translates to:
  /// **'The Quran describes the earth coming alive when rain reaches it, a remarkable process later observed by science.'**
  String get tadborDescription7;

  /// No description provided for @tadborTitle8.
  ///
  /// In en, this message translates to:
  /// **'For You... For You!!'**
  String get tadborTitle8;

  /// No description provided for @tadborDescription8.
  ///
  /// In en, this message translates to:
  /// **'You pasture your livestock.'**
  String get tadborDescription8;

  /// No description provided for @translation.
  ///
  /// In en, this message translates to:
  /// **'Translation'**
  String get translation;

  /// No description provided for @translations.
  ///
  /// In en, this message translates to:
  /// **'Translations'**
  String get translations;

  /// No description provided for @listen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listen;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get aboutUs;

  /// No description provided for @readings.
  ///
  /// In en, this message translates to:
  /// **'Readings'**
  String get readings;

  /// No description provided for @audio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// No description provided for @listenDescription.
  ///
  /// In en, this message translates to:
  /// **'Listen to the Quran and learn its meanings'**
  String get listenDescription;

  /// No description provided for @dataSource.
  ///
  /// In en, this message translates to:
  /// **'Data source - Quranpedia API'**
  String get dataSource;

  /// No description provided for @mushafReadings.
  ///
  /// In en, this message translates to:
  /// **'Mushaf readings'**
  String get mushafReadings;

  /// No description provided for @chooseRecitation.
  ///
  /// In en, this message translates to:
  /// **'Choose the narration you want to read the Mushaf with.'**
  String get chooseRecitation;

  /// No description provided for @noReadings.
  ///
  /// In en, this message translates to:
  /// **'No readings are currently available.'**
  String get noReadings;

  /// No description provided for @mushaf.
  ///
  /// In en, this message translates to:
  /// **'Mushaf'**
  String get mushaf;

  /// No description provided for @translationBooks.
  ///
  /// In en, this message translates to:
  /// **'Meaning translations'**
  String get translationBooks;

  /// No description provided for @browseTranslations.
  ///
  /// In en, this message translates to:
  /// **'Browse all available translation books and languages.'**
  String get browseTranslations;

  /// No description provided for @noTranslations.
  ///
  /// In en, this message translates to:
  /// **'No translations are currently available.'**
  String get noTranslations;

  /// No description provided for @translationMeaning.
  ///
  /// In en, this message translates to:
  /// **'Meaning translation'**
  String get translationMeaning;

  /// No description provided for @audioReadings.
  ///
  /// In en, this message translates to:
  /// **'Audio recitations'**
  String get audioReadings;

  /// No description provided for @chooseReciter.
  ///
  /// In en, this message translates to:
  /// **'Choose a reciter, then a surah to play the recitation.'**
  String get chooseReciter;

  /// No description provided for @noAudioReadings.
  ///
  /// In en, this message translates to:
  /// **'No audio recitations are currently available.'**
  String get noAudioReadings;

  /// No description provided for @reciter.
  ///
  /// In en, this message translates to:
  /// **'Reciter'**
  String get reciter;

  /// No description provided for @loadDataError.
  ///
  /// In en, this message translates to:
  /// **'Could not load data. Check your internet connection and try again.'**
  String get loadDataError;

  /// No description provided for @searchError.
  ///
  /// In en, this message translates to:
  /// **'The search could not be completed. Check your connection and try again.'**
  String get searchError;

  /// No description provided for @fullSearch.
  ///
  /// In en, this message translates to:
  /// **'Full search'**
  String get fullSearch;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search the Quran, commentaries, books, and fatwas'**
  String get searchHint;

  /// No description provided for @searching.
  ///
  /// In en, this message translates to:
  /// **'Searching...'**
  String get searching;

  /// No description provided for @enterSearch.
  ///
  /// In en, this message translates to:
  /// **'Enter a word to search Quranpedia content.'**
  String get enterSearch;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No results found for this search.'**
  String get noSearchResults;

  /// No description provided for @searchResult.
  ///
  /// In en, this message translates to:
  /// **'Search result'**
  String get searchResult;

  /// No description provided for @book.
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// No description provided for @fatwa.
  ///
  /// In en, this message translates to:
  /// **'Fatwa'**
  String get fatwa;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @topic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get topic;

  /// No description provided for @ayah.
  ///
  /// In en, this message translates to:
  /// **'Ayah'**
  String get ayah;

  /// No description provided for @resultContent.
  ///
  /// In en, this message translates to:
  /// **'Result content'**
  String get resultContent;

  /// No description provided for @resultDetails.
  ///
  /// In en, this message translates to:
  /// **'Result details'**
  String get resultDetails;

  /// No description provided for @listenAndLearn.
  ///
  /// In en, this message translates to:
  /// **'Listen And Learn'**
  String get listenAndLearn;

  /// No description provided for @storiesOfFaith.
  ///
  /// In en, this message translates to:
  /// **'Stories of Faith'**
  String get storiesOfFaith;

  /// No description provided for @spiritualJourneys.
  ///
  /// In en, this message translates to:
  /// **'Spiritual Journeys'**
  String get spiritualJourneys;

  /// No description provided for @whifLost.
  ///
  /// In en, this message translates to:
  /// **'What if we lost?'**
  String get whifLost;

  /// No description provided for @quiz.
  ///
  /// In en, this message translates to:
  /// **'quiz'**
  String get quiz;

  /// No description provided for @verses.
  ///
  /// In en, this message translates to:
  /// **'Reflecting on the Verses'**
  String get verses;

  /// No description provided for @faScreen.
  ///
  /// In en, this message translates to:
  /// **'Fatima & Aboud and The Smart Screen'**
  String get faScreen;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
