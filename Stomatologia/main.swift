let ortodoncja = Ortodoncja(nazwa: "Klinika Sosnowiecka", adres: "ul. Zębowa 1", godzOtwarcia: "8:00 - 14:00")
let chirurgia = ChirurgiaStomatologiczna(nazwa: "Centrum Chirurgii", adres: "ul. Będzińska 7", godzOtwarcia: "12:00 - 16:00")

let pacjent1 = Pacjent(nazwisko: "Kowalski")
let pacjent2 = Pacjent(nazwisko: "Nowak", pesel: "11111111111")

let wizyta1 = Wizyta(pacjent: pacjent1, oddzial: ortodoncja, zabieg: "Aparat stały", cena: 3000.00)
let wizyta2 = Wizyta(pacjent: pacjent2, oddzial: chirurgia, zabieg: "Ekstrakcja zęba", data: "2026-06-06", cena: 600.00)

ortodoncja.wyswietlUslugi()
chirurgia.wyswietlUslugi()

StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kowalski", zabieg: "Aparat stały", data: "2026-06-06", cena: 3000.00, oddzial: ortodoncja)
StomatologiaOperacje.przyjmijPacjenta(nazwisko: "Kowalski", data: "2026-06-06", oddzial: ortodoncja)

StomatologiaOperacje.sterylizujNarzedzia()
