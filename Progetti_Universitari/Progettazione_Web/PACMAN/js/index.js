      
        let hamburger = document.querySelector(".hamburger");
        hamburger.onclick = function() {
            nav = document.querySelector(".nav-bar");
            nav.classList.toggle("active");
        }
        
      let pacman_omino = document.getElementById("po");
      let fantasma_h = document.getElementById("fh");
      let fantasma_yellow = document.getElementById("fy");
      let fantasma_red = document.getElementById("fr");
      let cb =  document.getElementById("cb");
      let cn =  document.getElementById("cb");

      let om =  document.getElementById("om");


 

      window.addEventListener('scroll', () =>{
        let value = window.scrollY;
        let value_po=0;
        let value_fh=0;
        let value_fy=0;
        let value_fr=0;
        let value_cb=0;

        let value_om=0;

          value_po=value-25;
          value_fh=value-160;
          value_fy=value-360;
          value_fr=value-640;
          value_cb=value+250;
          
          value_om=value-2200;


          pacman_omino.style.left = value_po * 2 + 'px';
          fantasma_h.style.left = value_fh * 2 + 'px';
          fantasma_yellow.style.left = value_fy * 2 + 'px';
          fantasma_red.style.left = value_fr * 2 + 'px';
          cb.style.left = value_cb * 2 + 'px';
          
         om.style.right = value_om * 2 + 'px';

      });

      
      let showScore = ()=> {

        // Mostra la finestra opaca
        var scoreModal = document.getElementById("score-modal");
        scoreModal.style.opacity = "0";
        scoreModal.style.display = "block";
    
        
    
        var scoreContent = document.querySelector(".score-content");
        scoreContent.innerHTML = "";
    
        fetch('http:score.php')
          .then(response => response.text())
          .then(data => {
            scoreContent.innerHTML = data;
          })
          .catch(error => {
            console.error(error);
          });
          let opacity = 0;
          let interval = setInterval(function() {
          opacity += 0.1;
          scoreModal.style.opacity = opacity;
          if (opacity >= 1)
          clearInterval(interval);
          }, 50);
          setTimeout(()=>{
            prova();
          },1000);
          }
    
          let hideScore = () => {
           
          // Nasconde la finestra opaca gradualmente
          var scoreModal = document.getElementById("score-modal");
          let opacity = 1;
          let interval = setInterval(function() {
          opacity -= 0.1;
          scoreModal.style.opacity = opacity;
          if (opacity <= 0) {
          clearInterval(interval);
          scoreModal.style.display = "none";
          }
          }, 50);
    
          }
    
          let prova = () => {
            let tabHeader = document.getElementsByClassName("tab-header")[0];
            let tabIndicator = document.getElementsByClassName("tab-indicator")[0];
            let tabBody = document.getElementsByClassName("tab-body")[0];
    
            
            let tabsPane = tabHeader.getElementsByTagName("div");
           
    
            for(let i=0;i<tabsPane.length;i++){
              tabsPane[i].addEventListener("click",function(){
                tabHeader.getElementsByClassName("active")[0].classList.remove("active");
                tabsPane[i].classList.add("active");
    
                tabBody.getElementsByClassName("active")[0].classList.remove("active");
                tabBody.getElementsByTagName("div")[i].classList.add("active");
              
                tabIndicator.style.left = `calc(calc(100% / 3) * ${i})`;
              });
            }
          }