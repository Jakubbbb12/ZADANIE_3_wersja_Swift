Zastosowane koncepty OOP:
- Abstrakcja - 'PlacowkaStomatologiczna' z 'fatalError()' blokującym bezpośrednie tworzenie
- dziedziczenie - działy stomatologii, m.in. 'Ortodoncja' dziedziczy od 'PlacowkaStomatologiczna'
- polimorfizm - metoda 'oddzial()' i wlaściwość 'stawki' nadpisywane w podklasach
- enkapsulacja - prywatne pola z danymi w klasie 'Pacjent'
- protokoły (/interfejsy) - 'IRejestr', 'ISpecjalistyczny'
- kompozycja - 'Rejestr' zarządza oddziałami (dodawaniem, usuwaniem)
- przeciążenie konstruktorów - 'Pacjent', 'Wizyta'
- przeciążenie metod - 'przyjmijPacjenta'
- walidacja - 'pesel', 'cena'
