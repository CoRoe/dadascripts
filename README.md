# Scripts für die Dada-Maschine

## Kostproben

Hier einige Kostproben:

### schuhbeck.pb

> #### Rezept 
>
> Darf es einmal etwas Ostfriesisches sein? Was glauben Sie, wie Ihre Kinder
> staunen, wenn Sie sie mit Fettucine an Jus von Wirsing überraschen. Trauen
> Sie sich!
>
> #### Zubereitung 
>
> Topf mit etwas Margarine erhitzen. Schweinefleisch zerteilen und
> hineingeben.  Bei mittlerer Hitze sautieren, dabei gelegentlich wenden.
>
> Währenddessen Petersilienwurzel und Wirsing zusammen mit dem Wachtelbohnen
> stifteln, in ein Sieb geben, ruhen lassen. Kräftig mit Rosmarin
> einreiben. In Topf heben.
>
> Kartoffeln in einem Topf mit 0,8 Litern Geflügelfonds kochen. Einkochen
> lassen, bis es Fäden zieht. Noch ein Tip vom Profi: Die Marinade nicht
> wegschütten, sondern in ein Einmachglas füllen. Sie ist ein schon im alten
> China bekanntes Hausmittel gegen Darmbeschwerden.
>
> Wenn das Ganze angebräunt ist, Temperatur herunterschalten und mit Rotwein
> abbinden. Etwas Basilikum hineinreiben.
>
> Sofort servieren. 
>
> Ihre Freunde werden staunen!

### wein.pb

> Ein goldperlender Verdicchio aus der Emilia Romagna. Das herrlich
> säuerlich-cremige Bouquet mit Anis und einem Hauch Hering gefällt ebenso wie
> der kitzelnde, mit großem Trinkfluss und jeder Menge Frische ausgestattete
> Auftritt am Gaumen. Sein fruchtig-frischer Charakter entwickelt sich durch
> die Lagerung in alten Benzinfässern. Ein Tropfen, der zu Rotbarschfilet
> passt.

## Tutorium

Texte mit einem speziellen Wortschatz oder Jargon lassen sich besonders gut
parodieren. Beispiel: Kochrezepte, wie sie Alfons Schuhbeck in seiner
BR-Kochsendung präsentiert.

    #include <format.pbi>

Inkludiert die Datei format.pbi, die einige Formatdefinitionen enthält.

Die erste Regel ist `Rezept`; die Zeile

	[Intro | Schuhbeck-intro] PBRK

besagt, dass danach entweder `Intro` oder `Schuhbeck-Intro` folgt; die beiden
Regeln sind weiter unten definiert. PBRK beginnt einen neuen Abschnit
(Paragraph break). Danach folgen die Regeln

	Topf_erhitzen
	Ankochen
	Kochen PBRK
	Parallel_arbeiten PBRK

und so weiter. Jede dieser Regeln muss definiert werden.
