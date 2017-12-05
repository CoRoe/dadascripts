#include <stdmap.pbi>

verdikt:
	?Rebsorte-v = Rebsorte
	wein ": "
	[satz>upcase-first ". "]+
;

satz:
	  attribut1 " und " attribut1 ", aber schon das ganze Potential"
	  " andeutend, gelingt der " ["Spagat"|"Kompromi�"] " zwischen "
	   attribut2 " und " attribut2
	| "ein Wein: " attribut1 " und " attribut1 ", aber auch mit "
	  attribut2 " ausgestattet"
	| "Der Abgang ist mit einer angenehmen, animierenden " attribut2
	  " umgeben"
	| "Ein " $Rebsorte-v " mit einer " ["gebiets"|"boden"|"sorten"] 
	 "typischen " attribut2
	| er " verstr�mt ein " [leicht|kraeftig] "es " aroma-akk "aroma"
	| attribut1 " und " attribut1 " in der Nase, hinterher dann " attribut2
	| ["Die Barriquemethode"|"Der " boden |"Die Lagerung im " Fass] " verleiht ihm "
	  ["einen Anklang an "  aroma-akk |"ein Aroma von " aroma-dat]
	| "am Gaumen " attribut1 " und " attribut1 ", mit Nachhall nach "
	  aroma-dat
	| attribut2 " und " attribut2
	 [" paaren sich mit "|" kontrastieren mit "|" harmonieren mit "]
	  attribut2
	| "seine " attribut2 " bildet "
	 ["einen reizvollen Kontrast"|"ein interessantes Pendant"] " zu seiner "
	  attribut2
	| "weder " neg-attr1 " noch " neg-attr1 ", �berzeugt " er " durch "
	  attribut2 " und " attribut2
	| "In keiner Weise " neg-attr1 ", wei� " er " durch " attribut2
	  [" und "|" verbunden mit "]
	  attribut2 " zu " ["gewinnen"|"�berzeugen"|"gefallen"]
;

wein:	ort "er " lage1 lage2
;

ort:	"Kitzing" | ort1 ort2
;

ort1:	"Hohen" | "Dinkels" | "Nerven" | "Gunzen" | "K�s" | "Ochsen"
;

ort2:	"heim" | "hausen" | "weil" | "ach" | "kirch"
;

lage1:	"Katzen" | "Hamster" | "Sonnen" | "M�nchs"| "Frosch" | "Dudel"
	| "Schei�" | "Woschd" 
;

lage2:	  "brunnen" | "feld" | "acker" | "tr�pfchen" | "tropfen" | "grube"
	| "blut"
;

attribut1: "erdig" | "kr�ftig" | "nobel" | "fein" | "blumig" | "s�ffig"
	| "vornehm" | "zur�ckhaltend" | "knackig" | "griffig" | "markant"
	| "fruchtig"
;

attribut2:
	  "Strenge" | "Finesse" | "Kraft" | "Eleganz" | "Bodenst�ndigkeit"
	| "W�rze" | "Nat�rlichkeit" | "S�ure" | "Frucht"
;

neg-attr1: "mosig"|"dumpf"|"klebrig"|"s��lich"|"aufdringlich"|"holzig"
	| "mickrig"|"faulig"|"k�nstlich"
;

b:	"Abgang" | "Ansatz"
;

er:	"der Wein" | "er" | "der " $Rebsorte-v
;

aroma-akk:
	   ["verwelkte"|"frische"|""] " " ["Kirsch"|"Wiesen"|"Tulpen"] "bl�ten"
	 | ["frische"|"faulige"] " " ["Pferde"|"August"|"Herbst"] ["�pfel"|"beeren"]
;

aroma-dat:
	   ["verwelkten"|"frischen"|""] " " ["Kirsch"|"Wiesen"|"Tulpen"] "bl�ten"
	 | ["frischen"|"fauligen"] " " ["Pferde"|"August"|"Herbst"] ["�pfeln"|"beeren"]
;

boden:	["Granit"|"Lehm"|"Sand"|"Kalk"] "boden"
;

Fass:	["Eichen"|"Holz"|"Alu"|"Kupfer"|"Messing"]"fass"
;

Rebsorte: "Veltliner" | "Morio-Muskat"  | "Riesling" | "M�ller-Turgau"
	| "Kerner" | "Cabernet" | "Chauvignon" | "Merlot"
;

leicht:	"leicht" | "entfernt"
;

kraeftig: "kr�ftig" | "intensiv"
;
