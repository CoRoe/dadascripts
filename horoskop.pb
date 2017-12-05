/* $Id: horoskop.pb,v 1.5 2007-11-15 01:41:03 cro Exp $
 *
 * $Log: horoskop.pb,v $
 * Revision 1.5  2007-11-15 01:41:03  cro
 * gutachten.pb
 *
 * Revision 1.4  2007/10/27 17:38:52  cro
 * *** empty log message ***
 *
 * Revision 1.3  2007/10/06 18:45:09  cro
 * *** empty log message ***
 *
 * Revision 1.2  2007/10/03 17:18:17  cro
 * *** empty log message ***
 *
 */

#include <stdmap.pbi>
#include <format.pbi>

Monatshoroskop:
	TITLE("Horoskop")
	PROLOGUE
#ifdef LATEX
	"\\usepackage[utf8]{inputenc}" BRK
	"\\usepackage[german]{babel}" BRK
	"\\frenchspacing\\sloppy" BRK
#endif
	BODY
	SECTION(Sternbild)
	Horoskop-Liebe PBRK
	Horoskop-Beruf PBRK
	Horoskop-Gesundheit PBRK
	EPILOGUE
;


Sternbild: "Widder"|"Stier"|"Zwillinge"|"Krebs"|"Löwe"|"Jungfrau"
	   |"Waage"|"Skorpion"|"Schütze"|"Steinbock"|"Wassermann"|"Fische"
;


Horoskop-Liebe:
	"Liebe und Partnerschaft: " BRK
	/*[
	 [Liebe1 ". "]>upcase-first
	 [Liebe2 ". "]>upcase-first+
	 ]
	|*/ [Sterne-stehen-gut-schlecht ": "]>upcase-first
	  [Sterne-stehen-in-Konstellation ". "]>upcase-first
	  [Tip-zur-Liebe ". "]>upcase-first+
          /*[Vermeiden-Sie ". "]>upcase-first*/
	  [Nicht-verzagen ". "]>upcase-first
;

Horoskop-Beruf:
	"Berufliches: " BRK
	[[Schlechte-Aussicht-Beruf
	 | Schlechte-Aussicht
	 | Sterne-stehen-gut-schlecht]": "
	   Sterne-stehen-in-Konstellation". "]>upcase-first
	[Tip-zum-Beruf ". "]>upcase-first+
	[Nicht-verzagen ". "]>upcase-first
;

Horoskop-Gesundheit:
	"Gesundheit:" BRK
        /*[Gesundheit1 ". "]>upcase-first
	  [Gesundheit2 ". "]>upcase-first+*/
          [Schlechte-Aussicht ". "]>upcase-first
          [Tip-zur-Gesundheit ". "]>upcase-first+
	  [Nicht-verzagen ". "]>upcase-first
;

Liebe1:
	Man-meint-es-gut | Nicht-verzagen | Gute-Aussicht | Schlechte-Aussicht
;

Liebe2:
	[Rat-nicht-ignorieren | Rat-folgen | Rat-annehmen] ["; "Gut-gemeint|""]
;

Gesundheit1:
	Nicht-verzagen | Gute-Aussicht | Schlechte-Aussicht
;

Gesundheit2:
	Untersuchung-pl
	 " könnten jetzt interessant werden, da "
	["jegliche"|"alle"|""]" "Therapie-pl" momentan sehr gut einschlagen"
	["Nutzen Sie jetzt die günstige Zeit, um vorhandene Leiden therapieren zu lassen"]
;

Man-meint-es-gut:
	["die Götter"|"ihre Freunde"] " " ["meinen es gut mit Ihnen"
	 |"sind Ihnen wohlgesonnen"|"stehen auf Ihrer Seite"]
	| ["das Schicksal"|"der Himmel"] " " ["meint es gut mit Ihnen"
	 |"ist Ihnen wohlgesonnen"|"lacht Ihnen"|"steht auf Ihrer Seite"]
;

Rat-nicht-ignorieren:
	"einen "["guten"|"wohlgemeinten"|""]" Rat"
	[", der Ihnen gegeben wurde,"|" eines Freundes"|" eines Kollegen"]
	" sollten Sie nicht "["so ohne weiteres"|"von vornherein"] " "
	["abtun"|"ignorieren"|"von sich weisen"]
;

Rat-folgen:
	"folgen Sie dem "["guten"|"wohlgemeinten"|"besonnenen"|"klugen"|""]
	" Rat "
	["eines Freundes"|"eines Kollegen"|"Ihres Arztes"|"Ihres Steuerberaters"]
;

Rat-annehmen:
	["ein Freund"|"Ihr Chef"|"ihr Arzt"|"Ihr Psychotherapeut"]
	 " macht sich Gedanken um Sie und will nur Ihr Bestes"
;

Gut-gemeint:
	"es ist nur gut gemeinte Kritik. Nehmen Sie sie an"
	| "er steht zu Ihnen. Freuen Sie sich darüber"
;

Nicht-verzagen:
	["verzagen Sie nicht"|"Grämen Sie sich nicht"|"keine Angst"
	  |"verzweifeln Sie nicht"|"keine Panik"
	  |"werfen Sie nicht die Flinte ins Korn"] ", "
	  ["die Wogen werden sich bald wieder glätten und "
	  ["harmonischere"|"glücklichere"|"bessere"|"coolere"]" Zeiten kommen"
	  | "Ihre "Frau" wird Ihren " Auto-mas
           " schon nicht "["zu Schrott"|"zu Brei"|"in Klump"|"kaputt"]
	   " fahren"]
	| ["manches"|"vieles"|"die Frauen"|"die Männer"|"die Ärzte"|"Kollegen"
	   |"die Welt"|"Horoskope"]
          " " ["kann man nicht ändern"]
	  ", "["locker"|"cool"|"Mensch"]" bleiben"
;

Gute-Aussicht:
	"gute Aussichten"|"die Sonne geht auf"
;

Schlechte-Aussicht:
	["es"|"am Himmel"|"über Ihnen"]" "
        ["brauen sich dunkle Wolken"|"braut sich ein Gewitter"]" zusammen"
	| "ist Ihnen eine schwarze Katze über den Weg gelaufen?"
	| "in letzter Zeit läuft wirklich nicht immer alles glatt"
;

Schlechte-Aussicht-Beruf:
	"ein Kompott wird geschmiedet von "["Leuten"|"Personen"]", die "
	 ["Ihnen nahestehen"|"Ihnen übelwollen"|"an Ihr Geld wollen"]
;

Auto-mas: "Porsche"|"Mercedes"|"Golf"|"BMW"|"Lamborghini"|"Fiat"|"Polo"|
    "Passat"|"Audi"
;

Sterne-stehen-gut-schlecht:
	"die " Himmelskoerper-pl " stehen "["günstig"|"ungünstig"]
	| "die " Himmelskoerper-pl " sind "["Ihnen "|""]["günstig"|"ungünstig"]
	| "die " Himmelskoerper-pl " zeigen " Harmonie " an"
	| "die " Himmelskoerper-pl " deuten auf " Harmonie
;

Sterne-stehen-in-Konstellation:
	Himmelskoerper " und " Himmelskoerper " "
	["stehen"|"sind"|"befinden sich"] " in " Konstellation
;

Vermeiden-Sie:
	"vermeiden Sie " Zeitpunkt " "["jegliche"|"alle"] " " Taetigkeit-pl
        | Zeitpunkt " könnten " Taetigkeit-pl " "
          ["fehlschlagen"|"ungünstig enden"]
        | "verschieben Sie " ["alle"|"jegliche"] " " Taetigkeit-pl " auf "
          Zeitpunkt-Zukunft-akk
;

Tip-zur-Liebe:
        "Ihnen steht eine neue " Liebe " bevor"
        | Zeitpunkt " stehen die " Himmelskoerper-pl " gut für eine neue "
          Liebe
        | "Ihnen droht " Zeitpunkt " " Aerger " mit einer "
          ["geliebten"|"nahestehenden"] " Person"
        | "öffnen Sie sich " Zeitpunkt " für eine neue " Liebe
        | Himmelskoerper " weist auf eine neue " Liebe " hin"
        | Zeitpunkt " sind Sie zwischen Ihrer " Frau " und Ihrer " Frau
          " hin- und hergerissen"
        | Himmelskoerper " beeinflußt die " Liebe " "["positiv"|"negativ"]
        | "lassen Sie sich " Zeitpunkt " von Ihren Gefühlen leiten"
        | "Ihre Gefühle "["lügen"|"trügen"] " nicht"
        | Zeitpunkt " läßt " Himmelskoerper " Ihre " Liebe " unter einem "
          ["guten"|"schlechten"] " " ["Stern"|"Vorzeichen"] " stehen"
        | Sternbild"-Menschen meinen es "["gut"|"schlecht"] " mit Ihnen"
;

Tip-zum-Beruf:
	/*["Hüten Sie sich"|"Nehmen Sie sich in acht"]*/
	"vermeiden Sie es "Zeitpunkt", "
	  ["Ihren Chef"|"Ihre Kollegen"|"die Frau Ihres Chefs"]
	  " zu "["beleidigen"|"schlagen"|"kritisieren"]
;

Tip-zur-Gesundheit:
	["Medizinische Fragen"|"Röntgenuntersuchungen"|"Blutuntersuchungen"]
	 " "["könnten jetzt interessant werden"|"sind das Gebot der Stunde"]
         ", da "
	["jegliche Heilungsmethoden"|"Therapien"|"Operationen"]" "Zeitpunkt
          " "["sehr gut anschlagen"|"unter einem guten Stern stehen"]
        | "Nehmen Sie " Zeitpunkt " Rücksicht auf "
	  ["Ihre "Organ-fem|"Ihr " Organ-neu|"Ihre "Organ-pl]
        | ["Nutzen Sie "["die Zeit"|"diese Woche"|"Ihren Urlaub"
          |"den frühen Morgen"|"den Tag"|"die Abwesenheit Ihres Partners"]
	   ", um "["vorhandene Leiden"|"Ihr "Organ-neu|"Ihre "Organ-pl
	  |"Ihre Pickel"|"Ihre Schuppen"|"Ihre Plattfüße"|"Ihre Schweißfüße"]
	   " "["therapieren"|"behandeln"]" zu lassen"]
        | Himmelskoerper " beeinflußt "["Ihre "Organ-fem|"Ihr "Organ-neu]
          " "Zeitpunkt" "["positiv"|"negativ"]
        | "unterschätzen Sie nicht den Einfluß von "Himmelskoerper " auf "
          ["Ihre "Organ-fem|"Ihr "Organ-neu|"Ihre Krankenkasse"]
        | "die "Konstellation" von "Himmelskoerper" und "Himmelskoerper
          " "["verursacht eine "|"führt zu einer "]
          ["Disharmonie"|"Fehlbalance"]" "
          ["Ihres Körpers"|"Ihrer Säfte"|"Ihrer Hormone"|"Ihres Befindens"]
        | "verschieben Sie "Untersuchung-pl" auf "Zeitpunkt-Zukunft-akk
        | Himmelskoerper " sorgt " Zeitpunkt " für Ihr Wohlbefinden"
;

Konstellation: "Opposition"|"Konjunktion"|"Disposition"|"Konjunktur"
;

Himmelskoerper:
	"Venus"|"Merkur"|"Saturn"|"Jupiter"|"Neptun"|"Uranus"|"Piräus"
;

Himmelskoerper-pl:
	"Sterne"|"Planeten"
;

/* xxxx ist ... */
Zeitpunkt:
	"jetzt"|"heute"|"morgen"|"übermorgen"|"in den nächsten Tagen"
	|["am Anfang"|"am Ende"|"in den ersten Tagen"|"in den letzten Tagen"]
	" "["der Woche"|"des Monats"]
;

Harmonie: "Harmonie"|"Zwietracht"|"Disharmonie"|"Konflikte"
;

/* Verschieben Sie ... auf xxx */
Zeitpunkt-akk:
	"jetzt"|"heute"|Zeitpunkt-Zukunft-akk
;

Zeitpunkt-Zukunft-akk:
	"morgen"|"übermorgen"
	|["den Anfang"|"das Ende"|"die ersten Tage"|"die letzten Tage"]
	 " "["der Woche"|"des Monats"]
;

Taetigkeit-pl:
	"Anstrengungen"|"Abiturprüfungen"|"Einkäufe"
;

Untersuchung-pl: "die Ausstellung von Rezepten"|"Aderlässe"|"Blutabnahmen"
	|"Röntgenuntersuchungen"
;

Therapie-pl: "Therapien"|"Heilungsmethoden"
;

Liebe: "Liebe"|"Partnerschaft"|"Beziehung"|"Beziehungskiste"|"Ehe"
;

Aerger:  "Verdruß"|"Streit"|"Zoff"|"Disharmonie"
;

Frau:    "Frau"|"Partnerin"|"Sekretärin"|"Kollegin"|"Friseuse"|"Therapeutin"
;

Organ-neu: "Herz"|"Bein"|"Gehirn"
;

Organ-fem: "Leber"|"Lunge"|"Arthrose"|"Zirbeldrüse"|"Prostata"
;

Organ-pl: "Bronchien"|"Ohren"|"Augen"|"Trommelfelle"|"Waden"|"Füße"|"Gelenke"
	|"Nieren"|"Nebennieren"
;
