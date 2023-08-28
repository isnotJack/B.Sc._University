let showScore = ()=> {
    
    // Mostra la finestra opaca
    var scoreModal = document.getElementById("score-modal");
    scoreModal.style.opacity = "0";
    scoreModal.style.display = "block";
    //scoreModal.addEventListener("click", hideScore);

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
      //scoreModal.removeEventListener("click", hideScore);
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