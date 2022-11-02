function onGeoOkay(position) {
    const pos ={
        lat:position.coords.latitude,
        lng:position.coords.longitude
    }
    localStorage.setItem("position",JSON.stringify(pos));
    console.log(position.coords);

}

function onGeoError() {
    alert("I can't find you. No weather for you.");
}

navigator.geolocation.getCurrentPosition(onGeoOkay, onGeoError);