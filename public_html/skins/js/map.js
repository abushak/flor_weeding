ymaps.load(['package.standard'],function() {
    var fMap, fPlacemark;
    fPlacemark = new ymaps.Placemark([50.42477279, 30.50638250], {content: WORD_1 + " FLOR People", balloonContent: WORD_1 + " FLOR People"});
    fMap = new ymaps.Map("mapcontainer", {center: [50.42477279, 30.50638250], zoom: 15});
    fMap.geoObjects.add(fPlacemark);
    fMap.controls.add("zoomControl", {left: 25, top: 25});
    if (RT1 == 'contacts') {
        var cMap, cPlacemark;
        cPlacemark = new ymaps.Placemark([50.42477279, 30.50638250], {content: WORD_1 + " FLOR People", balloonContent: WORD_1 + " FLOR People"});
        cMap = new ymaps.Map("map", {center: [50.42477279, 30.50638250], zoom: 15});
        cMap.geoObjects.add(cPlacemark);
        cMap.controls.add("zoomControl", {left: 25, top: 25});
    }
});