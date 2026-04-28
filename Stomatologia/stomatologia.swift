protocol IRejestr {
    func wyswietlUslugi()
    func oddzial() -> String
}

protocol ISpecjalistyczny {
    func konsultacja()
    func skierowanie(pacjent: String) -> String
}

class PlacowkaStomatologiczna: IRejestr {
    var Nazwa: String
    var adres: String
    var godzOtwarcia: String
    private(set) var liczbaPacjentow: Int = 0
    
    init(nazwa: String, adres: String, godzOtwarcia: String) {
        self.Nazwa = nazwa
        self.adres = adres
        self.godzOtwarcia = godzOtwarcia
    }
    
    var stawki: [String: Double] {
        fatalError("Podklasa musi nadpisać 'stawki'.")
    }
    
    func wyswietlUslugi() {
        print("Usługi w oddziale \(oddzial()):")
        for (zabieg, cena) in stawki {
            print(" \(zabieg) - \(cena) zł")
        }
    }
    
    func oddzial() -> String {
        fatalError("Podklasa musi nadpisać 'oddzial()'.")
    }
    
    func przyjmijPacjenta() {
        liczbaPacjentow += 1
    }
}

class StomatologiaOperacje {
    static func przyjmijPacjenta(nazwisko: String, zabieg: String, data: String, cena: Double, oddzial: PlacowkaStomatologiczna) {
        print("Przyjęto: \(nazwisko) | Oddział: \(oddzial.oddzial()) | Zabieg: \(zabieg) | Termin: \(data) | Cena: \(cena) zł")
    }
    
    static func przyjmijPacjenta(nazwisko: String, data: String, oddzial: PlacowkaStomatologiczna) {
        print("Przyjęto: \(nazwisko) | Oddział: \(oddzial.oddzial()) | Termin: \(data)")
    }
    
    static func sterylizujNarzedzia() {
        let narzedzia = ["wiertło", "sonda"]
        print("Sterylizacja narzędzi: ")
        for n in narzedzia{ print("Wysterylizowano \(n)")}
    }
}

class Pacjent {
    private var _nazwisko: String
    private var _pesel: String
    private var historiaWizyt: [Wizyta] = []
    
    var nazwisko: String {
        get { return _nazwisko }
        set { _nazwisko = newValue }
    }
    
    var pesel: String {
        get { return _pesel}
        set {
            if newValue.count != 11 {
                print("PESEL musi mieć 11 cyfr.")
            } else {
                _pesel = newValue
            }
        }
    }
    
    init(nazwisko: String, pesel: String) {
        self._nazwisko = nazwisko
        self._pesel = pesel
    }
    
    init(nazwisko: String) {
        self._nazwisko = nazwisko
        self._pesel = "brak"
    }
    
    func dodajWizyte(wizyta: Wizyta) {
        historiaWizyt.append(wizyta)
    }
    
    func wyswietlHistorie() {
        print("--- Historia wizyt pacjenta \(nazwisko)---")
        if historiaWizyt.isEmpty {
            print("Brak wizyt")
        } else {
            for w in historiaWizyt {
                print("- Oddział: \(w.oddzial.oddzial()) | Zabieg: \(w.zabieg) | Termin: \(w.data) | Cena: \(w.cena) zł")
            }
        }
    }
}

class Wizyta {
    var pacjent: Pacjent
    var oddzial: PlacowkaStomatologiczna
    var zabieg: String
    var data: String
    var cena: Double {
        didSet {
            if cena < 0 {
                print("Nieprawidłowa cena")
                cena = oldValue
            }
        }
    }
    
    init(pacjent: Pacjent, oddzial: PlacowkaStomatologiczna, zabieg: String, data: String, cena: Double) {
        self.pacjent = pacjent
        self.oddzial = oddzial
        self.zabieg = zabieg
        self.data = data
        self.cena = cena
    }
    
    init(pacjent: Pacjent, oddzial: PlacowkaStomatologiczna, zabieg: String, cena: Double) {
        self.pacjent = pacjent
        self.cena = cena
        self.oddzial = oddzial
        self.zabieg = zabieg
        self.data = "brak"
    }
}

class Rejestr {
    private var oddzialy: [PlacowkaStomatologiczna] = []
    
    func dodajOddzial(oddzial: PlacowkaStomatologiczna) {
        oddzialy.append(oddzial)
        print("Dodano nowy oddział: \(oddzial.oddzial())")
    }
    
    func usunOddzial(nazwa: String) {
        if let index = oddzialy.firstIndex(where: { $0.oddzial() == nazwa} ) {
            oddzialy.remove(at: index)
            print("Usunięto oddział: \(nazwa)")
        } else {
            print("Nie znaleziono oddziału: \(nazwa)")
        }
    }
    
    func wyswietlWszystkie() {
        print("===== Lista oddziałów =====")
        for oddzial in oddzialy {
            print(oddzial.oddzial())
        }
    }
    
    func liczbaOddzialow() -> Int {
        return oddzialy.count
    }
    
    func raport() {
        print("==== RAPORT ====")
        print("Łączna liczba oddziałów: \(oddzialy.count)")
        
        for oddzial in oddzialy {
            let liczbaUslug = oddzial.stawki.count
            let ceny = oddzial.stawki.values
            let cenaSrednia = ceny.reduce(0, +) / Double(liczbaUslug)
            
            print("- \(oddzial.oddzial()): \(liczbaUslug) usługi, średnia cena: \(cenaSrednia) zł, pacjenci: \(oddzial.liczbaPacjentow)")
        }
    }
}

class Ortodoncja: PlacowkaStomatologiczna, ISpecjalistyczny {
    override var stawki: [String: Double] {
        return [
            "Aparat stały": 3000.00,
            "Retainer": 500.00
        ]
    }
    
    override func oddzial() -> String {
        return "Ortodoncja"
    }
    
    func konsultacja() {
        print("Wizyta na konsultację.")
    }
    
    func skierowanie(pacjent: String) -> String {
        return "Skierowanie dla \(pacjent) do specjalisty."
    }
}


class StomatologiaDziecieca: PlacowkaStomatologiczna {
    override var stawki: [String: Double] {
        return [
            "Kontrola": 200.00,
            "Lakowanie": 150.00
        ]
    }
    
    override func oddzial() -> String {
        return "Stomatologia Dziecięca"
    }
}

class ChirurgiaStomatologiczna: PlacowkaStomatologiczna {
    override var stawki: [String: Double] {
        return [
            "Usunięcie ósemki": 600.00,
            "Ekstrakcja zęba": 300.00
        ]
    }
    
    override func oddzial() -> String {
        return "Chirurgia Stomatologiczna"
    }
}

class StomatologiaZachowawcza: PlacowkaStomatologiczna {
    override var stawki: [String: Double] {
        return [
            "Plombowanie": 250.00,
            "Leczenie kanałowe": 800.00
        ]
    }
    
    override func oddzial() -> String {
        return "Stomatologia Zachowawcza"
    }
}
