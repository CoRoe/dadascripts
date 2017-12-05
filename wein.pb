#include <stdmap.pbi>

verdikt:
	?Rebsorte-v = Rebsorte
	wein ": "
	[satz>upcase-first ". "]+
;

satz:
	  attribut1 " und " attribut1 ", aber schon das ganze Potential"
	  " andeutend, gelingt der " ["Spagat"|"Kompromiß"] " zwischen "
	   attribut2 " und " attribut2
	| "ein Wein: " attribut1 " und " attribut1 ", aber auch mit "
	  attribut2 " ausgestattet"
	| "Der Abgang ist mit einer angenehmen, animierenden " attribut2
	  " umgeben"
	| "Ein " $Rebsorte-v " mit einer " ["gebiets"|"boden"|"sorten"] 
	 "typischen " attribut2
	| er " verströmt ein " [leicht|kraeftig] "es " aroma-akk "aroma"
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
	| "weder " neg-attr1 " noch " neg-attr1 ", überzeugt " er " durch "
	  attribut2 " und " attribut2
	| "In keiner Weise " neg-attr1 ", weiß " er " durch " attribut2
	  [" und "|" verbunden mit "]
	  attribut2 " zu " ["gewinnen"|"überzeugen"|"gefallen"]
;

wein:	ort "er " lage1 lage2
;

ort:	"Kitzing" | ort1 ort2
;

ort1:	"Hohen" | "Dinkels" | "Nerven" | "Gunzen" | "Käs" | "Ochsen"
;

ort2:	"heim" | "hausen" | "weil" | "ach" | "kirch"
;

lage1:	"Katzen" | "Hamster" | "Sonnen" | "Mönchs"| "Frosch" | "Dudel"
	| "Scheiß" | "Woschd" 
;

lage2:	  "brunnen" | "feld" | "acker" | "tröpfchen" | "tropfen" | "grube"
	| "blut"
;

attribut1: "erdig" | "kräftig" | "nobel" | "fein" | "blumig" | "süffig"
	| "vornehm" | "zurückhaltend" | "knackig" | "griffig" | "markant"
	| "fruchtig"
;

attribut2:
	  "Strenge" | "Finesse" | "Kraft" | "Eleganz" | "Bodenständigkeit"
	| "Würze" | "Natürlichkeit" | "Säure" | "Frucht"
;

neg-attr1: "mosig"|"dumpf"|"klebrig"|"süßlich"|"aufdringlich"|"holzig"
	| "mickrig"|"faulig"|"künstlich"
;

b:	"Abgang" | "Ansatz"
;

er:	"der Wein" | "er" | "der " $Rebsorte-v
;

aroma-akk:
	   ["verwelkte"|"frische"|""] " " ["Kirsch"|"Wiesen"|"Tulpen"] "blüten"
	 | ["frische"|"faulige"] " " ["Pferde"|"August"|"Herbst"] ["äpfel"|"beeren"]
;

aroma-dat:
	   ["verwelkten"|"frischen"|""] " " ["Kirsch"|"Wiesen"|"Tulpen"] "blüten"
	 | ["frischen"|"fauligen"] " " ["Pferde"|"August"|"Herbst"] ["äpfeln"|"beeren"]
;

boden:	["Granit"|"Lehm"|"Sand"|"Kalk"] "boden"
;

Fass:	["Eichen"|"Holz"|"Alu"|"Kupfer"|"Messing"]"fass"
;

Rebsorte: "Veltliner" | "Morio-Muskat"  | "Riesling" | "Müller-Turgau"
	| "Kerner" | "Cabernet" | "Chauvignon" | "Merlot"
;

leicht:	"leicht" | "entfernt"
;

kraeftig: "kräftig" | "intensiv"
;
