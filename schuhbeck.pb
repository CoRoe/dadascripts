#include <stdmap.pbi>
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

	Topf_erhitzen
	Ankochen
	Kochen PBRK
	Parallel_arbeiten PBRK
	Saettigungsbeilage_kochen PBRK
	Weiter_kochen
	Nachwuerzen PBRK
	Servieren
;

Zutaten: Fleisch Gemuese Saettigungsbeilage Gewuerz
;

Gemuese: ["Blumen"|"Rosen"|"Weiß"|"Rot"|"Grün"]"kohl" | "Brokkoli" |
	 "Sellerie" | "Fenchel" | "Bohnen" | "Erbsen"
;

mehrere_Gemuese:
	Gemuese |
	Gemuese" und "Gemuese |
	Gemuese" und "Gemuese" zusammen mit dem "Gemuese
;

Saettigungsbeilage: "Kartoffeln" | "Reis" | "Spätzle" | "Fusillini"
;

Fleisch: ["Rind"|"Schweine"|"Kalb"|"Hühner"]"fleisch"|"Gambas"|"Schnitzel"
;

Gefaess:  v-Gefaess<<["Pfanne"|"Wok"|"Topf"|"Kasserolle"]
;

Fett: "Schmalz" | "Butter" | "Margarine"
      | ["Oliven" | "Kürbiskern" | "Sonnenblumen"]"öl"
;

Sahne: "Sahne" | "Tomatenmark" | "Rotwein" | "Schmand" | "Rinderfonds"
;

Gewuerz: "Ingwer" | "Ketchup" | "Pfeffer" | "Rosmarin" |
	 ["Tomaten"|"Chili"]"salz" |
	 "Salz" | "Salbei" | "Basilikum" | "Kresse" |
	 "Ingwer"|"Paprika"|"Pfeffer"
;

zerkleinern: ["würfeln"|"in kleine "["Würfel"|"Streifen"|"Ringe"]" schneiden"|
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

Kochen: ["Bei "["kleiner"|"mittlerer"|"großer"]" Hitze"|"Auf Stufe 7"]" "
	["köcheln lassen"|"anschwitzen"|"anbraten"|"sautieren"]
	", dabei " ["ständig"|"gelegentlich"]" "["umrühren"|"wenden"]
	". "
;

Parallel_arbeiten:
	["In der Zwischenzeit"]" "mehrere_Gemuese" "zerkleinern
	", in ein "["sauberes Tuch"|"Sieb"|"Gefäß"]" geben, "
	["gehen"|"ruhen"|"ziehen"]" lassen"
	". "
	["Kräftig mit "Gewuerz" einreiben"|Gewuerz" daruntermengen"]
	". "
	"In " Gefaess " heben"
	". "
;

Weiter_kochen: ["Nach 10 Minuten"|"Wenn das Ganze angebräunt ist,"]" "
	       ["Flamme klein drehen"|"Temperatur herunterschalten"]
	       [" und mit "Sahne" abbinden"]
	       ". "
;

Saettigungsbeilage_kochen:
	Saettigungsbeilage" in einem Topf mit "["1"|"2"]" Litern "
	["Wasser"|"Weißwein"|"Geflügelfonds"|"Apfelsaft"]" kochen. "
	[
	["Ein Schuß "["Öl"|"Essig"|"Terpentin"|"Eierlikör"]" verhindert Überkochen. "]|
	["Salz und Pfeffer nicht vergessen. "]]
;


Nachwuerzen: [["Wenn Sie's etwas kräftiger mögen, können Sie natürlich mit "|
	     "Nach Belieben mit "]Gewuerz" nachwürzen" |
	     "Etwas g'schmackiger wird es mit einer Prise "Gewuerz]
	     ". "
;

Servieren: ["Sofort servieren" | "Abkühlen lassen und servieren" |
	   "Kalt stellen"
	   "In kleine Schüsseln "["füllen"|"stürzen"]" und sofort servieren"]
	   ". "
;
