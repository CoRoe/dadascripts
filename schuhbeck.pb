//#include <stdmap.pbi>
#include <format.pbi>

/*

Italienisch kochen, "aber mit vui bayerischem Gfui" – das beweist der Münchner
Meisterkoch auch mit seinem wunderbaren Hirschgulasch. Aus Maisgrieß und
Parmesan backt er knusprig goldgelbe Polenta-Küchle und rundet mit süßen
Trauben sowie allerlei Pilzen dieses tolle Gericht ab.

Von diesem Salat kann man einfach nicht genug bekommen! Denn wenn sich ein
krosser Zander und knusprige Riesengarnelen sanft auf ein Meer voller Oliven,
knackiger Gurken und weicher Bohnen betten, hat das schon etwas besonderes!
Für den Dip verrührt Alfons Schuhbeck Joghurt mit Olivenöl und würzt mit
Chilisalz und etwas Zucker. Was für ein (Party)-Hit!

*/

Rezept:
	PROLOGUE
	TITLE("Rezept")
	BODY

	[Intro | Schuhbeck-intro] PBRK
	"Zubereitung" PBRK
	Topf_erhitzen
	Ankochen
	Kochen PBRK
	Parallel_arbeiten PBRK
	Saettigungsbeilage_kochen PBRK
	Weiter_kochen
	Nachwuerzen PBRK
	Servieren PBRK
	Nachsatz PBRK
;

Gaeste:
	"Freunde" | "Gäste" | "Kumpels" | "Kinder" | "Bekannten" | "Kollegen"
;

Bloedes_Essen:
	"Hawaii-Toast" | "Käse-Igel" | "Nudelsalat" | "Mett-Igel" |
	"Nudeln mit Ketchup" | "Pommes rot/weiß"
;

Schickes_Essen1:
	["Fettucine" | "Spinatröllchen" | "Fleischküchla" | "Rouladen" |
	 "Gambas" | "Oktopus" | "Fischfrikadellen" | "Burger" | "Spirelli" |
	 "Zitronenbällchen"]
;

Sauce:
	"Jus von "Gemuese
;

Schickes_Essen:
	[Schickes_Essen1" nach "
			   ["Genoveser" | "Mailänder" | "Jäger" |
			   "Müllerin" | "Fränkischer" | "Gardasee"]" Art" |
	Schickes_Essen1" an "Sauce |
	"Carpaccio von "Schickes_Essen1" an "Sauce] |
	Schickes_Essen1" umlegt mit "Gemuese |
	Schickes_Essen1" an "Gemuese"schaum" |
	Schickes_Essen1" in einem Bett von "Gemuese" an "Gemuese |
	Schickes_Essen1"-Wrap mit "Sauce
;

Intro:
	["Nicht immer nur "Bloedes_Essen": "|
	"Einmal etwas Anderes als " Bloedes_Essen": " |
	 "Darf es einmal etwas "["Italienisches"|"Bayerisches"|
	 "aus der Region"| "Ostfriesisches"|"vom Eglburger See"|"Exotisches"]
	 " sein? "
	]
	["Warum Ihre "Gaeste" nicht einmal mit "Schickes_Essen" "
	 ["überraschen"|"verwöhnen"]"? " |
	"Was glauben Sie, wie Ihre "Gaeste" staunen, wenn Sie sie mit "
	 Schickes_Essen" überraschen. " |
	["Überraschen"|"Bewirten"]" Sie Ihre "Gaeste" einmal mit "
	 Schickes_Essen"! "]
	[["Ganz einfach zuzubereiten"|"Macht nicht viel Arbeit"|
	"Auch etwas für Anfänger"]" und "["schmeckt doch"|"ist lecker"]". "|
	"Etwas Besonderes für einen besonderen Anlaß! "|
	"Zeigen Sie doch Ihre Kochkünste!"|
	"Trauen Sie sich" ?" ruhig etwas zu""!" |
	"Stellen Sie doch Ihre Kochkünste nicht unter den Scheffel!"]
;

Schuhbeck-intro:
	["Italienisch"|"Fränkisch"|"Spanisch"|"Englisch"]" kochen, aber mit "
	"'viel bayerischem G'fui' - "
	"das beweist der Meisterkoch mit seinem Rezept für "Schickes_Essen ". "
	"Aus "Gemuese" und "Saettigungsbeilage" "
	["kreiert"|"backt"|"kocht"|"zaubert"|"bereitet"]" er "
	["ein Gericht, das sich sehen und schmecken lassen kann" |
	"mit dem Sie Ihre Gäste beeindrucken"|
	"ein tolles Gericht"|"ein bayerisch-italienisches Superfood"]
	"."
;

Zutaten: Fleisch Gemuese Saettigungsbeilage Gewuerz
;

Gemuese: ["Blumen"|"Rosen"|"Weiß"|"Rot"|"Grün"]"kohl" | "Brokkoli" |
	 "Sellerie" | "Fenchel" | "Bohnen" | "Erbsen" | "Petersilienwurzel" |
	 "Wirsing" | "Wachtelbohnen" | "Schwammerl" | "Aubergine" |
	 "Artischocke"?"nböden" | "Frühlingszwiebel" | "Weißkohl"
;

mehrere_Gemuese:
	Gemuese |
	Gemuese" und "Gemuese |
	Gemuese" und "Gemuese" zusammen mit dem "Gemuese
;

Saettigungsbeilage: v-Saettigungsbeilage << [
	"Kartoffeln" | "Reis" | "Spätzle" | "Fusillini" |
	"Rigatoni" | "Miràcoli"]
;

Fleisch: ["Rind"|"Schweine"|"Kalb"|"Hühner"]"fleisch"|"Gambas"|"Schnitzel"|
	 "Kotelett"|"Ochsenschwanz"
;

Gefaess:  v-Gefaess<<["Pfanne" | "Wok" | "Topf" | "Kasserolle" | "Tontopf"]
;

Fett: "Schmalz" | "Butter" | "Margarine"
      | ["Oliven" | "Kürbiskern" | "Sonnenblumen"]"öl"
;

Sahne: "Sahne" | "Tomatenmark" | "Rotwein" | "Schmand" | "Rinderfonds" |
       "Mehlschwitze"
;

Gewuerz: "Ingwer" | "Ketchup" | "Pfeffer" | "Rosmarin" |
	 ["Tomaten"|"Chili"]"salz" | "Kurkuma" | "Thymian" |
	 "Salz" | "Salbei" | "Basilikum" | "Kresse" |
	 "Ingwer"|"Paprika"|"Pfeffer" | "Zwiebel" | "Knoblauch" | "Bärlauch"
;

zerkleinern: ["würfeln"|"in "["kleine"|"mittelgroße"|"daumendicke"]" "["Würfel"|"Streifen"|"Ringe"]" schneiden"|
	     "hacken"|"zerteilen"|"pürieren"|"stifteln"]
;

Erhitzen: " mit "["etwas"|"viel"]" "Fett[" erhitzen"]
;

Topf_erhitzen:
	Gefaess" "Erhitzen ". "
;

Ankochen:
	[Fleisch|mehrere_Gemuese]" "zerkleinern " und hineingeben"
	". "
;

Kochen: ["Bei "["kleiner"|"mittlerer"|"großer"]" Hitze"|"Auf Stufe "["7"|"5"]]" "
	["köcheln lassen"|"anschwitzen"|"anbraten"|"sautieren"]
	", dabei " ["ständig"|"gelegentlich"|"immer wieder"]" "
	["umrühren"|"wenden"]
	". "
;

Parallel_arbeiten:
	["In der Zwischenzeit" | "Währenddessen"]" "mehrere_Gemuese" "
	zerkleinern
	", in ein "[["sauberes"|"frisch gewaschenes"]" Tuch"|"Sieb"|"Gefäß"]
	" geben, "
	["gehen"|"ruhen"|"ziehen"]" lassen"
	". "
	["Kräftig mit "Gewuerz" einreiben"|Gewuerz" und "Gewuerz
	" daruntermengen"]
	". "
	"In " Gefaess " heben"
	". "
;

Weiter_kochen: ["Nach 10 Minuten"|"Wenn das Ganze angebräunt ist,"|
	       "Bevor das Ganze schwarz wird,"|
	       "Wenn ein hineingehaltener Kochlöffel geschwärzt wird,"]" "
	       ["Flamme klein drehen"|"Temperatur herunterschalten"]
	       [" und mit "Sahne" abbinden"]
	       ". "
;

Saettigungsbeilage_kochen:
	Saettigungsbeilage" in einem Topf mit "["0,8"|"1,5"|"2"]" Litern "
	["Wasser"|"Weißwein"|"Geflügelfonds"|"Apfelsaft"]" kochen. "
	[["Ein Schuß "["Öl"|"Essig"|"Terpentin"|"Eierlikör"|"Pernod"|
	"Bailey's"|"Jägermeister"|"Wodka"]" verhindert "
	["Überkochen"|"Anbrennen"]". "]|
	["Salz und Pfeffer nicht vergessen. "]|
	["Mit "etwas-d" "exotisches-Gewuerz-d" können'S eine "
	["exotische"|"pikante"]" Note hinzufügen. "]|
	"Auf zirka ein "["Drittel"|"Viertel"]" reduzieren. "|
	"Einkochen lassen, bis es Fäden zieht. "]
	[""|Profitip]
;

Profitip: ["Und"|"Noch"]" ein Tip "["vom Profi"|"von mir"]": "
	  Profitip1
;

Profitip1: ["Die Marinade"|"Die Flüssigkeit"]" nicht "["weggießen"|"wegschütten"]
	   ", sondern "["einfrieren"|"in ein Einmachglas füllen"]". "
	   [""|"Was Sie vielleicht nicht wissen: "|"Was wenig bekannt ist: "]
	   ["Sie eignet sich wunderbar für"
	   |"Sie ist ein "zuverlaessiges" Hausmittel gegen "Wehwehchen"."
	   ]
;


Wehwehchen: "Haarausfall" | "Kopfläuse" | "Darmbeschwerden" | "Warzen" |
	    "Fußgeruch"
;

zuverlaessiges: "zuverlassiges" | "bewährtes" | "schon im alten China bekanntes"
;

Nachwuerzen: [["Wenn Sie's etwas "["kräftiger"|"pikanter"|"schärfer"]" mögen, "
	     "können Sie natürlich mit "|
	     "Nach Belieben mit "]Gewuerz" nachwürzen" |
	     "Etwas g'schmackiger wird es mit einer Prise "Gewuerz |
	     "Etwas "["Zitronenschale"|"Muskatnuß"|Gewuerz]" hineinreiben"]
	     ". "
;

Servieren: ["Sofort servieren" | "Abkühlen lassen und servieren" |
	   "Kalt stellen" |
	   "In kleine Schüsseln "["füllen"|"stürzen"]" und sofort servieren"]
	   ". "
;


Nachsatz: ["Sehen's"|"Man sieht"|"Da san'S"]", so leicht können S' "
	  ["italienisch"|"orientalisch"]" in "Bayern-d" kochen!"|
	  "Was für ein Party-Hit!"|
	  "Ihre Freunde werden staunen!"
;

exotisches-Gewuerz-d: "Kurkuma" | "Bärlauch"
;

etwas-d: "etwas"|"einer Prise"|"einer Handvoll"|"einem Teelöffel"
;

Bayern-d: "Bayern" | "unserer bayerischen Heimat"
;
