/* $Id: bgh.pb,v 1.9 2007-11-15 01:41:03 cro Exp $
 *
 * $Log: bgh.pb,v $
 * Revision 1.9  2007-11-15 01:41:03  cro
 * gutachten.pb
 *
 * Revision 1.8  2007/10/16 17:49:59  cro
 * Kleine Aenderungen
 *
 * Revision 1.7  2007/09/25 22:13:10  cro
 * *** empty log message ***
 *
 * Revision 1.6  2007/09/24 19:49:08  cro
 * Latex schön formatiert. Noch ein paar Phrasen.
 *
 */
#include <stdmap.pbi>
#include <format.pbi>

beschluss:
	TITLE("Beschluß")
	PROLOGUE
#ifdef LATEX
	"\\usepackage[utf8]{inputenc}" BRK
	"\\usepackage[german]{babel}" BRK
	"\\frenchspacing\\sloppy" BRK
#endif
	BODY
	SECTION("Tenor")               tenor
	SECTION("Tatbestand")          tatbestand
	SECTION("Entscheidungsgründe") begruendung
	EPILOGUE
	   ;

/* Tenor */
tenor:
	"Die " rechtsmittel " gegen " ["das Urteil"|"den Beschluss"] " des "
	olg-senat " vom " datum " wird auf Kosten "
	["des Beklagten"|"der Staatskasse"|"des Klägers"] " zurückgewiesen."
	PBRK
	;

/* Tatbestand */
tatbestand:
	tatbestand-abs
	begruendung-tatsachen-abs+
	begruendung-abs
	;

tatbestand-abs:
	tatbestand1>upcase-first tatbestand2>upcase-first
	PBRK
	;

tatbestand1:
	"Die Parteien streiten um " streitpunkt ". "
	;

tatbestand2:
	partei " beruft sich dabei auf " streitpunkt ". "
	| partei " bestreitet " ["darüberhinaus "|"außerdem "|""]
	streitpunkt ". "
	;

/* Begründung */
begruendung:
	"Die Revision ist zulässig." PBRK
	jura-abs+
	"Die Revision ist auch begründet." PBRK
	jura-abs+
	"Aus diesen Gründen war der Revision stattzugeben." PBRK
	|
	"Die Revision ist nicht zulässig." PBRK
	jura-abs+
	;

begruendung-tatsachen-abs:
	[begruendung-tatsachen-phrasen PBRK]+
	;

begruendung-tatsachen-phrasen:
	[begruendung-tatsachen-phrase>upcase-first ". "]
	;

begruendung-tatsachen-phrase:
	partei " ist " ["Eigentümer"|"Besitzer"|"Mieter"] " " eigentum-gen
	| "Die Parteien haben am " datum " die Ehe geschlossen"
	| "Die Ehe der Parteien ist am " datum " geschieden worden"
	| "Die Parteien, aus deren Ehe " {=2..5} " "
	  ["minder"|"voll"] "jährige Kinder hervorgegangen sind, leben seit "
	  datum " dauernd getrennt"
	| partei " ist " ["zeitweise "|"halbtags "|"vormittags "|""]
	  "als " beruf [" mit einem Einkommen von " {=1000..3} " EUR"|""]
	  " tätig"
	| "das Einkommen " partei-gen " beträgt monatlich insgesamt "
	  {=(1..30)*100} " EUR"
	| "die Eltern " partei-gen " sind in einem Heim untergebracht"
	| "mit Anerkenntnis-Teilurteil vom " datum " wurde " partei-akk
	  " verurteilt, an " partei-akk " für die gemeinsamen Kinder ab " datum
	  " monatlich Unterhalt in Höhe von jeweils " {=200..500}
	  " EUR zu zahlen"
	| partei " betreibt " gewerbe-akk
	  " und bezieht daraus ein Einkommen von " ["jähr"|"monat"] "lich "
	  {=3000..10000} " EUR"
	| "auf Betreiben " partei-gen " wurde die Altersrente " partei-gen
	  " auf " {=20..80} " vom Hundert herabgesetzt"
	| partei " ist Inhaber des Sorgerechts"
	;

begruendung-abs:
	[begruendung-phrasen PBRK]
	;

begruendung-phrasen:
	[begruendung-phrase>upcase-first ". "]
	[begruendung-phrase>upcase-first ". "]
	;

begruendung-phrase:
	partei " " ["begehrt"|"beantragt"] " " begehr
	| partei " bestreitet " bestrittene-tatsache
	  [" mit Nichtwissen"|" unter Vorbringung o.a. Tatsachen"|""]
	;

jura-abs:
	[jura-phrasen PBRK]+
	;

jura-phrasen:
	[jura-phrase>upcase-first ". "]+
	;

jura-phrase:
	["in dieser Hinsicht"|"in diesem Sinne"] " folgt der Senat der "
	["Entscheidung"|"Argumentation"|"Beweisführung"] " "
	["der Vorinstanz"|partei-gen]
	[" nicht"|""]
	| "der Senat folgt " ["insofern"|"soweit"|"in dieser Hinsicht"] " "
	  ["der Vorinstanz"|"dem Oberlandesgericht"| partei-dat]
	  " und verweist auf " [paragraph|zitat]
	| ["anders als"|"wie"] " von der Vorinstanz "
	  ["angenommen"|"unterstellt"|"behauptet"] ", ist " ["jedoch " |""]
	  paragraph [" nicht"|""]
	   " einschlägig" ["; siehe dazu " kommentar|""]
	   ["; anders " kommentar|""] ["; so auch " kommentar|""]
	| "die Vorinstanz hat " ["die Einschlägigkeit"|"die Gültigkeit"]
	  " von " paragraph " "["bereits"|"jedoch"|"nicht"|""] " "
	  ["abschließend"|"zutreffend"|"unzutreffend"]
	  " beurteilt"
	| streitpunkt " ist " ["von der Vorinstanz"|"vom " olg-senat]
	  " " ["abschließend"|"vorläufig"|"bis auf Weiteres"] " geklärt"
	| "auch die Anwendung der " theorie " (" zitat
	  ") führt zu keinem anderen " ["Ergebnis"|"Resultat"]
	| "es ist hier dem "["Grundsatz"|"Prinzip"]" " lat-zitat " zu folgen"
	| "auch hier gilt "lat-zitat
	| "Nach h. M. gilt hier der Grundsatz " lat-zitat
	| "In Bezug auf " streitpunkt
	  " hat sich allerdings eine "["abweichende"|"differenzierte"
	  |"konkurrierende"]" h. M. gebildet; siehe jedoch "
	  autor " in " zitat
	| "Das Berufungsgericht, dessen Entscheidung in " zeitschriften-ref
	  " veröffentlicht ist, hat die Revision wegen der Frage zugelassen,"
	" ob " streitpunkt " " ["angemessen"|"zulässig"] " ist"
	| "der Senat folgt hier " ["dem Grundsatz " lat-zitat|"der " theorie]
	| ["hier"|"doch"] " kann " ["der Vorinstanz"|"dem Vorbringen " partei]
	  " nicht ohne weiteres gefolgt werden"
	| "Soweit dem Urteil vom " datum " (veröffentlicht in "
	  zeitschriften-ref ") "
	  " anderes entnommen werden könnte, hält der Senat daran nicht fest"
	| ["daneben"|"auch"|"in diesem Zusammenhang"]" ist "
	  ["regelmäßig"|"in der Regel"|"grundsätzlich"]
	  " "["zusätzlich"|"konkurrierend"|""]" der " grundsatz
	  " "["zu beachten"|"zu betrachten"|"abzuwägen"
	     |"in Betracht zu ziehen"]
	  ". In "["beiderlei"|"dieser"]" Hinsicht gibt der vorliegende"
	  " Fall aber keinen Anlass zu "
	  ["Bedenken"|"einer anderen Betrachtung"|"einer anderen Wertung"]
	| "ob Idealkonkurrenz zwischen " paragraph " und " paragraph
	  " anzunehmen ist, mag dahingestellt sein"
	| "der Senat knüpft hier an die " theorie " an ("
	  ["zustimmend"|"anders"] ": " autor " in " zitat ")"
	| "ob die Frage " ["materielles"|"ideelles"]
	  " Recht betrifft, hatte der Senat nicht zu entscheiden"
	| "Dabei ist der Erlass "["eines Teilurteils"
	  |"einer einstweiligen Anordnung"]" "["bereits"|"sogar"|"auch"]" "
	   ["dann"|"in dem Fall"]" "
	  "unzulässig, wenn sich die Gefahr durch die abweichende"
	  " Beurteilung eines Rechtsmittelgerichts im Instanzenzug ergeben"
	  " kann"["; zustimmend: " zitat|""]["; anders: " zitat|""]
	| "Nach " ["h. M. "|"ständiger Rechtsprechung des Bundesgerichtshofs "]
	   ["ist eine Beschränkung der Revisionszulassung nur möglich, "
	     ["wenn dadurch der Grundsatz " lat-zitat " nicht verletzt wird"
	      | "wenn dadurch keine anderen Rechte verletzt werden"]
	    | "kann die Revision nur ausgeschlossen werden, wenn sich aus "
	      paragraph " nichts anderes ergibt"]
	| "dies wurde von der Revision nicht angegriffen"
	| "die " ["Erst"|"Vor"]"instanz hat " streitpunkt
	  [" sehr wohl anerkannt"|" allerdings verkannt"]
	| "nach "["ständiger Rechtsprechung des Senats"|"h. M."]
	  " steht " streitpunkt
	  " nicht "["im Widerspruch zu der Subsumption unter " streitpunkt
	  |"in Konkurrenz zu " streitpunkt]
	| "in steuerlicher Hinsicht ist " streitpunkt " nach " paragraph
	  " zu behandeln"
        | ["jedoch"|"in jedem Fall"] " ist die " streitpunkt " an " streitpunkt
	  " anzu" ["lehnen"|"passen"] ", um "
	  ["unbillige"|"unzumutbare"|"übergroße"]
	  " Härten zu vermeiden"
	| ["der Grundsatz " lat-zitat|"Der "grundsatz] " des "
	  antik"en Rechts hat sich zu "
	  lat-zitat " im "["modernen"|"neuzeitlichen"|"bürgerlichen"]
	  " " rechtsgebiet-neutr " weiterentwickelt"
	| ["die Rechtsprechnung"|"der BGH"|"die Litaratur"] " hat in Bezug"
	  " auf "
	  streitpunkt " eine h. M. entwickelt; "
	  " anders allerdings " zitat ", wo der " theorie " gefolgt wird"
	| "der Grundsatz " lat-zitat " führt nicht zu einer anderen"
	  " Beurteilung"
	| "für die hier zu entscheidende Frage -- " streitpunkt " -- ist "
	  [streitpunkt|" die " theorie] " " ["ohne Belang"|"nicht relevant"
	  |"von entscheidender Bedeutung"]
	| "die Rechtswidrigkeit " ["des Vorgehens des Antragsgegners"
	  |"der angegriffenen Entscheidung"|"der Weigerung des Antragsgegners"]
	   " ergibt sich nicht schon aus der " theorie
	| "die Stellungnahme " partei-gen " zu diesem Hinweis gibt keinen"
	  " Anlass, die grundsätzliche Bedeutung der Rechtssache zu bejahen"
	| "diese Ausführungen halten der rechtlichen Nachprüfung nicht stand"
	| "das ergibt sich schon aus dem Wortlaut der Bestimmung des "
	  paragraph
	| "auch " ["Sinn und Zweck"|"die Entstehungsumstände"]
	  " der "["Vorschrift"|"Regelung"]" des " paragraph " "
 	  ["fordern"|"weisen hin auf"|"implizieren"] " " streitpunkt
	  " in Zusammenhang mit " streitpunkt
	| "diese Voraussetzungen sind "
	  ["vorliegend"|"in diesem Falle"|"in Anknüpfung an " paragraph]
	  " gegeben; auch steht " streitpunkt " in "["keinem "|"engem "|""]
	  "Zusammenhang mit der "["vor"|"nach"|""]"ehelichen "
	  ["Wirtschafts"|"Haushalts"]"gemeinschaft"
	| "eine Verletzung " ["von Rechten mit Verfassungsrang"
	  |"von europäischem Recht"|"von Verfassungsrecht"|"des "
	   grundsatz"es"] " ist nicht " ["ersichtlich"|"vorgetragen worden"
	   |"gegeben"]
	;

/* Feminim, so daß Nominativ und Akkusativ gleich sind. */
streitpunkt:
	"die " ["Höhe"|"Anrechenbarkeit"|"Absetzbarkeit"|"Billigkeit"]
	" des dem Kläger "
        ["zustehenden"|"zu zahlenden"|"zu streichenden"|"anzurechnenden"]
	" " ["vorehelichen"|"nachehelichen"|"außerehelichen"|"vorläufigen"
	 |"materiellen"|"fiktiven"]
	" " ["Altersvorsorge"|"Ehegatten"|"Kindes"|"Verwandten"]
	["unterhalts"|"einkommens"|"ausgleichs"]
	;

rechtsmittel:
	"Beschwerde" | "Revision" | "Berufung"
	;

begehr:
	"die Zurückweisung der " rechtsmittel
	| "Aufhebung der Entscheidung des Oberlandesgerichts"
	;

bestrittene-tatsache:
	"das"
	| " die Rechtsanhängigkeit"
	| " diese Tatsache"
	;

eigentum-gen:
	["eines"|"des"] " "
	["Hauses"|"Grundstückes"|"Kraftfahrzeuges"|"Fernsehgerätes"]
	[" im Werte von " {=(10..100)*1000} " EUR"]
	;

olg-senat:
	{=1..12} ". Senats des Oberlandesgerichts " olg-stadt
	;

olg-stadt:
	"München"|"Nürnberg"|"Lüneburg"|"Celle"|"Schleswig"
	;

partei:
	"der Kläger" | "der Beklagte"
	;

partei-gen:
	"des Klägers" | "des Beklagten"
	;

partei-akk:
	"den Kläger" | "den Beklagten"
	;

partei-dat:
	"dem Kläger" | "dem Beklagten"
	;

beruf:
	"Müllmann" | "Richter" | "Stabsunteroffizier" | "Justizwachtmeister"
	;

antik:
	"griechisch"|"phönizisch"|"römisch"|"germanisch"|"keltisch"
	;

gewerbe-akk:
	"ein Bordell"|"eine Müllkippe"|"eine Tätowierstube"|"eine Bierstube"
	;

datum:
	{=1..28} "." {=1..12} "." {=1980+(0..17)}
	;

paragraph:
	"§ " {=10..1000} " " ["BGB"|"ZPO"|"FGG"]
	;

zitat:
	artikel " in " zeitschriften-ref | kommentar
	;

zeitschrift:
#ifdef LATEX
        "\\glqq{}"
#else
	"\""
#endif
	["FamRZ" | "Zeitschr. f. d. ges. brgl. Recht"|"Der Hausjurist"
	 |"Neue Juristische Wochenschrift"|"NJW"
	 |["Zeit"|"Monats"|"Wochen"] "schrift für das " rechtsgebiet-neutr
	]
#ifdef LATEX
        "\\grqq{}"
#else
	"\""
#endif
	;

zeitschriften-ref:
	zeitschrift [" v. " datum|" " {=1..52}"/"{=1980..2007}]
	;

artikel:
#ifdef LATEX
        "\\glqq{}"
#else
	"\""
#endif
	["Die Ehe und ihr Ende"
	 | "Das " ["Konkurrenz"|"Prioritäts"|"Subsumptions"]"verhältnis von "
	   [theorie|schlagwort] " und " [theorie|schlagwort]
	   [" in der Rechtsprechung des BGH"|" im deutschen "rechtsgebiet-neutr|""]
	 | "Die " theorie " im " rechtsgebiet-neutr
	 | "Die Unmöglichkeit von " schlagwort " bei " schlagwort
	 | rechtsgebiet-neutr " und " schlagwort
	]
#ifdef LATEX
        "\\grqq{}"
#else
	"\""
#endif
	;

kommentar:
#ifdef LATEX
        "\\glqq{}"
#else
	"\""
#endif
	["Schönke-Schröder " rechtsgebiet-neutr
	 | autor " / " autor " / " autor " " rechtsgebiet-neutr
	 | autor " u.a. " rechtsgebiet-neutr
	 | autor " / " autor " / " autor " Anwaltskommentar"
	]
#ifdef LATEX
        "\\grqq{}"
#else
	"\""
#endif
	" zu " paragraph " Rn " {=5..100}
	;

autor:
	"Justus"|"Carolus"|"Kleinreich"|"Nödel"|"Kaiser"|"Schnitzler"
	|"Friederici"|"Schürmann"|"Weinreich"|"Klein"
	| ["v. "|""] ["Wede"|"Knoll"|"Kraxl"|"Schür"]["meier"|"mann"|"müller"]
	;

rechtsgebiet-neutr:
	["Familien"|"Zivil"|"Verkehrs"|"Sozial"|"Ehe"|"Erb"|"Sachen"|"Schuld"]
	"recht"
	;

theorie:
	["Mittelbarkeits"|"Zumutbarkeits"|"Wesentlichkeits"|"Vorrang"
	 |"Komplexitäts"|"Konformitäts"|"Restitutions"]
	 "theorie"
	;

grundsatz:
	["Halbteilungs"|"Subsidiaritäts"|"Konformitäts"|"Prioritäts"
	 |"Paritäts"|"Spezialisierungs"|"Realisierungs"]
	"grundsatz"
	;

lat-zitat:
#ifdef LATEX
        "\\textit{"
#else
	"\""
#endif
	["in dubio pro reo"|"quod licet jovi non licet bovi"|"non sequitur"
	 |"alea iacta est"|"summa cum laude"|"aliquid semper haeret"
	 |"manus manum lavat"|"do ut des"|"quid pro quo"
	 |"de gustibus non est disputandum"|"homo homini lupus est"
	 |"mundus vult decipi"|"ceterum censeo"|"qui tacet, fatetur"]
#ifdef LATEX
        "}"
#else
	"\""
#endif
	;

schlagwort:
	["Identität"|"Priorität"|"Subsumption"|"Kontinuität"]
	;
