   // Se il messaggio esiste, lo nascondiamo dopo 3 secondi
   let msgElement = document.getElementById("message");
   if (msgElement) {
   setTimeout(function() {
       msgElement.style.display = "none";
   }, 3000);
   }
   hamburger = document.querySelector(".hamburger");
       hamburger.onclick = function() {
           nav = document.querySelector(".nav-bar");
           nav.classList.toggle("active");
       }