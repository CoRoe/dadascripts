#include <stdmap.pbi>
#include <format.pbi>

technology:
	acronym /*| fancy*/
;

acronym-exp:
	A1 " " A2 " " A3
	| A1 " " A2 " " A2 " " A3
;

A1:	"Universal" | "Global" | "Digital" | "Standard" | "Open"
;

A2:	"Multiplex" | "Duplex" | "Carrier" | "Wideband" | "Ultrawideband"
	| "Narrowband" | "Orthogonal" | "Asymmetric" | "Asynchronous"
	| "Symmetric" | "Synchronous" | "Multipath" | "Multilane"
	| "Differential" | "Low-Pincount" | "Transmission" | "Gaussian"
	| "Phase-Shift" | "Automation" | "Interconnect" | "Interleaving"
;

A3:	"Bus" | "Modulation" | "Interface" | "System" | "Schema" | "Encoding"
;
