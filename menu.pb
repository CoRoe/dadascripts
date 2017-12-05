#include <stdmap.pbi>
#include <format.pbi>

Speisekarte:
	PROLOGUE
	TITLE(title)
	BODY
	Gourmet-Speisekarte
	EPILOGUE
;


Gourmet-Speisekarte:
	SECTION("Entrees") PBRK
	[Entree>upcase-first PBRK]+
	[Entree>upcase-first PBRK]+
	SECTION("Hautgerichte") PBRK
	[Hauptgericht>upcase-first PBRK]+
	[Hauptgericht>upcase-first PBRK]+
	[Hauptgericht>upcase-first PBRK]+
	SECTION("Kinderkarte") PBRK
	Kindergericht+
	Kindergericht+
;

title:	Restaurant
;

Restaurant:
	"Zum " ["Roten"|"Grünen"|"Alten"] " " Tier-mask>upcase-first
	| "Zur " ["Roten"|"Grünen"|"Alten"] " " Tier-fem>upcase-first
	| ["Da"|"Albergo di"|"Osteria di"] " " ital-Vorname
;

ital-Vorname:
	"Fredi"|"Nino"|"Carlo"
;

Entree:
	  Suppenattribut "Suppe vom " Tier-neutr>upcase-first " mit " Beilage1
	| Suppenattribut "Suppe von der " Tier-fem>upcase-first " mit " Beilage1
	| ["Creme"|"Mousse"|"Puree"|"Ratatouille"]"  von "
	  Beilage1 [", verfeinert mit " Gewuerz|""]
	| "Salat von " Beilage1 " an " Beilage2
	| "Salat \"" Qualifikator "\""
;

Suppenattribut:
	"Legierte "|"Klare "|"Schmackhafte "|""
;

Hauptgericht:
	Hauptzutat [" \"" Qualifikator "\""|""]
	| Tier>upcase-first " \"" Qualifikator "\""
	| Hauptzutat " an " Beilage1
	| Hauptzutat " an " Beilage1 " mit " Beilage2
	| Hauptzutat " an " Beilage1 ", dazu " Beilage2
	| Hauptzutat " an " Beilage1 ", umlegt mit " Beilage2
	| Hauptzutat ", gefüllt mit " Beilage1 ", an " Beilage1
	| Hauptzutat " im " Beilage1 "mantel an " Beilage1
	| Hauptzutat " mit " Beilage1 "klößchen an " Beilage1
	| Hauptzutat " mit Bällchen von " Beilage1 " an " Beilage1
	| Hauptzutat ", abgeschmeckt mit " Gewuerz ", an " Beilage1
	| Hauptzutat ", verfeinert mit " Gewuerz ", an " Beilage1
	| Hauptzutat ", eingelegt in " Gewuerz ", an " Beilage1 " mit " Beilage2
	| Hauptzutat " in " Gewuerz"-"Gewuerz"-"["Beize"|"Sauce"]" mit " Beilage1
;

Qualifikator:
	 "Hausmacher Art"|"Friesische Art"|"Wiener Art"|"Napoli"|"Capri"
	|"Bavaroise"|"Indienne"|"rot-weiß"|"aus der Pfanne"|"sizilianisch"
	|"Provencale"|"Milanese"|"aus dem Tontopf"|"vom heißen Stein"
	|"Tante Berta"|"Fränkische Art"|"nach Art der Niedersachsen"
	|"Frittenbude"|"vom Grill"|"Bolognese"|"Kantinen Art"|"Jäger Art"
	|"Mexikanisch"|"aus der Dose"|"von gestern"|"aufgewärmt"
;

Kindergericht:
	Hauptzutat " \"" Figur "\"" BRK
	"(" Hauptgericht ")" PBRK
;

Hauptzutat:
	/*  [Tier Stueck]>upcase-first
	| */Stueck>upcase-first " vom " Tier-mask>upcase-first
	| Stueck>upcase-first " von der " Tier-fem>upcase-first
	| Stueck>upcase-first " vom " Tier-neutr>upcase-first
	| Tier>upcase-first
	| "Bratwurst" | "Spiegelei" | "Rührei" | "Currywurst"
;

Stueck:	 "filet"|"karree"|"haxe"|"souffle"|"hachee"|"geschnetzeltes"|"puree"
	|"zunge"|"lende"|"rücken"|"risotto"|"labskaus"|"lasagne"|"piccata"
	|"schnitzel"|"schaschlik"|"gratin"|"schinken"|"schäufele"|"kotelett"
	|"keule"|"gulasch"|"pudding"
;

Tier:	Tier-mask | Tier-fem | Tier-neutr | Tier-pl
;

Tier-mask: "pangasius"|"frosch"|"dorsch"|"hirsch"|"kabeljau"|"hering"
	|"petersfisch"|"wels"|"hamster"|"hummer"|"wal"|"ochsen"
	|"schellfisch"|"fasan"|"dackel"
;

Tier-fem: "schnecke"|"eule"|"scholle"|"pute"|"ente"|"taube"|"krähe"
	|"nachtigall"|"heidschnucke"|"Mockturtle"|"makrele"
;

Tier-neutr: "kalb"|"weidelamm"|"rind"|"schwein"|"reh"|"wildschwein"
	|"pferd"|"osterlamm"|"lamm"|"strauß"|"känguruh"
;

Tier-pl:
	"hühner"|"tauben"|"schnecken"
;

/* Beilage, die als erste von zweien genannt wird, wie beispielsweise
   Gemüse.
*/
Beilage1:
	[Beilage1-msc|Beilage1-fem|Beilage1-ntr|Beilage1-pl|Beilage1-pl]
	| Herkunft " "
	  [Beilage1-msc|Beilage1-fem|Beilage1-ntr|Beilage1-pl|Beilage1-pl]
;

Beilage1-msc:
	  "Löwenzahn"|"Spargel"|"Broccoli"
	| ["Blumen"|"Weiß"|"Rosen"|"Grün"]"kohl"
	| "Rucola"|"Paprika"
	| ["Schafs"|"Kamel"|"Ziegen"|"Schweizer"]"käse"
	| "Mascarpone"|"Emmentaler"
	| ["Schweine"|"Lamm"|"Ziegen"]"schinken"
;

Beilage1-fem:
	"Brunnenkresse"|"Paprika"|"Aubergine"
;

Beilage1-ntr:
	"Erbspuree"|"Sauerkraut"|"Weißkraut"|"Blaukraut"
;

Beilage1-pl:
	"Artischockenböden"|"Erbsen"|"Möhrchen"|"Prinzeßbohnen"|"Pfirsichen"
	|"Champignons"|"Tomaten"|"Pfifferlingen"|"Erbsen"|"Zucchini"
;

/* Beilage, die als zweite genannt wird, beispielsweise Kartoffeln. */
Beilage2:
	Beilage2-msc|Beilage2-fem|Beilage2-ntr|Beilage2-pl|Beilage2-pl
;

Beilage2-msc:
	[["Basmati"|"Natur"|"Kochbeutel"|""] "reis"]>upcase-first
	| ["Kartoffel"|"Nudel"|"Herings"]"salat"
;

Beilage2-fem:
	"Brunnenkresse"|"Majo"|"Sauce Bearnaise"|"Mayonnaise"
	|"Sauce Hollandaise"|"Melone"|"Kresse"|"Petersilie"
	|["Riesling"|"Weißwein"|"Rotwein"|"Sherry"|"Champagner"]"sauce"
;

Beilage2-ntr:
	"Erbspuree"|"Kartoffelpuree"
;

Beilage2-pl:
	"Pommes"|"Pommes frites"|"Potato Wedges"|"Salzkartoffeln"
	|"Bratkartoffeln"|"Kroketten"|"Klößen"|"Kloß"
	|"Rigatoni"|"Penne"|"Bandnudeln"|"Spaghetti"
	|"Champignons"|"Pfifferlingen"|"Tomaten"
;

Gewuerz:
	 "Pfeffer"|"Cayenne"|"Curry"|"Ketchup"|"Senf"|"Oregano"|"Thymian"
	|"Honig"|"Preiselbeeren"|"Tabasco"|"Wacholderbeeren"|"Ingwer"
	|"Dill"|"Minze"|"Rosmarin"|"Sahne"
;

Figur:
	 "Seeräuber"|"Käpt'n Snack"|"Pirat"|"Biene Maja"|"Fauler Willi"
	|"Sesamstraße"|"Peter Lustig"|"Sesamstraße"|"Harry Potter"
	|"Micky Maus"|"Kater Karlo"|"Barbie"|"Ken"|"Supermann"
	|"Pippi Langstrumpf"|"Schneewittchen"|"Sieben Zwerge"
	|"Teletubbies"
;

Herkunft: "Trientiner"|"Suderburger"|"Hamburger"|"Münchner"
	| "Nürnberger"|"Mailänder"|"Pekinger"|"Wiener"|""|""|""
;
