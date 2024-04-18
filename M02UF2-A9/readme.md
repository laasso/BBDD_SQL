# Habitatge

## Descripció del projecte

Aquest projecte té com a objectiu crear una base de dades (BBDD) anomenada "habitatge" per a la venda i lloguer d'habitatges. La base de dades estarà centrada en els municipis de Catalunya, però hauria de poder funcionar per a qualsevol municipi de la resta de l'Estat.

## Esquema de la base de dades

La base de dades contindrà informació detallada sobre cada habitatge, incloent:

- **Identificador únic**: Cada habitatge tindrà un identificador únic.
- **Característiques bàsiques**: Nombre de dormitoris, nombre de banys, superfície de l'habitatge, superfície de terrasses (si les hi ha), any de construcció, estat de conservació (nova, reformada o necessita reformes), preu de venda i disponibilitat per a lloguer.
- **Descripció breu**: Una petita descripció sobre l'habitatge, amb un màxim de 140 caràcters.
- **Última actualització**: Data de la darrera actualització de les dades.

Els habitatges es classificaran en dues categories principals: unitats independents (cases) o apartaments (pisos). Cadascuna d'aquestes categories tindrà subtipus específics:

### Cases

- **Tipus**: Aïllada, Adossada, Finca rústica, Masia o Castell.
- **Característiques addicionals**: Nombre de plantes, superfície de garatge i jardí.

### Pisos

- **Tipus**: Pis (genèric), Àtic, Dúplex, Estudi o Loft.
- **Planta**: Nombre de la planta en la qual es troba (0 per a planta baixa).

Tots els habitatges podran tenir certes característiques addicionals, com ara aire condicionat, ascensor, calefacció, mobles, estacionament, piscina, traster i xemeneia. A més, s'enregistraran les dades del Certificat Energètic de cada habitatge, incloent consum i emissions.

## Ubicació dels habitatges

Els habitatges es localitzaran en municipis que pertanyen a províncies. Cada municipi tindrà associada una província. També es registrarà la comarca per als municipis i províncies de Catalunya.

### Municipis

- **Nom**: Nom del municipi.
- **Codi INE**: Codi INE autogenerat.
- **Coordenades**: Coordenades en format UTM, coordenades geogràfiques (longitud i latitud) i coordenades vectorials (POINT).

Per a la creació de la base de dades, es proporcionaran fitxers CSV amb dades de municipis, províncies i comarques. Es requerirà un mínim de 100 registres per taula.

---

S'adjunta un fitxer que relaciona municipi, província i comarca, juntament amb dades de geolocalització. El tipus POINT es pot calcular de manera similar al codi INE.
