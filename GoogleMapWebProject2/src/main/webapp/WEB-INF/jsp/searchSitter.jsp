<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible content="IE=edge">
<meta http-equiv="Pragma"content="no-cache">
<meta http-equiv="Cache-Control"content="no-cache">
<meta http-equiv="Expires"content="sat,01 Dec 2001 00:00:00 GMT">
<title>MishaInfotech | Search</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel='stylesheet'	href='https://formden.com/static/cdn/bootstrap-iso.css' />

<style type="text/css">
#map-canvas {
  height: 500px;
  width:520px;
}
</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="/home">Misha Infotech</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/register">Sitter Registration<span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="/search">Search</a>
      </li>
    </ul>
    
  </div>
</nav>

<h4 class="text-center">Search Sitter</h4>
	<div class="container">
		<div class="input-group">
		  <input type="search" id="map-search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
		  <button type="button" class="btn btn-outline-primary">search</button>
		</div>
	</div>

<div class="container" style="margin-top:10px">
	<div class="row">
		<div class="col-sm-6 bg-info">
					<div class="card" style="width: 33rem;">
					  <div class="card-body">
					  	<div class="row">
						  		<div class="col-sm-4">
						  			 <img src="https://www.w3schools.com/bootstrap4/img_avatar5.png" alt="Card image" style="height:100px; width:100px">
						  		</div>
						  		<div class="col-sm-8">
						  			<h6 class="card-title">Company Name</h6>
								    <h6 class="card-subtitle mb-2 text-muted">Address</h6>
								    <p class="card-text">Open: 10:30</p>
								    <a href="#" class="card-link">Charges</a>
								</div>
							</div>
					  </div>
					</div>
				
			
		</div>
		<div class="col-sm-6 bg-success">
			<!--Google map-->
			<div id="map-canvas"></div>
		</div>
	</div>
</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&libraries=places&callback=initMap&v=weekly"></script>

<!--Google map JS Code-->
<script type="text/javascript">

function initMap() {
	
	var mapOptions, map, marker, searchBox,
	infoWindow = '',
	addressEl = document.querySelector( '#map-search' ),
	latEl = document.querySelector( '.latitude' ),
	longEl = document.querySelector( '.longitude' ),
	element = document.getElementById( 'map-canvas' );

mapOptions = {
	// How far the maps zooms in.
	zoom: 8,
	// Current Lat and Long position of the pin/
	center: new google.maps.LatLng( 0,0 ),
	// center : {
	// 	lat: -34.397,
	// 	lng: 150.644
	// },
	disableDefaultUI: false, // Disables the controls like zoom control on the map if set to true
	scrollWheel: true, // If set to false disables the scrolling on the map.
	draggable: true, // If set to false , you cannot move the map around.
	// mapTypeId: google.maps.MapTypeId.HYBRID, // If set to HYBRID its between sat and ROADMAP, Can be set to SATELLITE as well.
	// maxZoom: 11, // Wont allow you to zoom more than this
	// minZoom: 9  // Wont allow you to go more up.

};

/**
 * Creates the map using google function google.maps.Map() by passing the id of canvas and
 * mapOptions object that we just created above as its parameters.
 *
 */
// Create an object map with the constructor function Map()
map = new google.maps.Map( element, mapOptions ); // Till this like of code it loads up the map.

/**
 * Creates the marker on the map
 *
 */
marker = new google.maps.Marker({
	position: mapOptions.center,
	map: map,
	// icon: 'http://pngimages.net/sites/default/files/google-maps-png-image-70164.png',
	draggable: true
});


/**
 * Creates a search box
 */
 searchBox = new google.maps.places.SearchBox(addressEl);
/**
 * When the place is changed on search box, it takes the marker to the searched location.
 */
google.maps.event.addListener( searchBox, 'places_changed', function () {
	var places = searchBox.getPlaces(),
		bounds = new google.maps.LatLngBounds(),
		i, place, lat, long,
		addresss = places[0].formatted_address;

	for( i = 0; place = places[i]; i++ ) {
		bounds.extend( place.geometry.location );
		marker.setPosition( place.geometry.location );  // Set marker position new.
	}

	map.fitBounds( bounds );  // Fit to the bound
	map.setZoom( 15 ); // This function sets the zoom to 15, meaning zooms to level 15.
	// console.log( map.getZoom() );

	lat = marker.getPosition().lat();
	long = marker.getPosition().lng();
	latEl.value = lat;
	longEl.value = long;

	//resultArray =  places[0].address_components;

	// Get the city and set the city input value to the one selected Note: Not Working
	/* for( var i = 0; i < resultArray.length; i++ ) {
		if ( resultArray[ i ].types[0] && 'administrative_area_level_2' === resultArray[ i ].types[0] ) {
			citi = resultArray[ i ].long_name;
			city.value = citi;
		}
	} */

	// Closes the previous info window if it already exists
	if ( infoWindow ) {
		infoWindow.close();
	}
	/**
	 * Creates the info Window at the top of the marker
	 */
	infoWindow = new google.maps.InfoWindow({
		content: addresss
	});

	infoWindow.open( map, marker );
} );


/**
 * Finds the new position of the marker when the marker is dragged.
 */
google.maps.event.addListener( marker, "dragend", function ( event ) {
	var lat, long, address;

	console.log( 'i am dragged' );
	lat = marker.getPosition().lat();
	long = marker.getPosition().lng();

	var geocoder = new google.maps.Geocoder();
	geocoder.geocode( { latLng: marker.getPosition() }, function ( result, status ) {
		if ( 'OK' === status ) {  // This line can also be written like if ( status == google.maps.GeocoderStatus.OK ) {
			address = result[0].formatted_address;
			//resultArray =  result[0].address_components;

			// Get the city and set the city input value to the one selected
			/* for( var i = 0; i < resultArray.length; i++ ) {
				if ( resultArray[ i ].types[0] && 'administrative_area_level_2' === resultArray[ i ].types[0] ) {
					citi = resultArray[ i ].long_name;
					console.log( citi );
					city.value = citi;
				}
			} */
			//addressEl.value = address;
			latEl.value = lat;
			longEl.value = long;

		} else {
			console.log( 'Geocode was not successful for the following reason: ' + status );
		}

		// Closes the previous info window if it already exists
		if ( infoWindow ) {
			infoWindow.close();
		}

		/**
		 * Creates the info Window at the top of the marker
		 */
		infoWindow = new google.maps.InfoWindow({
			content: address
		});

		infoWindow.open( map, marker );
	} );
});

}

window.initMap = initMap;

</script>

</body>
</html>