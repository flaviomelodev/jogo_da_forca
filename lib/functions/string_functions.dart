String removerAcentos(String s) {
  Map<String, String> letrasAcentuadas = {
    "á": "a",
    "Á": "A",
    "à": "a",
    "À": "A",
    "ã": "a",
    "Ã": "A",
    "ê": "e",
    "Ê": "E",
    "é": "e",
    "É": "E",
    "è": "e",
    "È": "E",
    "í": "i",
    "Í": "I",
    "ó": "o",
    "Ó": "O",
    "õ": "o",
    "Õ": "O",
    "ú": "u",
    "Ú": "U",
    "ç": "c",
    "Ç": "C",
  };

  List<String> origem = s.split('');
  for (int i = 0; i < origem.length; i++) {
    origem[i] = ((letrasAcentuadas[origem[i]] != null)
        ? letrasAcentuadas[origem[i]]
        : origem[i])!;
  }
  return origem.join();
}
