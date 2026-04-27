protocol IRejestr {
    func wyswietlUslugi()
    func oddzial() -> String
}

class PlacowkaStomatologiczna: IRejestr {
    var Nazwa: String
    var adres: String
    var godzOtwarcia: String
    
    init(nazwa: String, adres: String, godzOtwarcia: String) {
        self.Nazwa = nazwa
        self.adres = adres
        self.godzOtwarcia = godzOtwarcia
    }
    
    var stawki: [String: Double] {return [:]}
    
    func wyswietlUslugi() {
        print("Usługi w oddziale \(oddzial()):")
        for (zabieg, cena) in stawki {
            print(" \(zabieg) - \(cena) zł")
        }
    }
    func oddzial() -> String { return "" }
}

class StomatologiaOperacje {
    static func przyjmijPacjenta(nazwisko: String, zabieg: String, data: String, cena: Double, oddzial: PlacowkaStomatologiczna) {
        print("\(nazwisko) został przyjęty do \(oddzial.oddzial()) na \(zabieg) na \(data) na kwotę \(cena) zł")
    }
    
    static func przyjmijPacjenta(nazwisko: String, data: String, oddzial: PlacowkaStomatologiczna) {
        print("\(nazwisko) został przyjęty do \(oddzial.oddzial()) na \(data)")
    }
    
    static func sterylizujNarzedzia() {
        let narzedzia = ["wiertło", "sonda"]
        print("Sterylizacja narzędzi: ")
        for n in narzedzia{ print("Wysterylizowano \(n)")}
    }
}

class Pacjent {
    var nazwisko: String
    var pesel: String {
        didSet {
            if pesel.count != 11 {
                print("PESEL musi mieć 11 cyfr.")
                pesel = oldValue
            }
        }
    }
    
    init(nazwisko: String, pesel: String) {
        self.nazwisko = nazwisko
        self.pesel = pesel
    }
    
    init(nazwisko: String) {
        self.nazwisko = nazwisko
        self.pesel = "brak"
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

class Ortodoncja: PlacowkaStomatologiczna {
    override var stawki: [String: Double] {
        return [
            "Aparat stały": 3000.00,
            "Retainer": 500.00
        ]
    }
    
    override func oddzial() -> String {
        return "Ortodoncja"
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
        return "Stomatologia dziecięca"
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
        return "Chirurgia stomatologiczna"
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
        return "Stomatologia zachowawcza"
    }
}
