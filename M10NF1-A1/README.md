En la base de dades `vk21` que teniu penjada, haureu de fer els triggers necessaris per controlar què:

- L'stock de productes sempre estigui actualitzat, independentment del que compri cada client.
- Un client pot comprar un determinat producte (`INSERT` en taula `detall`).
- Un client pot modificar una de les seves comandes sobre la quantitat d'un producte adquirit (`UPDATE` en taula `detall`), agafant més o menys quantitat o unitats d'aquell producte.
- Un client pot tornar una comanda (`DELETE` del registre de la taula `detall` de la comanda en qüestió).

En qualsevol d'aquests casos, l'stock de producte de la taula `productes` haurà d'estar sempre actualitzat.

Una restricció que tindrem és que no podem vendre més unitats de producte de les que tenim en stock. Per això, si en una comanda ens demanen més unitats de les que tenim en magatzem, modificarem les unitats del client perquè corresponguin amb el màxim d'unitats de què disposem.

Heu de presentar l'arxiu `.sql` amb el codi de cada trigger (podeu fer servir comentaris al codi, sempre i quan siguin significatius).

Heu de presentar un joc de proves perquè es vegi què tenim abans de fer que actuï el trigger i el resultat una vegada que el trigger s'ha executat.
