//TWORZENIE ODDZIALOW
let ortodoncja = Ortodoncja(nazwa: "Klinika Sosnowiecka", adres: "ul. Zębowa 1", godzOtwarcia: "8:00 - 14:00")
let chirurgia = ChirurgiaStomatologiczna(nazwa: "Centrum Chirurgii", adres: "ul. Będzińska 7", godzOtwarcia: "12:00 - 16:00")
let stomatologiaDziecieca = StomatologiaDziecieca(nazwa: "Stomatologia Dziecięca", adres: "ul. Złotego Świeradka 10", godzOtwarcia: "8:00 - 18:00")
let stomatologiaZachowawcza = StomatologiaZachowawcza(nazwa: "Stomatologia Zachowawcza", adres: "ul. Lisia 1", godzOtwarcia: "16:00 - 18:00")

//TWORZENIE REJESTRU + RAPORTU
let rejestr = Rejestr()
rejestr.dodajOddzial(oddzial: ortodoncja)
rejestr.dodajOddzial(oddzial: chirurgia)
rejestr.dodajOddzial(oddzial: stomatologiaDziecieca)
rejestr.dodajOddzial(oddzial: stomatologiaZachowawcza)
rejestr.wyswietlWszystkie()
print("Liczba oddziałów: \(rejestr.liczbaOddzialow())")
rejestr.raport()

//PACJENCI
let pacjent1 = Pacjent(nazwisko: "Kowalski")
let pacjent2 = Pacjent(nazwisko: "Nowak", pesel: "11111111111")
let pacjent3 = Pacjent(nazwisko: "Kowal", pesel: "11111111112")
let pacjent4 = Pacjent(nazwisko: "Kulka", pesel: "11111111113")

//TWORZENIE WIZYT, PRZYPISYWANIE ICH DO ODDZIALOW, TWORZENIE HISTORII WIZYT PACJENTA
let wizyta1 = Wizyta(pacjent: pacjent1, oddzial: ortodoncja, zabieg: "Aparat stały", cena: 3000.00)
ortodoncja.przyjmijPacjenta()
pacjent1.dodajWizyte(wizyta: wizyta1)
let wizyta2 = Wizyta(pacjent: pacjent2, oddzial: chirurgia, zabieg: "Ekstrakcja zęba", data: "2026-06-06", cena: 600.00)
chirurgia.przyjmijPacjenta()
pacjent2.dodajWizyte(wizyta: wizyta2)
let wizyta3 = Wizyta(pacjent: pacjent3, oddzial: stomatologiaDziecieca, zabieg: "Zabieg na dzieciach", cena: 1000.00)
stomatologiaDziecieca.przyjmijPacjenta()
pacjent3.dodajWizyte(wizyta: wizyta3)
let wizyta4 = Wizyta(pacjent: pacjent4, oddzial: stomatologiaZachowawcza, zabieg: "Zabieg na dzieciach", cena: 1000.00)
stomatologiaZachowawcza.przyjmijPacjenta()
pacjent4.dodajWizyte(wizyta: wizyta4)

//WYSWIETLANIE USLUG
ortodoncja.wyswietlUslugi()
chirurgia.wyswietlUslugi()
stomatologiaDziecieca.wyswietlUslugi()
stomatologiaZachowawcza.wyswietlUslugi()

StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kowalski", zabieg: "Aparat stały", data: "2026-06-06", cena: 3000.00, oddzial: ortodoncja)
StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kowalski", data: "2026-06-06", oddzial: ortodoncja)
StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kowal", zabieg: "Kontrola", data: "2026-06-06", cena: 1000.00, oddzial: stomatologiaDziecieca)
StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kulka", zabieg: "Plombowanie", data: "2026-06-06", cena: 1000.00, oddzial: stomatologiaZachowawcza)

//KORZYSTANIE Z PROTOKOLU "ISpecjalistycnzy" DLA ORTODONCJI
ortodoncja.konsultacja()
print(ortodoncja.skierowanie(pacjent: "Kowalski"))

StomatologiaOperacje.sterylizujNarzedzia()

//HISTORIA PACJENTA
pacjent1.wyswietlHistorie()
pacjent2.wyswietlHistorie()

//USUNIECIE ODDZIALU
rejestr.usunOddzial(nazwa: "Stomatologia Zachowawcza")
rejestr.raport()
