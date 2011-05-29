function generate_static_map(size, lat, lng, icon_url, zoom){
    img = "http://maps.google.com/maps/api/staticmap?size="+size+
        "&markers=shadow:false|"+lat+","+lng+"|icon:"+icon_url+
        "&zoom="+zoom+"&sensor=false";

    $("#map img").attr('src', img);
    return false;
}