enum Languages {
  english,
  japanese,
}

extension LanguageCode on Languages {
  static final Map<Languages, String> _map = {
    Languages.english: 'en',
    Languages.japanese: 'ja',
  };

  String? get languageCode => _map[this];
}
