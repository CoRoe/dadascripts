#include <stdmap.pbi>

Krankheit:
	[Modifizierer Adjektiv]>upcase-first
	 [["es " [Bestimmung Nomen-neutrum]>upcase-first]
	|["e " [Bestimmung Nomen-fem]>upcase-first]]
;


Modifizierer:
	 "sub"|"hyper"|"hypo"|"intra"|"trans"|"poly"|"ideopatho"|"adreno"
	|"circum"|""
;

Adjektiv:
	 "cutan"|"kardial"|"vaskulär"|"kardiovaskulär"|"enzymatisch"
	|"peripher"|"muskulär"|"ovarial"|"zystisch"|"troph"|"lateral"
	|"genital"|"bakteriell"|"erektil"|"viral"|"chlamydial"
;

Bestimmung:
	"cerebral"|"duodenal"|"intestinal"|"nasal"|"renal"|"cerebral"
	|"cyto"|"endo"|"bronchial"|"chondokal"|"endometrial"|"meningo"
	|"glio"|"hämo"
;

Nomen-neutrum:
	 "syndrom"|"melanom"|"fieber"|"neurinom"|"aneurysma"|"basaliom"
	|"karzinom"|"lymphom"|"epitheliom"|"blastom"
;

Nomen-fem:
	"achalasie"|"keratose"|"demenz"|"bronchitis"|"laryngitis"|"anämie"
	|"fissur"|"enzephalie"|"resistenz"|"apoplexie"|"arthritis"|"sklerose"
	|"dermatitis"|"posthitis"|"hyperplasie"|"candidose"|"zinose"
	|"phobie"|"infektion"|"dystonie"|"dysfunktion"|"mutation"|"störung"
	|"fibrose"|"retinopathie"|"borreliose"|"philie"|"hepatitis"
	|"luxation"|"fraktur"
;
