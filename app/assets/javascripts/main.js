window.onload = function getDate(){
    var yyyy, mm, dd, today
    today = new Date();
    yyyy = today.getFullYear();
    mm = today.getMonth() + 1;
    dd = today.getDate();

    //年
    $Year = "<select>";
    for( var i=2000; i<=2030; i++ ){
        if( i == yyyy){
            $Year += "<option value=\"" + i + "\" selected >" + i + "</option>";
        }else{
            $Year += "<option value=\"" + i + "\" >" + i + "</option>";
        }
    }
    $Year += "</select>";
    document.getElementById("year").innerHTML = $Year + "年";

    //月
    $Month = "<select>";
    for( var i=1; i<=12; i++ ){
        if( i == mm){
            $Month+= "<option value=\"" + i + "\" selected >" + i + "</option>";
        }else{
            $Month+= "<option value=\"" + i + "\" >" + i + "</option>";
        }
    }
    $Month += "</select>";
    document.getElementById("month").innerHTML = $Month + "月";

    //日付
    $Day = "<select>";
    for( var i=1; i<=31; i++ ){
        if( i == dd){
            $Day+= "<option value=\"" + i + "\" selected >" + i + "</option>";
        }else{
            $Day+= "<option value=\"" + i + "\" >" + i + "</option>";
        }
    }
    $Day += "</select>";
    document.getElementById("day").innerHTML = $Day + "日";
}
