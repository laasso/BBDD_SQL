# Habitatge

## Descripción del proyecto

Este proyecto tiene como objetivo crear una base de datos (BBDD) llamada "habitatge" para la venta y alquiler de viviendas. La base de datos estará centrada en los municipios de Cataluña, pero debería poder funcionar para cualquier municipio del resto del Estado.

## Esquema de la base de datos

La base de datos contendrá información detallada sobre cada vivienda, incluyendo:

- **Identificador único**: Cada vivienda tendrá un identificador único.
- **Características básicas**: Número de dormitorios, número de baños, superficie de la vivienda, superficie de terrazas (si las hay), año de construcción, estado de conservación (nueva, reformada o necesita reformas), precio de venta y disponibilidad para alquiler.
- **Descripción breve**: Una pequeña descripción sobre la vivienda, con un máximo de 140 caracteres.
- **Última actualización**: Fecha de la última actualización de los datos.

Las viviendas se clasificarán en dos categorías principales: unidades independientes (casas) o apartamentos (pisos). Cada una de estas categorías tendrá subtipos específicos:

### Casas

- **Tipos**: Aislada, Adosada, Finca rústica, Masía o Castillo.
- **Características adicionales**: Número de plantas, superficie de garaje y jardín.

### Pisos

- **Tipos**: Piso (genérico), Ático, Dúplex, Estudio o Loft.
- **Planta**: Número de la planta en la que se encuentra (0 para planta baja).

Todas las viviendas podrán tener ciertas características adicionales, como aire acondicionado, ascensor, calefacción, muebles, estacionamiento, piscina, trastero y chimenea. Además, se registrarán los datos del Certificado Energético de cada vivienda, incluyendo consumo y emisiones.

## Ubicación de las viviendas

Las viviendas se localizarán en municipios que pertenecen a provincias. Cada municipio tendrá asociada una provincia. También se registrará la comarca para los municipios y provincias de Cataluña.

### Municipios

- **Nombre**: Nombre del municipio.
- **Código INE**: Código INE autogenerado.
- **Coordenadas**: Coordenadas en formato UTM, coordenadas geográficas (longitud y latitud) y coordenadas vectoriales (POINT).

Para la creación de la base de datos se proporcionarán archivos CSV con datos de municipios, provincias y comarcas. Se requerirá un mínimo de 100 registros por tabla.

---

Se proporciona un archivo que relaciona municipio, provincia y comarca, junto con datos de geolocalización. El tipo POINT se puede calcular de manera similar al código INE.

