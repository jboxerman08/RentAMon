import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 6, duration: 1500 });
};

  if (mapElement) {

  // map injected into div#map
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

  // markers
  const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);

    new mapboxgl.Marker({ "color": "#E12947" })
      .setLngLat([ marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);

  });


fitMapToMarkers(map, markers);

  }
};

export { initMapbox };
