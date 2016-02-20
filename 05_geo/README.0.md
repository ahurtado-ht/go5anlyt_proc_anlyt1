MAPAS BASE
toca tener un mapa (openstreetmap,googlemaps)


GESTION DE LAYERS 
mapbox ~ geoserver ~ openlayers: gestion de mapas
mapbox-studio ~ tilemill:editor ~ qgis: editor

son aplicaciones que crean los poligonos y entregan un mapa base
luego sirven los contenidos en geojson

VISUALIZADOR
leaflet~visualizacion: capa de visualizacion; se debe conectaar a servidor de layers para traer mapa.
tambien se podria pensar en uno mismo editar o servir el geojson
nota, tener en cuenta que en geojson: longitude viene antes de latitude


puede tener plugins: marketcluster: group se agrega

toca agregar un componente de layers, al que se le pase una consulta y que devuelva un geojson (cartodb)



evaluacion de puntos: http://itouchmap.com/latlong.html


OTROS ==============================
meteor con leaflet
http://leaflet.meteor.com/

turf geospatial analysis http://turfjs.org/
umap (como un editor para openstreetmap)
trimet.org
openlayers
	Map: donde se coloca el mapa
	View: lo que se ve sobre un mapa: sistema de coordenadas
	Source: poligonos en detereminado formato geoJson o KML
	Layer: representacion visual de un source
	
-----------------
geo alternativas
- http://mapstory.org/
- oddisey: http://cartodb.github.io/odyssey.js/sandbox/sandbox.html#md/slides/YGBgCi10aXRsZTogIkV4YW1wbGUxCSIKLWF1dGhvcjogIkNhcnRvREIiCmBgYAoKI1lvdXIgZmlyc3Qgb2R5c3NleS5qcyBzdG9yeQpgYGAKLSBjZW50ZXI6IFswLjc2MjAsIC0wLjQzODVdCi0gem9vbTogOQpMLm1hcmtlcihbMzcuNzYyMCwgLTEyMi40Mzg1XSkuYWN0aW9ucy5hZGRSZW1vdmUoUy5tYXApCmBgYAoKTW92ZSB0aGUgbWFwIGFyb3VuZCBhbmQgc2F2ZSB0aGUgcG9zaXRpb24gYnkgY2xpY2tpbmcgb24gIkFERCA+IE1vdmUgbWFwIHRvIHRoZSBjdXJyZW50IHBvc2l0aW9uIi4gQXMgeW91IGNhbiBzZWUsIG5vdyB3ZSBhcmUgaGlnaGxpZ2h0aW5nIFNhbiBGcmFuY2lzY28uCgpUaGVuIGFkZCBoZXJlIHRoZSBkZXNjcmlwdGlvbiBmb3IgeW91ciBzbGlkZSBzbyBpdCdzIHNob3duIG9uIHRoZSBsZWZ0IHNpZGUgYm94LgoKCiNIb3cgdG8gYWRkIG1vcmUgc3RhdGVzCmBgYAotIGNlbnRlcjogWzQwLjczNDgsIC03My45OTcwXQotIHpvb206IDkKTC5tYXJrZXIoWzQwLjczNDgsIC03My45OTcwXSkuYWN0aW9ucy5hZGRSZW1vdmUoUy5tYXApCmBgYAoKQnkgYWRkaW5nIG5ldyBbTWFya2Rvd25dIChodHRwOi8vZGFyaW5nZmlyZWJhbGwubmV0L3Byb2plY3RzL21hcmtkb3duL10pIGgxIGVsZW1lbnRzICgjKSB5b3UgYWRkIG5ldyBzdGF0ZXMgdG8geW91ciBzdG9yeS4KCgojQWRkaW5nIGltYWdlcyB0byB5b3VyIHN0b3J5CmBgYAotIGNlbnRlcjogWzQwLjczNjUsIC03My45OTgyXQotIHpvb206IDEzCmBgYAoKQnkgZGVmYXVsdCwgaW1hZ2VzIGFyZSBhbHNvIHN1cHBvcnRlZC4gCgohW05ldyBZb3JrXShodHRwOi8vd3d3LmJvc3Rvbi1kaXNjb3ZlcnktZ3VpZGUuY29tL2ltYWdlLWZpbGVzL25ldy15b3JrLTEuanBnKQoKI0V4cG9ydGluZyB5b3VyIHN0b3J5CmBgYAotIGNlbnRlcjogWzQwLjQ0NjksIC0yOC41NjQ1XQotIHpvb206IDMKYGBgCgpZb3UgaGF2ZSBkaWZmZXJlbnQgb3B0aW9ucyBmb3IgZXhwb3J0aW5nIHlvdXIgb2R5c3NleS5qcyB2aXN1YWxpemF0aW9uLiBZb3UgY2FuIGVpdGhlciBlbWJlZCB0aGlzIHVzaW5nIGFuIGlmcmFtZSwgcHVibGlzaGluZyB3aXRoIGEgY2xpY2sgb24gYmwub2NrcyBvciBqdXN0IHNoYXJlIHRoZSBVUkwgb2YgdGhpcyB2aXN1YWxpemF0aW9uLgoKSWYgeW91IHdhbnQgdG8gY3VzdG9taXplIGl0IGZ1cnRoZXIsIHlvdSBjYW4gZG93bmxvYWQgdGhlIGdlbmVyYXRlZCBzb3VyY2UgY29kZSBieSBjbGlja2luZyBvbiB0aGUgYnV0dG9uIGJlbG93LgoKI0FkdmFuY2VkIHVzZXJzCgpDaGVjayBvdXQgb3VyIFtkb2N1bWVudGF0aW9uXSgvb2R5c3NleS5qcy9kb2N1bWVudGF0aW9uLykgdG8gbGVhcm4gaG93IHRvIHVzZSBvZHlzc2V5IHRvIGNyZWF0ZSBtb3JlIGN1c3RvbSB0aGluZ3MuIEl0J3MgY3JhenkgdGhlIGFtb3VudCBvZiBjb29sIHRoaW5ncyB0aGF0IGNhbiBiZSBkb25lIHdpdGggdGhlIGxpYnJhcnkuCgpBbHNvIGlmIHlvdSBhcmUgYSBkZXZlbG9wZXIsIHRha2UgYSBsb29rIGF0IG91ciBjb250cmlidXRpbmcgZ3VpZGVsaW5lIHNvIHlvdSBjYW4gcHVzaCBjb2RlIHRvIHRoZSBhY3R1YWwgbGlicmFyeS4KCkNoZWVycyEK
---------------
pivot table alternatives: 
- http://imply.io/post/2015/10/26/hello-pivot.html
- http://imply.io/docs/latest/
-----------------------------
angular inicial: 
https://github.com/angular/angular-seed

	
	