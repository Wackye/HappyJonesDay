window.addEventListener("orientationchange",onOrientationchange ,false);
function onOrientationchange() {
   if (window.orientation === 180 || window.orientation === 0) {
       alert("請轉橫的以便繼續觀看～");
   }
   if (window.orientation === 90 || window.orientation === -90 ){
           //橫式
   } 
}
