import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    console.log("This is the marker value");
    console.log(this.markerValue);
    console.log(Object.keys(this.markerValue).length === 0);
    if (Object.keys(this.markerValue).length === 0) {
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    } else {
      this.#addMarkerToMap(this.markerValue);
      this.#fitMapToMarker(this.markerValue);
    }

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #addMarkerToMap(marker) {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    // Create a HTML element for your custom marker
    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html

    new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #fitMapToMarker(marker) {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([marker.lng, marker.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
