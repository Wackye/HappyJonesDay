function padLeft(str, len) {
    str = '' + str;
    if (str.length >= len) {
        return str;
    } else {
        return padLeft('0' + str, len);
    }
}

function getTimeRemaining(endtime){ 
    
    const total = Date.parse(endtime) - Date.parse(new Date()); 
    const seconds = Math.floor( (total/1000) % 60 ); 
    //var s = document.getElementById('sec').textContent = padLeft(seconds,2);
    
    const minutes = Math.floor( (total/1000/60) % 60 );
   // document.getElementById('min').textContent = padLeft(minutes,2);
    
     const hours = Math.floor( (total/(1000*60*60)) % 24 );
   //  document.getElementById('hour').textContent = padLeft(hours,2);
     
      const days = Math.floor( total/(1000*60*60*24)); 
      return { total, days, hours, minutes, seconds }; 
}

// var mm = window.setTimeout(getTimeRemaining('2020-09-29T00:00:00'),100);