#include <stdmap.pbi>

Weinkritik:
	[Weinkritik-deutsch | Weinkritik-international]
;

Weinkritik-deutsch:
	// Rebsorte ist etwas wie Riesling oder Rioja. Immer maskulin.
	?Rebsorte-v = Rebsorte-dt

	// Bezeichnung des Weins. Etwas wie "Kitzinger Ochsenbrunnen" für
	// deutsche Weine.
	wein = Deutscher-Wein ": "
	[satz>upcase-first ". "]+
	Passt-zu
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

Deutscher-Wein:	ort "er " lage1 lage2
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

Rebsorte-dt: "Veltliner" | "Morio-Muskat"  | "Riesling" | "Müller-Turgau"
	| "Kerner" | "Cabernet" | "Chauvignon" | "Merlot"
;

leicht:	"leicht" | "entfernt"
;

kraeftig: "kräftig" | "intensiv"
;

Weinkritik-international:
	// Rebsorte ist etwas wie Riesling oder Rioja. Immer maskulin.
	?Rebsorte-v = Rebsorte-int

	// Verwendet in Floskeln wie "der Rioja"
	?wein = $Rebsorte-v
	Intro
	Bouquet
	Bouquet-Nachsatz
	Passt-zu
;

Intro: "Ein "Charakteristik-m" "$Rebsorte-v" "Phrase-Ursprung ". "
;

Passt-zu: "Ein "Wein-oder-Rebsorte", der zu "Speisen" passt." |
	  "Ein "Wein-oder-Rebsorte", den Sie am besten mit "Speisen" genießen." |
	  "Dieser "Wein-oder-Rebsorte" passt "hervorragend" zu "Speisen". " |
	  "Dieser "Wein-oder-Rebsorte" harmoniert "hervorragend" mit "Speisen". " |
	  "Diesen "Wein-oder-Rebsorte" "["serviert"|"reicht"]" man am besten zu "Speisen". "
;

Wein-oder-Rebsorte: "Wein" | "Tropfen" | $Rebsorte-v
;

Bouquet: Bouquet1 | Bouquet2 | Bouquet3 | Bouquet4
;

Bouquet1: "Das "herrlich" "Bouquet-Char" Bouquet mit "Fruechte Hauch
	 " "["überzeugt" | "gefällt"] " "["ebenso" | "genauso"]" wie der "
	 ["fruchtbetonte" | "perlende" | "kratzende" | "moussierende" |
	 "aufreizende" | "kitzelnde"]", mit großem Trinkfluss und "
	 "jeder Menge Frische ausgestattete Auftritt am Gaumen. "
;

Bouquet2: ["Am Gaumen"|"In der Nase"]" mit "["großer"|"feiner"]" "
	  ["Balance"|"Wucht"|"Fülle"]
	  ", wiederum mit einem ganzen "["Korb"|"Potpourri"]" voller "
	  ["Früchte"|"Aromen"|"Aromanoten"]", sehr fruchtig, saftig, süffig. "
;

Bouquet3: ["Dieser Wein"|"Diese Cuvée"|"Dieser "$Rebsorte-v]" verbindet auf "
	  ["überzeugende"|"gelungene"|"überraschende"|"vorbildliche"]
	  " Weise das "["Säuerliche"|"Prickelnde"|"Aromatische"|"Duftige"]
	  " eines guten "Rebsorte-int" mit "
	  ["der Durchsetzungskraft"|"der Raffinesse"|"dem Comme-il-faut"]
	  " eines "Rebsorte-int" und weiß damit "
	  ["am Gaumen zu gefallen"|"dem Gaumen zu schmeicheln"]". "
;

Bouquet4: ["Sortenypische"|"Lagentypische"]" "[" und doch" | "aber" | "und zugleich"]" "
	  interessante" Note von "Note". "
;

Bouquet-Nachsatz:
	["Sein "Charakteristik-m" Charakter "|"Seine "["durchaus "|""]interessante" Note "]
	["entwickelt sich"|"wird gefördert"|"entsteht"]" durch "
	[
	  ["die Reifung"|"den Ausbau"]" im "["Barrique"|"Eichenholzfass"]
	    |"den Anbau auf "["vulkanischem"|"moorigem"|"sandigem"]" "
	      ["Boden"|"Untergrund"]
	    | "das "["milde"|"raue"|"günstige"|"regnerische"]" Klima"
          | "die Lagerung "["in alten Benzinfässern"|"in Ziegenställen"|
	    "in Kohlenkellern"|"in Plastikkanistern"]
	]
	". "
;

Charakteristik-m: "fruchtig-frischer" | "leichter" | "rubinroter" |
		  "klassischer" | "erlesener" | "goldperlender"
;

Bouquet-Char: ["funkelnde" | "spritzige"] | ""
	      ["saftig" | "säuerlich"]"-"["fruchtige" | "cremige"]
;

Rebsorte-int: "Verdicchio" | "Orvieto" | "Rioja" | "Chardonnay" | "Zweigelt" |
	"Primitivo" | "Barolo" | "Nebbiolo" | "Bardolino" | "Barbera" |
	"Lugana" | "Müller-Thurgau" | "Domina" | "Rioja" | "Primitivo" |
	"Orvieto" | "Riesling" | "Nero d'Avola" | "Imiglykos"
;

Phrase-Ursprung: "aus dem " Herkunft-m | "aus der " Herkunft-f |
		 "aus den " Herkunft-pl
;

Herkunft-m: ["Rhein" | "Mosel" | "Loire" | "Main" | "Aosta"]"tal" | "Burgund"
;

Herkunft-f:
	"Toskana" | "Emilia Romagna" | "Bretagne" |
	["klassischen"|"berühmten" | "weltbekannten"]
	" Demonisazione di Origine Controllata " DOC |
	["klassischen"|"berühmten"]" Denominación Cariñena " DOC |
	"Gegend um "Stadt | "Region "Region
;

Herkunft-pl: 
	["Weinbergen" | "Hängen"]" um "Stadt
;

DOC: DOC1" di "DOC2 | DOC1" "DOC3
;

DOC1: "Castelli"|"Castello"|"Monte"|"Valle";
DOC2: "Jesi"|"Adige"|"Pompones";
DOC3: "quebrado"|"pomponese";

Stadt: "Rom" | "Milano" | "Torino" | "Neapel" | "Würzburg" | "Kitzingen"
;

Region: "Südtirol" | "Burgund" | "Lazio" | "Piemont"
;

Speisen: Speise | Speise" und "Speise | Speise", "Speise" und "Speise
;

Speise: "Pommes mit Ketchup" | "Salaten" | "Wild" | "Seefisch" | "Forellen" |
	"Fischstäbchen" | ["Kalb"|"Schweine"]"fleisch" | "Loup de mer" |
	"Dorade" | "Rotbarschfilet" | "Schlemmerfilet" | "Karpfen" |
	"Rôti de pommes" | "Folienkartoffeln" | ["Pilz"|"Spargel"]"risotto" |
	"Spargel"
;

hervorragend: "hervorragend" | "exzellent" | "ausgezeichnet" | "am besten"
;

herrlich: "herrlich" | "großartig" | "wunderbar"
;

interessante: "interessante" | "überraschende" | "animalische"
;

Fruechte: Frucht | Frucht" und "Frucht | Frucht", "Frucht" und "Frucht
;

Frucht: "Stachelbeere" | "Maracuja" | "Kirsche" | "Grapefruit" | "Zitrus" |
	"Blumenkohl" | "Anis" | "Apfel" | "Birne" | "Vanille" | "Essig" |
	"Mandel" | "Erdnuss" | "Hering"
;

Hauch: "" | " und einem Hauch "Frucht
;

Note: Note1 | Note1" und "Note1
;

Note1: "Karamell" | "Wildbeere" | "Wildkirsche" | "Eichenholz" | "Tannin"
       | "Sperrholz" | "Broccoli" | "Schuhcreme" | "grünen Bohnen"
       | "Curry" | "Pfifferlingen"
;
