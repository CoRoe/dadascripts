/* $Id: gutachten.pb,v 1.12 2009-01-05 13:21:09 cro Exp $
 *
 * $Log: gutachten.pb,v $
 * Revision 1.12  2009-01-05 13:21:09  cro
 * Jetzt mit Traumdeutung.
 *
 * Revision 1.11  2008-04-06 15:07:36  cro
 * Testbeschreibung2 erweitert.
 *
 * Revision 1.10  2008-01-29 18:22:30  cro
 * Added GQQUOTE
 *
 * Revision 1.9  2007-12-16 18:42:12  cro
 * Schönere Konferenzen
 *
 * Revision 1.8  2007/12/16 00:44:34  cro
 * Um Psychoquark erweitert.
 *
 * Revision 1.7  2007/12/11 20:59:21  cro
 * Zitate und Handlungsempfehlung neu
 *
 * Revision 1.6  2007/11/26 23:43:25  cro
 * *** empty log message ***
 *
 * Revision 1.5  2007/11/25 22:08:03  cro
 * *** empty log message ***
 *
 * Revision 1.4  2007/11/17 16:13:13  cro
 * Erweitert.
 *
 * Revision 1.3  2007/11/16 00:18:43  cro
 * *** empty log message ***
 *
 * Revision 1.2  2007/11/15 21:49:19  cro
 * *** empty log message ***
 *
 * Revision 1.1  2007/11/15 01:41:03  cro
 * gutachten.pb
 *
*/

#include <stdmap.pbi>
#include <format.pbi>

#define GQQUOTE(x) x


#ifdef TEST
Test:	Dativtest Genitivtest;
#endif

Gutachten:
	PROLOGUE
	TITLE("Gutachten")
#ifdef LATEX
	"\\usepackage[utf8]{inputenc}\n"
	"\\usepackage[german]{babel}\n"
	"%\\usepackage{german}\n"
	"\\frenchspacing\\sloppy\\onecolumn\n"
	"\\setlength{\\parindent}{0pt}\\setlength{\\parskip}{12pt}\n"
#endif
	BODY
	?v-Testperson=Mutter
	"Erstattet von "Gutachter PBRK
	Gutachtenauftrag PBRK

	SECTION("Anamnese")
	Anamnese PBRK

	SECTION("Testergebnisse der Mutter")
	?v-Testperson=Mutter
	Testbeschreibung PBRK
	Traum-Absatz PBRK

	SECTION("Testergebnisse des Vaters")
	?v-Testperson=Vater
	Testbeschreibung PBRK
	Psycho-Quark-Absatz PBRK

	SECTION("Testergebnisse der Tochter")
	?v-Testperson=Tochter
	Testbeschreibung PBRK
	[Traum-Absatz PBRK|""]
	Psycho-Quark-Absatz PBRK

	SECTION("Testergebnisse des Sohnes")
	?v-Testperson=Sohn
	[Traum-Absatz PBRK|""]
	Testbeschreibung PBRK
	Psycho-Quark-Absatz PBRK

	SECTION("Empfehlung")
	Empfehlung PBRK

	Gutachter PBRK

	Rechnung PBRK

	EPILOGUE
;

Gutachter: v-Gutachter<<[Titel" "weibl-Vorname1"-"weibl-Vorname1
	" "Nachname"-"Nachname]
;

Ehename: v-Nachname<<Nachname;
Vorname-Ehefrau: v-Vorname-Ehefrau<<weibl-Vorname;
Vorname-Ehemann: v-Vorname-Ehemann<<maennl-Vorname;
Nachname-Ehefrau: v-Nachname-Ehefrau<<Nachname"-"Ehename;
Nachname-Ehemann: v-Nachname-Ehemann<<Ehename;
Sohn: v-Sohn<<maennl-Vorname;
Tochter: v-Tochter<<weibl-Vorname;
Mutter: "Frau "Nachname-Ehefrau;
Vater: "Herr "Nachname-Ehemann;

Az:	v-Az<<"F "{=10..1000}"/"{=90..99};

Datum:	{=1..28}"."{=1..12}"."{=1990..2007};
Heiratsdatum: {=1..28}"."{=1..12}"."{=1950..2002};

maennl-Vorname: trad-maennl-Vorname | moderner-maennl-Vorname
;

trad-maennl-Vorname:
	"Karl-"["Friedrich"|"Philipp"]
	| "Johann-"["Heinrich"|"Friedrich"|"Gottlieb"|"Gottfried"]
	| "Hans-"["Joachim"|"Otto"|"Rudolf"|"Jürgen"|"Günther"]
	| "Franz-"["Georg"|"Heinrich"|"Josef"]
;

moderner-maennl-Vorname:
	maennl-Vorname1
	| maennl-Vorname1"-"maennl-Vorname1
;

maennl-Vorname1:
	"Kevin"|"Tim"|"Arno"|"Sven"|"Michael"|"André"|"Dennis"|"Roland"
	|"René"|"Rolf"|"Daniel"|"Johnny"|"Eric"|"Werner"|"Bertram"|"Simon"
	|"Eckhardt"|"Herbert"|"Manfred"|"Rolf"|"Harald"|"Erich"|"Ernst"
	|"Kaspar"|"Peter"|"Sebastian"|"Alexander"
;


weibl-Vorname: trad-weibl-Vorname | moderner-weibl-Vorname
;

trad-weibl-Vorname:
	"Karin"|"Uschi"|"Irene"|"Walburga"|"Waltraud"|"Ute"|"Lisbeth"|"Ilse"
	|"Elisabeth"|"Annegret"|"Anna Maria"|"Magdalena"|"Erna"|"Elise"
	|"Elli"
;

moderner-weibl-Vorname:
	weibl-Vorname1
	| weibl-Vorname1"-"weibl-Vorname1
;

weibl-Vorname1:
	"Karin"|"Verena"|"Samantha"|"Ursula"|"Nadine"|"Natalie"|"Hermine"
	|"Lisa"|"Marie"|"Lena"|"Lea"|"Sonja"|"Denise"|"Vanessa"|"Olga"
	|"Tatjana"|"Gabriela"|"Johanna"|"Anna"|"Daniela"|"Andrea"|"Nicole"
	|"Nicolette"|"Sabine"|"Antonie"|"Simone"|"Marika"|"Marina"
	|"Mareike"|"Maja"|"Janina"|"Jeannette"|"Emilia"|"Monika"|"Susanne"
	|"Sabrina"|"Petra"|"Alexandra"|"Leonie"
;

Nachname:
	["Hurzel"|"Nieder"|"Ober"|"Schrak"|"Kurz"|"Lang"|"Brumm"|"Schörg"
	 |"Struck"|"Drög"|"Rohr"|"Schrör"]
	  ["meier"|"müller"|"reuther"|"dorf"|"huber"|"leitner"|"hofer"|"acher"
	  |"bauer"|"stedt"|"kötter"|"kirchner"|"beck"|"schulz"|"feld"
	  |"waldner"|"moser"|"dorf"]
	| ["Nie"|"Neuge"]["buhr"|"bauer"]
	| ["Lang"|"Hasen"|"Hühner"]["behn"|"bein"]
	| ["Brunse"|"Flach"|"Forst"|"Banse"|"Nödel"|"Bartel"|"Loose"|"Linde"
	  |"Lüde"|"Koss"|"Grumpt"|"Brock"|"Brink"|"Brock"|"Her"|"Fried"]"mann"
	| "Wuttke"|"Würbs"|"Zander"|"Tappenbeck"|"Stühlff"|"Puschel"|"Predöhl"
	| "Leifert"|"Koschulla"|"Hüdepohl"|"Gnatner"|"Grocholl"|"Düver"
	| "Gröpel"|"Sprölzik"|"Hartwig"|"Pukielzik"|"Sprotzner"|"Riedel"
	| "Stolnik"|"Nürzelkromm"|"Bröcklich"|"Stoffel"|"Strotzel"|"Schulz"
	| "v. Chlamtatsch"|"v. Graffelstorff"|"Stolpe"|"Wozureit"|"Nolte"
	| "Kowalski"|"Meier"|"Müller"|"Lehmann"|"Poldukeit"|"v. Zitzewitz"
	| "Zidowitz"|"Wunsiedel"|"Schrörschnauz"|"v. Zarenthin"
	| "Körblein"|"Küchenhoff"|"Scherb"|"Greiser"|"Jöckel"|"Straif"
	| "Brüske"|"Hohlfeld"|"Wurzbacher"|"Wirth"
;

Titel:
	["Dipl."|"Fach"]"-"["Psych."|"Päd."|"Erz."|"Psychop."]
	" "["(FH)"|"(VHS)"|"(Univ. "Stadt")"|""]
	| "Fachwrtin f. " ["Kdr. u. Jgd."|"Päd."|"Psych."]" "["(FH)"|"(VHS)"]
;

Wohnort: v-Wohnort<<Stadt;

Gutachtenauftrag:
	"Gutachtenauftrag des AG "Stadt" im Verfahren "
	Nachname-Ehefrau" ./. "Nachname-Ehemann", Aktenzeichen "Az
	" vom "Datum":" PBRK
	[Gutachtenauftrag1". "]>upcase-first
;

Gutachtenauftrag1:
	"Es ist dazu Stellung zu nehmen, ob "
	["der Umgang"|"der Briefverkehr"|"der Briefkontakt"
	 |"der Telefonkontakt"]
	" der Kinder "Sohn" und "Tochter" "Ehename
	 " mit dem Vater "Vorname-Ehemann" "Nachname-Ehemann" "
	" "
	["dem "KINDESWOHL-dat" dient"|"das "KINDESWOHL" gefährdet"]
;

Anamnese:
	[Heirat1 ". "]>upcase-first
	[Heirat2 ". "]>upcase-first+
	[Heirat2 ". "]>upcase-first+
;

Heirat1:
	Mutter" und "Vater" heirateten am "Heiratsdatum
	[" nach einem Urlaubsflirt auf "Insel|" auf eine Heiratsanzeige hin"
	 |" nach der Vermittlung durch eine Heiratsagentur"
	 |", nachdem sie sich in "Ort-des-Kennenlernens" kennengelernt hatten, "
	 |" auf Anraten der Eltern von Frau "Nachname-Ehefrau
	 |" auf der Flucht vor den Eltern von Frau "Nachname-Ehefrau
	 |" nach einer "{=2..5}"jährigen Verlobungsphase"]
	[" in "[Land|Stadt]|" auf "Insel|" in "[Stadt|Land]]
;

Heirat2:
	"das Ehepaar zog "["dann"|"später"|"im Jahre "{=1990..2006}]" "
	  ["auf Wunsch von "Mutter
	   |"wegen des besseren Klimas"|"wegen einer "Allergie
	    "allergie der Ehefrau"
	   |"wegen der günstigeren Shopping-Möglichkeiten"
	   |"wegen des besseren kulturellen Angebots"]" nach "Stadt
	|["kurz darauf"|"nach einiger Zeit"|"binnen kurzem"]
	 " "["zeigten sich"|"entstanden"|"entwickelten sich"]
	 " "["Konflikte"|"Streitereien"|"Animositäten"
	     |"Meinungsverschiedenheiten"]
	 " zwischen "["den Eheleuten"|"Herrn und Frau "Ehename]
	 " "["über"]" "Streitgegenstand-akk[""|", die "
	    ["nur mühsam übertüncht werden konnten"
	     |Mutter" neue Chancen eröffneten"]]
	|["anschließend"|"zunächst"|"daraufhin"|"nach einer Ausbildung als "
	  maennl-Beruf]
	 " "
	 ["arbeitete "Vater|"fand "Vater " eine "["Arbeit"|"Anstellung"]]
	 " als "maennl-Beruf
	|["anschließend"|"zunächst"|"daraufhin"]
	 " "
	 ["arbeitete "Mutter|"fand "Mutter " eine "["Arbeit"|"Anstellung"]]
	 " als "weibl-Beruf
	| Vater" "["engagierte sich als"|"übernahm ein Ehrenamt als"]
	  " "Ehrenamt", "["während"|"wobei"|"währenddessen"]" "Mutter
	  " als "Ehrenamt>Feminin
	  " "["wirkte"|"sich profilierte"|"sich einen Namen machte"
		|"bekannt wurde"]
	| Mutter" gibt "Hobbies" als Hobby an; "Nachsatz-zu-Hobby
	| [Mutter|Vater]" wurde "{=1990..1999}" wegen "
	  ["der Diagnose"|"Verdacht auf"]
	  " "Krankheit" "{=2..6}" "["Tage"|"Wochen"|"Monate"]" im "
	  ["Kreis"|"Universitäts"|"Privat"|"Albertinen"|"Elisabethen"]
	  ["krankenhaus"|"klinikum"|"hospital"]" "
	  Stadt" behandelt"
	| "wegen der Diagnose "Krankheit" mußte "[Vater|Mutter]" "
	  {=1990..1999}" "["die Hobbies aufgeben"|"eine Kur antreten"
		|"das Rauchen aufgeben"]
	| Mutter" "["hat diese Zeit in guter Erinnerung"
	   |"erinnert sich gern an diese Zeit"
	   |"möchte diese Episode vergessen"]", "
	  ["weil hierin die Chance der Selbstentfaltung lag"
	   |"weil sie hier Kontakt zu interessanten Menschen fand"
	   |"weil sie sich "["mental"|"kulturell"]" weiterbilden konnte"
	   |"weil sie ein Stück Unabhängigkeit gewann"
	   |"weil sie mehr Zeit für die Gestaltung "["ihres Heims"|"der Garage"
	    |"der Flurgarderobe"]" "["hatte"|"aufwenden konnte"]]
	| Mutter" erarbeitete sich eine starke Position "["in der Familie"
	   |"in der Nachbarschaft"|"im Betrieb"]
;

Ort-des-Kennenlernens: /* in .. */
	["Herrn "Nachname-Ehemann|"Frau "Nachname-Ehefrau]
	"s "["Stammlokal"|"Lieblingsdisko"]
	|Stadt
;

maennl-Beruf:
	"Fahrradkurier"|"Müllwerker"|"Tischler"|"Autoverkäufer"
	|"Einzelhandelskaufmann Fachrichtung "["Automobil"|"Schrauben"]
	|["Post"|"Fernmelde"|"Regierungs"]["sekretär"|"amtmann"|"inspektor"]
	|["Pharmazie"|"Drogen"|"Schulden"]"berater"
	|["Assessor"|"Oberstudienrat"|"Schulleiter"]
	  " am "maennl-Vorname"-"Nachname"-Gymnasium"
	|["Leiter"|"Mitarbeiter"|"Direktor"|"Justitiar"]
	 " "["der "Institution-fem-gen|"des "Institution-mask-gen]
	 [" in "Stadt|""]
	|["Putzhilfe"|"Pförtner"]" "
	 " "["in der "Institution-fem-dat|"im "Institution-mask-dat]
	 [" in "Stadt|""]
	|["Fachwirt"|"Fachtechniker"|"Fachwerker"|"Facharbeiter"]
	 " "["Zerspanungstechnik "["Holz"|"Metall"]|"Schraubtechnik"
	     |"für nichtabrasive Metallbearbeitung"|"Sicherheitswesen"]
;

weibl-Beruf:
	"Fahrradkurierin"|"Kosmetikberaterin"|"Floristin"|"Schuhverkäuferin"
	|["Einzelhandelskauffrau"|"Fachwirtin"]
	  " Fachrichtung "["Bäckerei"|"Fleisch"|"Lebensmittel"]
	|["Assessorin"|"Oberstudienrätin"|"Schulleiterin"]
	  " am "weibl-Vorname"-"Nachname"-Gymnasium"
	|["Leiterin"|"Mitarbeiterin"|"Direktorin"|"Justitiarin"]
	 " "["der "Institution-fem-gen|"des "Institution-mask-gen]
	 [" in "Stadt|""]
;

Ehrenamt:
	["Teilzeit-"|"Feierabend-"|"Hobby-"|""]
	["Ikebana"|"Karate"|"Fußball"|"Fitneß"|"Lohnsteuer"|"Jugendzentrums"
	 |"Ballett"|"Singkreis"]
	"-"
	["Übungsleiter"|"Berater"|"Coach"|"Trainer"]
;

Institution-fem:
	"Volkshochschule"|"Kläranlage"|"Müllkippe"
	|"Frauen"["initiative"|"gruppe"]" "Fraueninitiative
;

Fraueninitiative:
	GQQUOTE(["Fisch sucht Fahrrad"|"Allein machen sie dich ein"])
;

Institution-fem-gen: Institution-fem>Genitiv;
Institution-fem-dat: Institution-fem>Dativ;

Institution-mask:
	"Entsorgungspark"|["Grünflächen"|"Ordnungs"|"Verwaltungs"]"amt"
;

Institution-mask-dat: Institution-mask>Dativ;

Institution-mask-gen: Institution-mask-dat>Genitiv;

Hobby:	["Briefmarken"|"Bierdeckel"|"Stecknadel"|"Reißzwecken"]"sammeln"
	| ["Rad"|"Auto"|"Motorrad"|"Mofa"|"Go-Kart"]"fahren"
	| "Stricken"|"Häkeln"|"Heimwerken"|"Faulenzen"|"Pizzabacken"|"Kochen"
	| ["Elektro"|"Modell"]"basteln" | "Gartenarbeit"
	| "Golf"|"Segeln"|"Skat"|"Boxen"|"Feng Shui"|"Zhong Wen"
	| ["vergleichende"|"observative"]" "["Ornithologie"|"Psychopathologie"]
;

Hobbies: Hobby | Hobby" und "Hobby
;

Nachsatz-zu-Hobby: "leider bleibe wenig Zeit dafür"
	|"das Steckenpferd befriedige sehr"
	|"leider reiche das Geld nicht immer"
	|["die Schwiegermutter"|"der Partner"]" könne das aber nicht leiden"
	|"der Ehepartner werde dadurch "["aber "|" "]
	 ["nicht"|"keinesfalls"]" "["vernachlässigt"|"beinträchtigt"]
;

Allergie:
	"Hausstaub"|"Katzen"|"Inkohärenz"|"UV-Licht"|"Schmerzmittel"
;

/* Steit über ...*/
Streitgegenstand-akk:
	"häufige Besuche der Schwiegermutter von "Mutter
	| "die Anordnung "["der Blumenvasen"|"der Kissen"|"der Porzellanfiguren"]
	  " "["auf dem Sofa"|"auf der Fensterbank"|"auf der Ofenbank"]
	| " die häufigen "["Überstunden"|"Geschäftsessen"|"Dienstreisen"]
	  " von "Vater>Dativ
	  [""|", meist in Anwesenheit seiner "
	    ["Sekretärin"|"jüngeren Mitarbeiterinnen"]]
	| "Gestaltung "["der Garage"|"des Gartens"|"des Urlaubs"]
	| "die Hoheit über "["die Haushaltskasse"|"die Kreditkarte"]
;

Testbeschreibung:
	[Testbeschreibung1 ". "]>upcase-first
	[Testbeschreibung2 ". "]>upcase-first
	PBRK
	[Testbeschreibung3 ". "]>upcase-first
	[Testbeschreibung4 ". "]>upcase-first
	[Testbeschreibung5 ". "]>upcase-first+
;

Testbeschreibung1:
	"die "Gutachterin" führte mit "$v-Testperson" "Testzweck" den "
	  Testname-akk" durch"
	| $v-Testperson" wurde dem "Testname-akk" unterzogen"
	| Testzweck " "
	  ["wurde "$v-Testperson" dem "Testname-akk" unterzogen"
	   |"führte die "Gutachterin" mit "$v-Testperson" den "Testname-akk
	    " durch"]
	| "mit "$v-Testperson" führte die Gutachterin "Testzweck" den "
	  Testname-akk" "["und"|"sowie"]" den "Testname-akk" durch"
;

Testzweck:
	"zur Erfüllung des Gutachtenauftrages"
	|"zur "["Abklärung"|"Diagnose"|"Perzeptionsdiagnostik"]
	 " der "["Konfliktproblematik"|"Konfliktfelder"]
	|"in der Explorationsphase"
;

Testbeschreibung2:
	[DABEI|"in dem Test"]" wird "zu-Testendes-akk
	" "["getestet"|"erfaßt"|"bewertet"|"ausgewertet"|"evaluiert"]
	| "der Test "["erfaßt"|"bewertet"|"quantifiziert"|"evaluiert"|"mißt"]
	  " "zu-Testendes-akk
	|?v-Faehigkeit=Faehigkeit
	 [DABEI|["bei"|"nach"]" "Psycho-Autoritaet]" wird "zu-Testendes-akk
	 " anhand des "Interview-Typ-gen" und der "Skala" erhoben. Bei "
	 ["dieser Vorgehensweise"|"diesem Anzatz"|"diesem Verfahren"]
	 " bezieht sich die "$v-Faehigkeit" auf die "
	 ERZAEHLUNGEN" der "Erzaehler-gen-pl" "
	 "ihrer "Erfahrungen" in der Vergangenheit. "
	 "Die so "FESTGESTELLTE" "Psychobegriff" wird dann hinsichtlich ihrer "
	 PRAEDIKTIVEN" Kraft für bestimmte "PARAMETER-akk-pl" der "KINDLICHEN
	 " Entwicklung "UNTERSUCHT
	 [" ("Literaturzitat")"|""]
	|?v-Faehigkeit=Faehigkeit
	 [DABEI|["bei"|"nach"]" "Psycho-Autoritaet]" wird die "$v-Faehigkeit
	 " in der Interaktion mit "["dem gegenwärtigen Kind"
	   |"den Bezugspersonen"|"der Peer Group"]" "UNTERSUCHT". "
	 "Dies ermöglicht eine "DIREKTE" "UNTERSUCHUNG" des "
	 ZUSAMMENHANG>Genitiv" zwischen "
	 $v-Faehigkeit" der "ELTERN-gen" und "KINDLICHER" Entwicklung"
	 [" ("Literaturzitat")"|""]
;

Testbeschreibung3:
	$v-Testperson" "
	["war hier unauffällig"|"zeigt keine Auffälligkeiten"
	 |"zeigte hierbei "["schwere"|"leichte"|"deutliche"|"atypische"]
	  " "Pers-Stoerungen-akk]
	| "es zeigten sich bei "$v-Testperson" "
	  ["schwere"|"leichte"|"deutliche"|"signifikante"|"atypische"]
	  " "Pers-Stoerungen-akk
	| $v-Testperson" zeigte "
	  ["schwere"|"leichte"|"deutliche"|"signifikante"|"atypische"]
	  " "Pers-Stoerungen-akk
	| "bei "$v-Testperson" waren "
	  ["schwere"|"leichte"|"deutliche"|"signifikante"|"atypische"]
	  " "Pers-Stoerungen-akk" zu "
	  ["erkennen"|"diagnostizieren"|"festzustellen"]
	| zu-Testendes-akk" war unauffällig"
	| $v-Testperson" gab "
	  ["während der Exploration"|"im Gespräch"|"im Telefoninterview"
	   |"im Fragebogen"]" an, "
	  "daß das Verhältnis zum Partner durch "Pers-Stoerungen-akk" "
	  ["belastet"|"getrübt"]" sei"
;

Testbeschreibung4:
	"der "["Index"|"Wert"|"Indikator"]" für "zu-Testendes-akk" liegt "
	["jedoch"|"allerdings"|"hierbei"|""]
	" "["deutlich"|"klar"|"signifikant"|"wesentlich"]
	" "["außerhalb des Konfidenzintervalls"|"jenseits des "
	   ["Normal"|"Durchschnitts"|"Standard"]"wertes"|
	    ["unterhalb"|"oberhalb"]" von "{=10..100}]
;

Testbeschreibung5:
	["dieser Befund"|"diese Diagnose"|"dies"]" wird "
	  ["gestützt"|"untermauert"|"plausibel"]" durch "stuetzende-Tatsache
	| stuetzende-Tatsache" macht "["diesen Befund"|"diese Tatsache"]
	  " "["plausibel"|"erklärbar"|"nachvollziehbar"|"zwingend"]
	| "hinzu kommt "stuetzende-Tatsache
	| ["auch"|"darüberhinaus"]" ist "stuetzende-Tatsache
	  " "["zu beachten"|"zu berücksichtigen"|"in Betracht zu ziehen"]
	| ["allerdings"|"demgegenüber"]" ergibt sich durch den "Testname-akk
	  " ein "["leicht"|"deutlich"|"schwer zu deutendes"]
	  " "["abweichendes"|"differierendes"|"anderes"]
	  " "["Bild"|"Symptombild"|"Bild der Problematik"]
	| "im "Testname-akk" assoziierte "$v-Testperson
	  " "["auffällig"|"signifikant"|"überproportional"]
	  " oft negativ besetzte Termini ("neg-Tiernamen") mit dem Vater"
	| "die Tatsache, daß "$v-Testperson" "["den Vater"|"die Mutter"
	    |"die zuständige Mitarbeiterin des Jugendamtes"]" "
	      ["teilweise"|"massiv"|"deutlich"]" negativ"
	  " besetzt ("[neg-Tiernamen|Beleidigung]"), "
	  ["bedarf noch weiterer "["Exploration"|"Abklärung"]
	   |"ist aus dem Vorgehenden "["verständlich"|"nachzuvollziehen"]
	   |"wird in der Literatur ("Literaturzitat") bei "Pers-Stoerungen-dat
	     " "["häufig"|"regelmäßig"]" "["beschrieben"|"angeführt"]" ("
	     Literaturzitat")"
	   |"führt die "["Forschung"|"Literatur"]" ("Literaturzitat
	    ") auf "Pers-Stoerungen-akk" zurück ("Literaturzitat")"]
	| ["demgegenüber"|"in diesem Sinne"]" tritt "stuetzende-Tatsache
	  " "["in der Bedeutung zurück"|"in den Hintergrund"]
	| ["wenngleich"|"obzwar"]" "["dieser Befund"|"dieses Ergebnis"]
	  " "["alleine"|"für sich genommen"]" "
	  ["schwer interpretierbar"|"uneindeutig"]
	  " sein mag, so wird er doch durch "
	  stuetzende-Tatsache" "["untermauert"|"gestützt"]
	| "in der "
	  ["jugendpsychologischen"|"kinderpsychologischen"|"amerikanischen"]
	   " "["Literatur"|"Forschung"]" ("Literaturzitat") wird "
	  ["verschiedentlich"|"überzeugend"|"generell"|"grundsätzlich"]
	  " "["der Zusammenhang"|"die Korrelation"|"der Konnex"]
	  " von "Pers-Stoerungen-dat
	  " und "["aberrantem Erziehungsverhalten"|"Erziehungsunfähigkeit"]
	  " "["beschrieben"|"belegt"|"diskutiert"|"bejaht"]"; dies wird "
	  " durch "stuetzende-Tatsache" "["untermauert"|"gestützt"]
	| "aus meiner bisherigen Gutachtertätigkeit kenne ich "
	  ["den Zusammenhang"|"die Korrelation"|"den Konnex"]" von "
	  ["aberrantem Erziehungsverhalten"|"Erziehungsunfähigkeit"]" und "
	  Pers-Stoerungen-dat", sodaß meine "["Ausführungen"|"Schlüsse"]
	  " als "["wissenschaftlich fundiert"|"valide"|"erfahrungsgestützt"]
	  " "["gelten dürfen"|"anzusehen sind"]
	| "die "["Evaluation"|"Kreuzkorrelation"|"Auswertung"|"Faltung"
	     |"Extrapolation"]
	  " der Testergebnisse nach dem "Auswertungsverfahren
	  " "["erhärtet"|"belegt"|"validiert"]
	  " "["Vorgenanntes"|"das oben Beschriebene"]
;

Testname-akk:
	["integralen"|"interaktiven"|"tiefenpsychologischen"|"reflexiven"
	 |"organisch-holistischen"|"konfrontativen"|"kognitiven"|"iterativen"
	 |"systemischen"|"symbolischen"|"perzipierenden"|""]
	" "[ ["Assoziations"|"Apperzeptions"|"Bindungstiefen"|"Visualisierungs"
	   |"Interpretations"|"Impuls"|"Konfrontations"|"Impulsivitäts"
	   |"Malen-nach-Zahlen"]
	  "-Test"[" nach "akad-Autoritaet]]
	 | Nachname"-Test" | "Rorschach-Assoziationstest (RAT)"
	|"TAT (Thematischer Assoziationstest) nach "akad-Autoritaet
;

Auswertungsverfahren:
	["Chi-Quadrat"|"Data Enrichment"|"Gap-Filling"|"Least Squares"
	 |"Kubisches Regressions"]
	 "-Verfahren"
;

akad-Autoritaet:
	["Prof"|"Dr"]". " Nachname["-"Nachname|""]
	| Nachname"/"Nachname
;

Literaturzitat:
	Buchzitat|Zeitschriftenzitat|Konferenzbericht
;

Buchzitat:
	Nachname["/"Nachname|""]": "Buchtitel", "Stadt" "{=1960..1990}
;

Buchtitel:
	["Handbuch"|"Atlas"]" "Pers-Stoerungen-akk>upcase-first
	| Pers-Stoerungen-akk>upcase-first" in der "["therapeutischen"
	  |"gutachterlichen"|"forensichen"|"klinischen"]" Praxis"
	|Auswertungsverfahren" bei "Pers-Stoerungen-dat>upcase-first
	|["Medikation"|"Naturheilmittel"|"Ganzheitlicher Ansatz"
	  |"Irisdiagnose"]" bei "Pers-Stoerungen-dat>upcase-first
	|["Verhältnis"|"Konnex"|"Differentialdiagnose"|"Interdependenz"]
	  " von "Pers-Stoerungen-dat" und "Pers-Stoerungen-dat
	| Psychobegriff" und "Stoerung
;

Zeitschriftenzitat: Zeitschrift" "{=1..52}"/"{=1960..1990}", S. "{=10..100}
;

Zeitschrift: "Der Spiegel"|"SZ Wissen"|"Focus"|"Psychologie heute"
	| ["Journal für"|"Zeitschrift für"|"Monatsschrift für"]
	  " "[psycho-Adj-akk-pl>upcase-first]
	  " "["Psychologie"|"Praxis"|"Therapie"]
;

Konferenzbericht:
	["Berichte der"|"Proceedings der"]" "{=3..11}". "Konferenz
	  ", S. "{=10..1000}
;

Konferenz:
	  ["Konferenz über"|"Jahrestagung der Gesellschaft für"]
	  " "psycho-Adj-akk-pl>upcase-first[" "psycho-Adj-akk-pl>upcase-first|""]
	  " "["Psychologie"|"Praxis"|"Therapie"]" "{=1960..1990}
;

Empfehlung:
	[Empfehlung1". "]>upcase-first
	[Empfehlung2". "]>upcase-first PBRK
	[Empfehlung3". "]>upcase-first+
;

Empfehlung1:
	["die Auswertung der Tests"|"die Exploration"
	  |"die "["Konflikt"|"Setting"]"analyse"|"die Evaluation"]" "
	["ergibt"|"zeigt"|"identifiziert"|"indiziert"|"deutet auf"]" "
	["deutliche"|"klare"|"behandlungsbedüftige"|"nicht vernachlässigbare"]
	" "Pers-Stoerungen-akk", die "
	["ein Verbleiben der Kinder in der Familie"
	 |"eine weitere Exposition der Kinder gegenüber den "
	   Pers-Stoerungen-dat" des Vaters"]
	" "["nicht zulassen"|"verbieten"|"risikobehaftet erscheinen lassen"]
;

Empfehlung2:
	"das Sorgerecht für "Tochter" und "Sohn" sollte "
	["zur Wahrung des "KINDESWOHL-gen|
	 "zur Abwendung einer Gefährdung des "KINDESWOHL-gen]" auf "
	["das Jugendamt "Stadt|"einen Pfleger"|"die Kindesmutter"]
	" übertragen werden"
;

Empfehlung3:
	["wegen"|"aufgrund"]" der "Pers-Stoerungen-dat" des Vaters kann eine"
	 " Heranführung " ["der Kinder"|"von "Tochter" und "Sohn]" nur "
	 ["nach einer erfolgreichen "Therapie-dat
	   " "["des Vaters"|"von "Vater>Dativ]
	  |"unter Begleitung durch "["pädagogisches Fachpersonal"|"Fachleute"]]
	 " "["versucht werden"|"in Frage kommen"]
	| "die "["Belastungen"|"Schädigungen"]" der Kinder können nur durch "
	  ["Trennung von den belastenden Momenten"
	   |["mehrjährige"|"langfristige"]" "Therapie-akk]" "
	  ["ausgeglichen"|"kompensiert"]" werden"
	|"die "["bestehenden"|"wesentlichsten"|"drängendsten"]
	 " "["Konfliktfelder"|"Defizite"|"Affektationen"|"Affizienzen"]
	 " "["sollten"|"müssen"]" durch "
	 Therapie-akk" "["aufgearbeitet"|"aufgearbeitet"|"in Angriff genommen"]
	 " werden"
	|"die "["Schwere des Konfliktes"|"Gefahr für das Kindeswohl"
	        |"Dimension der Gefährdung des Kindeswohls"]
	 " gebot "["eine sofortige Intervention"|"sofortiges Agieren"]"; "
	 ["diesbezüglich"|"insoweit"|"in Wahrnehmung meiner Pflichten"]
	 " habe ich "["mich mit "["dem Jugendamt "Stadt|"der Polizei "Stadt]
	 " in Verbindung gesetzt"|"die Behörden in "Stadt" informiert"
	   |"eine Herausnahme der Kinder aus der Familie veranlaßt"
	   |"die Unterbringung der Kinder in einer Anstalt veranlaßt"]
;

Rechnung:
	"Ich bitte um Überweisung meines Honorars auf das Konto "Kontonummer
	" bei der "Bank", BLZ "BLZ"."
;

Gutachterin: "Unterzeichnete"|"Gutachterin"|"Autorin"
;

Therapie:
	["ambulante"|"stationäre"|""]" "["kognitive"|"systemische"|""]" "
	[["autogene"|"tiefenpsychologisch fundierte"|"Rational-Emotive"]
	  " "["Therapie"]
	| ["Gestalt"|"Gesprächs"|"Verhaltens"|"Katathym-Imaginative Psycho"
	   |"Familien"|"Konzentrative Bewegungs"|"Dynamische Gruppenpsycho"
	    |"Transaktionsanalytische Psycho"|"Antitraumata"]"therapie"]
;

Therapie-dat: Therapie>Dativ;

Therapie-akk: Therapie;

zu-Testendes-akk:
	["die Reaktion auf"|"die Anpassung an"|"das Verhalten in Bezug auf"]
	" "psycho-Adj-akk-pl
	" "["Situationen"|"Konstellationen"|"Settings"|"Reaktionen"
	    |"Affektationen"]
	[" "["im Zusammenhang mit"|"im Kontext von"|"bei Vorliegen von"
	    |"im Konnex mit"]
	" "Pers-Stoerungen-dat|""]
	|"das "["Konflikt"|"Erziehungs"|"Kommunikations"]"verhalten"
	 [" "["im Zusammenhang mit"|"im Kontext von"|"bei Vorliegen von"
	    |"im Konnex mit"]" "Pers-Stoerungen-dat|""]
	|"die "Faehigkeit
	|"die Bindungserfahrung in der Vergangenheit"
;

stuetzende-Tatsache:
	["das Verhalten ("Verhalten-pl")"|"die Auffälligkeit ("Verhalten")"
	  |"das "["ungekämmte"|"blondierte"|"verfilzte"|"gegelte"]" Haar"
	  |"die "["langen"|"kurzgeschnittenen"|"gefärbten"|"filzigen"]" Haare"
	  |"die Schlotterbüx"|"die enganliegenden Leggings"|"Tarnkleidung"
	  |"das vernachlässigte Äußere"
	  |"die Kleidung ("Kleidung-pl")"|"die Gestik ("Gestik")"
	  |"die Mimik ("Mimiken")"]
	  " von "$v-Testperson" "
	["bei der Exploration"|"im hergestellten Setting"
	  |"im Kontakt mit Gleichgestellten"|"in der Peer Group"
	  |"im Gespräch mit der "Gutachterin>Dativ]
	| "das Ergebnis im "Testname-akk
;

Interview-Typ-gen:
	["Erwachsenen"|"Mutter"|"Vater"]["bindungs"|"reflexions"]"interviews"
;

Skala:
	["Selbstreflexions"|"Interpersonalitäts"|"Mentalisierungs"]"skala"
;

Faehigkeit:
	["Mentalisierungs"|"Bindungs"|"Affekt"|"Einsichts"|"Rekonstruktions"
	 |"Selbstreflexions"]"fähigkeit"
;

Erfahrungen:
	["Bindungs"|"Liebes"|"Konvolutions"|"Mentalisierungs"|"Bindungs"
	 |"Selbstreflexions"]"erfahrungen"
;

Pers-Stoerungen:
	["Verhaltens"|"Assoziations"|"Empathie"|"Entwicklungs"|"Belastungs"
	    |"Identitäts"|"Überich"]
	["störungen"|"auffälligkeiten"|"demenzen"|"verzögerungen"
	 |"verschiebungen"|"ungleichgewichte"|"regressionen"|"verzerrungen"
	 |"konvolutionen"]
;

Pers-Stoerungen-akk:
	psycho-Adj-akk-pl" "Pers-Stoerungen;

Pers-Stoerungen-dat:
	psycho-Adj-akk-pl>Dativ-pl" "Pers-Stoerungen>Dativ-pl;

Stoerung:
	["Störung"|"Beeinträchtigung"|"Hemmung"|"Unterdrückung"
	  |"Fehlentwicklung"|"Unterentwicklung"]" der "
	  ["Vater"|"Mutter"|"Sozial"]["bindung"|"affektation"]
	| psycho-Adj-akk-pl" "["Persönlichkeitsstörung"|"Störung"|"Demenz"
	  |"Dysphorie"|"Dysphasie"|"Psychopathie"]
;

Psychobegriff:
	"Mentalisierung"|"psychische Realität"|"Scheinrealität"
	|"Komplexitätsreduktion"
;

psycho-Adj-akk-pl:
	"interpersonale"|"behaviourale"|"traumatische"|"frühkindliche"
	|"neuronale"|"soziale"|"pychogene"|"psychosomatische"|"neurotische"
	|"pathologische"|"undifferenzierte"|"transpersonale"|"unspezifische"
	|"prä-traumatische"|"parentale"|"schizoide"|"paranoide"|"Freud'sche"
	|"dissoziale"|"zwanghafte"|"affektive"|"selenoide"|"helikale"
	|"affektiv‑interaktive"|"mentalisierte"|"überaktive"|"frühkindliche"
	|"regredierende"|"aggressive"|"uneingestandene"|"unterdrückte"
;

psycho-Adj-akk:
	psycho-Adj-akk-pl"n"
;

Psycho-Quark-Absatz:
	?v-Stoerung = Stoerung
	[Psycho-Quark-Befund ". "]>upcase-first
	[Psycho-Quark-Folgesatz ". "]>upcase-first+
;

Psycho-Quark-Befund:
	"die "TESTERGEBNISSE" "INDIZIEREN" "Praeambel" eine "$v-Stoerung
	| Praeambel" "INDIZIEREN" die "TESTERGEBNISSE" eine "$v-Stoerung
	| Praeambel" "DEUTEN" die "TESTERGEBNISSE" auf eine "$v-Stoerung
	| Praeambel" lassen die "TESTERGEBNISSE" eine "$v-Stoerung" annehmen"
	| Praeambel" machen die "TESTERGEBNISSE" eine "$v-Stoerung
	  " wahrscheinlich"
;

Psycho-Quark-Folgesatz:
	[DIESE" "$v-Stoerung|"sie"]" tritt "HAEUFIG" "
	  ["im Zusammenhang mit"|"als Folge"|"bei Personen mit"]" einer "
	  Stoerung>Dativ" auf"
	| "der "ZUSAMMENHANG" mit einer "Stoerung>Dativ" "
	  ["ist wahrscheinlich"|"kann ausgeschlossen werden"
	   |"wird in der Literatur beschrieben"]
	| [DIESE" "$v-Stoerung|"sie"]" "["wird "HAEUFIG|"kann"]" "
	  ["auch"|"in der Folge"|"bei Anlagen zu "Stoerung>Dativ]
	  " eine "Stoerung" "["auslösen"|"verdecken"|"hervorrufen"|"begleiten"]
	  [""|", "kann-therapiert-werden]
	| ["ohne "BEHANDLUNG|"unbehandelt"]" kann hieraus eine "Stoerung
	   " entstehen"
	| [DIESE" "$v-Stoerung|"sie"]" drückt "HAEUFIG" einen "Wunsch" aus"
	| [DIESE" "$v-Stoerung|"sie"]" symbolisiert "HAEUFIG" einen "Wunsch
	| [DIESE" "$v-Stoerung|"sie"]" drückt "HAEUFIG" eine "Angst" aus"
	| [DIESE" "$v-Stoerung|"sie"]" symbolisiert "HAEUFIG" eine "Angst
	| [DIESE" "$v-Stoerung|"sie"]" tritt "HAEUFIG" bei "Personenkreis" auf"
	  [""|", "kann-therapiert-werden]
;

/* TESTPERSON berichtete, häufig von DINGEN zu träumen. DINGE symbolisieren
 in der Freudschen Traumdeutung INTERPRETATION DES DINGES. DINGE können auch
 angstbesetzt sein. Es ist anzunehmen, daß TESTPERSON bereits frühkindliche
 Erfahrungen mit DINGEN hatte.
*/

Traum-Absatz:
	?v-Traumsubjekte =
		["Motorräder"|"Kraftfahrzeuge"|"Kochtöpfe"|"Staubsauger"
		|"Krokodile"|"Meerschweinchen"|"Frösche"|"Prinzen"
		|"Kaninchen"|"Schweinen"]
	?v-Traumsubjekt-Aktivitaet =
		[", die "[["in einen Brunnen"|"in ein Loch"|"in einen Vulkan"
		          |"vom Himmel"|"von einem Hochaus"|"von einem Turm"]
		       	   " "["fallen"|"stürzen"|"springen"]
			 |"sich im Kreis drehen"]]
	?v-Traumsubjekte-Interp =
		["die Bewegung vom Inneren zum Äußeren"
		 | ["die Dialektik"|"die Dichotomie"|"die Trennung"
		    |"das Spannungsverhältnis"]
		   " von "abs-Begriff" und "abs-Begriff
		 |["die Angst vor"|"den Wunsch nach"]" "Wunschziel]
	[Traumbeschreibung ". "]>upcase-first
	[Traumfolgesatz1 ". "]>upcase-first
	[Traumfolgesatz2 ". "]>upcase-first
;

Traumbeschreibung:
	/* Der Einfachheit halber alles im Plural */
	$v-Testperson " berichtete, "MANCHMAL" von "
	 $v-Traumsubjekte>Nomen-pl--dat $v-Traumsubjekt-Aktivitaet", zu träumen"
	|$v-Testperson " träumt nach "["eigener Aussage"|"eigenenen Angaben"]
	 " "MANCHMAL" von "$v-Traumsubjekte>Nomen-pl--dat
	 $v-Traumsubjekt-Aktivitaet
	|$v-Testperson " hat nach "["eigener Aussage"|"nach eigenen Angaben"]" "
	 MANCHMAL" Träume"[" von "$v-Traumsubjekte>Nomen-pl--dat
	 	   	    $v-Traumsubjekt-Aktivitaet
	 	   	   |", in denen "$v-Traumsubjekte
			    $v-Traumsubjekt-Aktivitaet", "
			    ["eine Rolle spielen"|"vorkommen"]]
;

Traumfolgesatz1:
	$v-Traumsubjekte" stehen "nach-der-Theorie" für "
	  $v-Traumsubjekte-Interp
	| nach-der-Theorie" symbolisieren "$v-Traumsubjekte" "
	  $v-Traumsubjekte-Interp
;

Traumfolgesatz2:
	["dieses Spannungsverhältnis"|"dieser Konflikt"]" zwischen "abs-Begriff
	" und "abs-Begriff" kann "Pers-Stoerungen-akk" "
	["hervorrufen"|"induzieren"][", "kann-therapiert-werden|""]
	| ["der Wunsch nach"|"die Angst vor"]" Überwindung "
	  ["dieses Spannungsverhältnisses"|"dieses Konfliktes"]" zwischen "
	  abs-Begriff" und "abs-Begriff" kann zu "Pers-Stoerungen-dat" führen"
	  [", "kann-therapiert-werden|""]
;

TESTERGEBNISSE: ["erhobenen"|"oben beschriebenen"|"diagnostizierten"|""]
	" "["Testergebnisse"|"Befunde"|"Ergebnisse"]
;

kann-therapiert-werden:
	"ist aber einer "Therapie>Dativ" zugänglich"
	| "die "Therapie" "["wird "HAEUFIG" mit gutem Erfolg angewendet"
	 |"ist "HAEUFIG" erfolgreich"]
;

nach-der-Theorie:
	"nach der Theorie von "Psycho-Autoritaet" ("Literaturzitat") "
	| "nach der "Theorie | "der "Theorie" folgend"
	| "nach der "Literatur" ("Literaturzitat") "
	| "der "Literatur" ("Literaturzitat") folgend"
;

INDIZIEREN:
	"indizieren"
;

DEUTEN:
	"weisen"|"deuten" /* .. auf */
;

DIESE: "diese"|"eine solche"|"eine derartige"|"die"|"die"|"die"
;

HAEUFIG: "häufig"|"in vielen Fällen"|"meistens"|"in der Mehrzahl der Fälle"|""
;

MANCHMAL:
	"manchmal"|"gelegentlich"
;

ZUSAMMENHANG: "Zusammenhang"|"Konnex";

DABEI:	"dabei"|"hierbei"|"hier"|"hierdurch";

UNTERSUCHT:
	"getestet"|"erfaßt"|"bewertet"|"ausgewertet"|"evaluiert"|"erhoben"
;

PRAEDIKTIVEN:
	"prädiktiven"|"konstitutiven"|"normativen"
;

KINDLICHEN: "frühkindlichen"|"kindlichen"|["post"|"prä"|""]"infantilen"
;

KINDLICHER: "frühkindlicher"|"kindlicher"|["post"|"prä"|""]"infantiler"
;

ERZAEHLUNGEN:
	"Erzählungen"|"Tradierung"|"Weitergabe"
;

Erzaehler-gen-pl: "Erwachsenen"|"Umwelt"|"Eltern"|"Umgebung"
;

DIREKTE: "direkte"|"unmittelbare";

UNTERSUCHUNG: "Untersuchung"|"Evaluation";

PARAMETER-akk-pl:
	"Parameter"|"Determinanten"|"Konstituenten"
;

ELTERN-gen: "Eltern"|"parentalen Bezugspersonen";

FESTGESTELLTE: "festgestellte"|"determinierte"|"induzierte"
;

KINDESWOHL:
	"Kindeswohl" | "Wohl der "["minderjährigen "|""]"Kinder"
;

KINDESWOHL-dat: KINDESWOHL;

KINDESWOHL-gen:
	"Kindeswohls" | "Wohls der "["minderjährigen "|""]"Kinder"
;

Praeambel: "nach meiner Erfahrung" | "daher" | "somit" | "andererseits"
	| "möglicherweise" | "mit Sicherheit"| "mit einiger Sicherheit"
	| "nach der Theorie von "Psycho-Autoritaet" ("Literaturzitat") "
	| "nach der "Theorie | "der "Theorie" folgend"
	| "nach der "Literatur" ("Literaturzitat") "
	| "der "Literatur" ("Literaturzitat") folgend"
;

neg-Tiername: "Affe"|"Schwein"|"Dreckschwein"|"Sau"|"Hornochse"|"Kamel"
	|"Stoffel"
;

neg-Tiernamen:
	neg-Tiername | neg-Tiername", "neg-Tiernamen
;

abs-Begriff: "Antithese"|"Priorität"|"Identität"|"Verschiedenheit"
	| "Indifferenz"|"Perzeption"|"Kohärenz"|"Negation"
	| "Kongruenz"|"Konkordanz"|"Dichotomie"
;

Beleidigung:
	GQQUOTE(["kann mich mal"|"leck mich doch"|"geht mir am Arsch vorbei"])
;

Gestik:	"Fassen an das "["linke"|"rechte"]" "["Ohr"]
	| "Schütteln der Faust" | "Kopfkratzen" | "Nasebohren"
	| "mit dem Fuß wippen"
;

Mimik:	"Schießen des "["linken"|"rechten"]" Auges"
	|"Hochziehen der "["linken"|"rechten"]" Braue"
	|["unsicheres"|"freches"]" Grinsen"
;

Mimiken: Mimik | Mimik", "Mimiken
;

Verhalten: "Drohen mit "["der Polizei"|"dem großen Bruder"]
	| "Hochkrempeln der Ärmel"|"Beißen in den Teppich"
	| "Versuch der Bestechung mit "["einer Flasche Schnaps"|"5 Euro"]
	| "auf den Boden werfen" | "Hämmern des Kopfes an die Wand"
	| "Vorliebe für volkstümliche Musik"
;

Verhalten-pl: Verhalten | Verhalten", "Verhalten-pl
;

Kleidung: "Wollsocken"|"Faltenrock"|"Pudelmütze"|"kurze enge Hose"
	|"rote Socken"|"roter Schal"|"gelber Pullunder"|"Jogginganzug"
;

Kleidung-pl: Kleidung | Kleidung", "Kleidung-pl
;

Literatur:
	["klassischen"|"neueren"|"amerikanischen"]
	" "["jugendpsychiatrischen"|"soziopathischen"]" "["Literatur"|"Lehre"]
;

Angst:
	/*"#"*/[psycho-Adj-akk-pl" "]" Angst vor "[Angstziel|Wunschziel]
;

Angstziel:			/* Angst vor ... */
	psycho-Adj-akk-pl"r "
	 ["Bindungs"]["toleranz"|"regression"|"frustration"]
;

Wunsch:
	[psycho-Adj-akk" "]" "["Wunsch nach "Wunschziel
	|["Kinder"|"Liebes"|"Todes"|"Schlaf"]"wunsch"]
;

Wunschziel:			/* Wunsch nach ... */
	"Rückkehr in den Mutterleib"|"Liebe"|"schnellen Autos"
	|"schnellen Frauen"|"Geld"|"Anerkennung"|"Sicherheit"
	| "der Hinwendung "
		    ["des Ichs"|""]" zum Du"[" des Anderen"|""]
	|"der Annahme des Andersseins des Du"
;

BEHANDLUNG: "Behandlung"|"Therapie"
;

Personenkreis:
	"Personen aus dem "["bildungsbürgerlichen"|"bürgerlichen"
	   |"sozial schwachen"]" Milieu"
	| "Personen aus dem "["Bürgertum"|"verarmten Adel"|"ländlichen Bereich"]
	| ["scheinbar normalen"|"scheinbar unauffälligen"|"gebildeten"
	  |"drogenabhängigen"]" Personen"
;

Psycho-Autoritaet: "Freud"|"Adler"|"Jung"|"Neumann"
;

Theorie:
	[Psycho-Autoritaet"'schen"|""]" "["Gestalt"|"Ergon"]"theorie"
	| Psycho-Autoritaet"'schen Theorie"
;

Stadt:	"Lüneburg"|"Uelzen"|"Stade"|"Elmshorn"|"Schleswig"|"Neustadt a.d.A."
	|"Nürnberg"|"Celle"|"Hamburg"|"Harburg"|"Altdorf"|"München"|"Köln"
	|"Suderburg"|"Glückstadt"|"Kiel"|"Hersbruck"|"Ismaningen"
;

Land:	"Italien"|"Spanien"|"Österreich"|"Schottland"|"Liechtenstein"
	"Luxemburg"
;

Insel:	"Kreta"|"Capri"|"Sylt"|"Wangerooge"|"Mallorca"|"Teneriffa"
	|"Herrenchiemsee"|"Elba"|"Mykonos"
;

Bank:	["Akademiker"|"Volks"|"Beamten"|"Kleinkredit"]"bank "Stadt
;

Kontonummer: {=100..999}[" "|"-"|"/"]{=10..999}[" "|"-"|"/"]{=10..999}
;

BLZ:	 {=100..999}" "{=100..999}" "{=10..99}
;

/*
 *
 */
Genitivtest:
	"Genitiv" BRK
	"Park   -> " "Park"    >Genitiv BRK
	"Schule -> " "Schule"  >Genitiv BRK
	"Auto   -> " "Auto"    >Genitiv BRK
	"Institut -> " "Institut"    >Genitiv BRK
;

Dativtest:
	"Dativ" BRK
	"Park   -> " "Park"    >Dativ BRK
	"Schule -> " "Schule"  >Dativ BRK
	"Auto   -> " "Auto"    >Dativ BRK
	"Institut -> " "Institut"    >Dativ BRK
;

/* Deklination */

Genitiv:
	".*[ex]$" -> "$"/""
	".*$" -> "$"/"s"
;

/* Um den Dativ zu bilden, wird ein "n" angehängt: */
Dativ-pl:
	".*[e]$" -> "$"/"n"	/* e -> en */
;

/*Dativ */
Dativ:
	"Herr .*" -> "Herr "/"Herrn "
	".*e "  -> "e "/"en "	/* "neue xx" -> "neuen xxx"*/
	".*e$"  -> "e$"/"en"	/* "Unterzeichnete" -> "Unterzeichneten"*/
;

/* Dativ eines Nomens, das im Plural steht */
Nomen-pl--dat:
	".*[^n]$" -> "$"/"n"	/* N anhängen, wenn Nomen nicht auf N endet */
;

Feminin:
	".oach" -> "$"/""
	".*$" -> "$"/"in"
;

#include "krankheit.pb"
