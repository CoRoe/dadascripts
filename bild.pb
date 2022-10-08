#include <format.pbi>

Artikel: Protagonist Protagonist2
	 Ueberschrift PBRK
	 Einleitung
	 Floskel
;

Ueberschrift:
	$Name": Wurde der "Schosstier" "["vergiftet"|"entführt"]"?" |
	$Name": Dunkle Wolken über der Ehe?" |
	$Name": Ist "$er-sie" pleite?" |
	$Name": Wer hält noch zu "$ihm-ihr"?" |
	"Hat "$Name" es übertrieben?" |
	$Name": Peinliche Facebook-Fotos" |
	$Name": Trennt "$er-sie" sich von "$Partner"?"
;

Einleitung:
	["Tägliche Besuche von "weibl-vorname": " |
	["Immer wieder teure "Juwelen" von "maennl-vorname". "]]

	[["Viele "|""]Beobachter" haben es kommen sehen. " |
	"Es musste ja so kommen. " |
	"Es war abzusehen. " |
	"Es ist keine Überraschung. " |
	"Viele "Beobachter" hatten so etwas vermutet. " |
	"Es hat niemanden überrascht. "]
;

Floskel:
	"In der Ehe mit "$Partner" "
	    	["knallte es immer wieder"|"flogen die Fetzen"]". " |
	"Immer wieder wurde "$er-sie" mit "weibl-vorname" in "Ort" gesehen. "
	       ["Wo war "Ehemeann-Frau" "$Partner | "Musste "$Ehemann-Frau" "$Partner" zu Hause bleiben"]"? " |
	"Liebt "$Name" den neuen Ferrari mehr als "$Partner"? "
;

Protagonist: [
	?Vorname << weibl-vorname
	?Titel << weibl-Titel
	?Nachname << Nachname
	?Partner = maennl-vorname
	?er-sie = "sie"
	?ihm-ihr = "ihr"
	?Ehemann-Frau = "Ehemann"
      ] | [
	?Vorname << maennl-vorname
	?Titel << maennl-Titel
	?Nachname << Nachname
	?Partner = weibl-vorname
	?er-sie = "er"
	?ihm-ihr = "ihm"
	?Ehemann-Frau = "Ehefrau"
      ]
;

Protagonist2: ?Name = [$Titel " " $Vorname] | ?Name = [$Vorname " " $Nachname]
;

weibl-vorname: weibl-vorname1 | weibl-vorname1"-"weibl-vorname1
;

weibl-vorname1: "Vanessa" | "Chelsea" | "Sophie" | "Sina" | "Marie" |
		"Stephanie"
;

weibl-Titel: "Prinzessin" | "Comtessa" | "Fürstin"
;

maennl-vorname: maennl-vorname1 | maennl-vorname1"-"maennl-vorname1
;

maennl-vorname1: "Werner" | "Günter" | "Finn" | "Albert" | "Joshua" | "Karl" |
		 "Friedrich" | "Tassilo" | "Wolfgang"
;

maennl-Titel: "Graf" | "Vicomte" | "Fürst" | "Baron"
;

Nachname: "Müller" | "Zarenthien" | "Meier"
;

Schosstier: "Hund" | "Pagagei" | "Kater" | "Goldfisch" | "Wellensittich"
;

Ort: ["teuren"|"exklusiven"]" "["Restaurants" | "Clubs" | "Resorts"]
;

Beobachter: "Beobachter" | "Nachbarn" | "Freunde" | "Promiexperten"
;

Juwelen: "Juwelen" | "Geschenke" | "Perlen" | "Trips auf der Yacht"
;
