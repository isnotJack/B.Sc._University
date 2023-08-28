
const canvas = document.getElementById("canvas");
const canvasContext = canvas.getContext("2d");

const pacmanFrames = document.getElementById("animation");
const ghostFrames = document.getElementById("ghosts");
const ghostFrames2 = document.getElementById("ghosts_blue");


let sound = new Audio('audio/eat1.mp3');
let sound_2 = new Audio('audio/eat2.mp3');
let sound_3 = new Audio('audio/death.mp3');
let sound_4 = new Audio('audio/kill.mp3');
let sound_5 = new Audio('audio/power-up.mp3');
let sound_6 = new Audio('audio/start.mp3');
let sound_7 = new Audio('audio/win.mp3');
let soundIndex = 0;
let isUserInteracted = false;

document.addEventListener('mousemove', function () {
    isUserInteracted = true;
});

window.onload = function() {
      //sound_6.play();
};



let createRect = (x, y, width, height, colore) =>{
    canvasContext.fillStyle = colore;                
    canvasContext.fillRect(x,y,width,height);       
}

let createCircle = (x, y, radius, colore) =>{
    canvasContext.fillStyle = colore;
    canvasContext.beginPath();
    canvasContext.arc(x, y, radius, 0, 2 * Math.PI);
    canvasContext.fill();

}

const DIRECTION_RIGHT = 4;
const DIRECTION_UP = 3;
const DIRECTION_LEFT = 2;
const DIRECTION_BOTTOM = 1;
let vite = 3;
let numghost;
if(get_mod == "classic" || get_mod == "insane"){
    numghost = 4;
}else if(get_mod == "invasion"){
    numghost = 8;
}
let velocita_ghost;
let pos_img_fantasma = [
    { x: 0, y: 0 },         //fantasma rosso           
    { x: 176, y: 0 },       //fantasma aracione
    { x: 0, y: 121 },       //fantasma rosa
    { x: 176, y: 121 },     //fantasma blu
]

//Variabili di Gioco
let gameInterval;
let fps = 30;
let pacman;
let oneBlockSize = 20;
let score = -1;
let ghosts = [];
let wallSpaceWidth = oneBlockSize / 1.6;                
let wallOffset = (oneBlockSize - wallSpaceWidth) / 2;   
let ColoreMuro = "black";
let ContaCibo = 0;
let ContaCiboAppoggio = 0;
let cont=0;
let idSeGhostMorti = [];
let idmuri;
let pallinaBlu=0;
let pallinaBluEnabled = true;
let idpallina;
let triggeredCoords = [];
let id_morto=0;
let contaVincite =0;
let id_check=[];let conta_volte=-1;
let round = document.querySelector('.winner');

/* Creo la mappa */
let map = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1],
    [1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1],
    [1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 2, 1, 2, 1, 3, 3, 3, 1, 2, 1, 2, 1, 1, 1, 1, 1],
    [2, 2, 2, 2, 2, 2, 2, 2, 1, 3, 3, 3, 1, 2, 2, 2, 2, 2, 2, 2, 2,1],
    [1, 1, 1, 1, 1, 2, 1, 2, 1, 3, 3, 3, 1, 2, 1, 2, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2, 1, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1, 2, 1, 1, 1, 2, 1, 1, 1, 2, 1],
    [1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1],
    [1, 1, 2, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 2, 2, 1, 1],
    [1, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 2, 1],
    [1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1],
    [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1],
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
];

/* Conto il cibo */
let conteggioCibo = () => {
    ContaCibo=0; 
for (let i = 0; i < map.length; i++) {          //23
    for (let j = 0; j < map[0].length; j++) {   //21
        if (map[i][j] == 2) {
            ContaCibo ++;                       //conto quante sono le palline da mangiare 
        }
    }
}
ContaCiboAppoggio = ContaCiboAppoggio+ContaCibo;


}

conteggioCibo();

//La ragione per cui sono state scelte queste destinazioni è perché si trovano vicino ai bordi della mappa,
// in modo da dare ai fantasmi una maggiore probabilità di aggirare il labirinto e catturare Pac-Man.    
let obbCasualiPerFantasmi  = [  
    { x: 1 * oneBlockSize, y: 1 * oneBlockSize },                   //cordinate in alto a sx    
    { x: 1 * oneBlockSize, y: (map.length - 2) * oneBlockSize },    //cordinate in basso a sx
    { x: (map[0].length - 2) * oneBlockSize, y: oneBlockSize },     //cordinate in alto a dx
    {
        x: (map[0].length - 2) * oneBlockSize,                      //cordinate in basso a dx
        y: (map.length - 2) * oneBlockSize,
    },
];

let creaNuovoPacman = () => {
    pacman = new Pacman(
        oneBlockSize*10,
        oneBlockSize*13,
        oneBlockSize,
        oneBlockSize,
        oneBlockSize / 5
    );
};

let gameLoop = () => {
    draw();
    update();
};

setTimeout(()=>{
    gameInterval = setInterval(gameLoop, 1000 / fps);
    document.querySelector('.loader').style.display = 'none';
    document.querySelector('.loader2').style.display = 'none';
},4000);

let spanList = document.querySelectorAll('.loader2 span');
let iN = 3;

setInterval(()=>{
    spanList[0].innerHTML = iN;
    spanList[1].innerHTML = iN;
    iN--;
},1000);

let restartPacmanEGhosts = () => {
    for(let i=0; i<idSeGhostMorti.length;i++){
    clearTimeout(idSeGhostMorti[i]);}
    clearInterval(idmuri);
    creaNuovoPacman();
    creaNuoviGhosts();
};

let onGhostCollision = () => {
        sound_3.play()
        vite--;
        restartPacmanEGhosts();
    if (vite == 0) {
        gameOver();
    }
};

let onGhostCollision_blu = (id_morto) => {
        sound_4.play();
        score = score +10;
        ContaCiboAppoggio = ContaCiboAppoggio +10;
        for(let i=0; i<idSeGhostMorti.length;i++){
            clearTimeout(idSeGhostMorti[i]);
        }
        creaNuoviGhosts_rigioco(id_morto);
    if (vite == 0) {
        gameOver();
    }
};

let gameOver = () =>{
    clearInterval(gameInterval);
    drawGameOver();
};

let drawVincita = () => {
    sound_7.play();
    document.querySelector('.winner').style.display = 'block';
    setTimeout(()=>{
        round.textContent = "Round:"+ contaVincite;
        round.style.display = 'none';    
    },2000);
    setTimeout(()=>{
        round.style.display = 'block';    
    },3000);
    
};

let drawGameOver = () => {
    document.querySelector('.gameover').style.display = 'block';
    // invio la richiesta ad un server per salvare il dato nel database
    let id_utente = session_user;
    let modalita = get_mod;
    let url = 'http://localhost/PACMAN_MIO_mod/insertScore.php?score=' + score +'&modalita=' + modalita + '&id_utente='+ id_utente;
    fetch(url)
    .then(response => console.log('Dato salvato', response))
    .catch(error => console.error('Errore nel salvataggio del dato', error));
};

let restoreMappa = () =>{
    mp = []; 
        for (let i = 0; i < map.length; i++) {
            mp[i] = map[i].slice();             
        }

    map = [];
    for (let i = 0; i < mp.length; i++) {
        map[i] = mp[i].slice();             
    }
        rimpiazza();
        drawCibo();
}

let update = () => {
    pacman.moveProcess();                 
    pacman.eat();
    updateGhosts();
    if(pallinaBlu == 0 ){
        if (pacman.checkGhostCollision(ghosts)) {
            onGhostCollision();
        }
    }else{
        if (pacman.checkGhostCollision(ghosts)) {
            if(pacman.checkGhostCollision_singolo(ghosts)){
                onGhostCollision();
            }else{
                id_morto = pacman.checkGhostCollision_blu(ghosts);
                onGhostCollision_blu(id_morto);
            }
        }
    }
    
    if(score+1 >= ContaCiboAppoggio){               
        triggeredCoords=[];
        contaVincite++;
        if(get_mod== "invasion"){
            numghost=8;
        }
        drawVincita();
        clearInterval(gameInterval);
        setTimeout(()=>{
            round.style.display = 'none';
            round.textContent="Winner";    
            //1° devo ridisegnare tutte le palline
            restoreMappa();
            conteggioCibo();
            //2° devo ridisegnare il pacman e i ghost
            restartPacmanEGhosts();
            //3° il gioco rinizia
            gameInterval = setInterval(gameLoop, 1000 / fps);
        },5000)

    }
};

let rimpiazza = () => {
    for (let i = 0; i < map.length; i++) {
        for (let j = 0; j < map[0].length; j++) {
            if (map[i][j] == 3) {
                if(i==9 || i == 10 || i == 11){
                    if(j == 9 || j==10 || j == 11){
                        map[i][j] = 3;
                    }else{
                        map[i][j] = 2;
                    }
                }else{
                    map[i][j] = 2;
                }
            }
            if(i == 12 && j == 10){
                map[i][j] = 1;
        }
        }
    }
};

let drawCibo = () => {
    for (let i = 0; i < map.length; i++) {
        for (let j = 0; j < map[0].length; j++) {
            if (map[i][j] == 2) {
                if(i==1 || i == 21){
                    if(j==1 || j == 19){
                        createCircle(
                            j * oneBlockSize + oneBlockSize / 3 + 4,
                            i * oneBlockSize + oneBlockSize / 3 + 4,
                            oneBlockSize / 3,
                            "#FEB897"
                        );        
                    }else{
                        createRect(
                            j * oneBlockSize + oneBlockSize / 3,
                            i * oneBlockSize + oneBlockSize / 3,
                            oneBlockSize / 3,
                            oneBlockSize / 3,
                            "#FEB897"
                        );
                    }
                }else{
                createRect(
                    j * oneBlockSize + oneBlockSize / 3,
                    i * oneBlockSize + oneBlockSize / 3,
                    oneBlockSize / 3,
                    oneBlockSize / 3,
                    "#FEB897"
                );
                }
            }
        }
    }
};

let drawViteRimanenti = () => {
    canvasContext.font = "20px Emulogic";
    canvasContext.fillStyle = "white";
    canvasContext.fillText("Lives: ", 220, oneBlockSize * (map.length + 1)); 

    for (let i = 0; i < vite; i++) {
        canvasContext.drawImage(
            pacmanFrames,
            2 * oneBlockSize,
            0,
            oneBlockSize,
            oneBlockSize,
            350 + i * oneBlockSize,
            oneBlockSize * map.length + 2,
            oneBlockSize,
            oneBlockSize
        );
    }
};

let drawScore = () => {
    canvasContext.font = "20px Emulogic";
    canvasContext.fillStyle = "white";
    canvasContext.fillText(
        "Score: " + score,
        0,
        oneBlockSize * (map.length + 1)        
    );
};

let draw = () => {
    canvasContext.clearRect(0, 0, canvas.width, canvas.height); 
    createRect(0, 0, canvas.width, canvas.height, "black");     //crea il canvas di colore nero
    drawWalls();                                                //crea le colonne
    drawCibo();                                                 //il cibo
    drawGhosts();                                               //chiamo cosi e non ghost.draw perchè poi viene fatto un for per tutti i fantasmini dopo
    pacman.draw();                                              //disegna il pacman
    drawScore();                                                //lo score
    drawViteRimanenti();                                        //le vite
};


let drawWalls = () => {
    //map.length->    23
    //map[0].length-> 21
    //oneBlockSize->  20 la dimensione di un singolo quadratino del muro
    for (let i = 0; i < map.length; i++) {
        for (let j = 0; j < map[0].length; j++) {
            if (map[i][j] == 1) {
                createRect(
                    j * oneBlockSize,
                    i * oneBlockSize,
                    oneBlockSize,
                    oneBlockSize,
                    "#342DCA"
                );//ora abbiamo tutto blu
                //ora voglio rendere nere le caselle del muro
                if (j > 0 && map[i][j - 1] == 1) {  //se non sto sulla prima e la cella di prima era un muro
                    createRect(
                        j * oneBlockSize,
                        i * oneBlockSize + wallOffset,
                        wallSpaceWidth + wallOffset,
                        wallSpaceWidth,
                        ColoreMuro
                    );
                }
                //ora ho tutto bordato di blu e non ho la prima casella
                if (j < map[0].length - 1 && map[i][j + 1] == 1) {
                    createRect(
                        j * oneBlockSize + wallOffset,
                        i * oneBlockSize + wallOffset,
                        wallSpaceWidth + wallOffset,
                        wallSpaceWidth,
                        ColoreMuro
                    );
                }
                //qui si inizia a fare la stessa cosa anche per le colonne
                if (i < map.length - 1 && map[i + 1][j] == 1) {
                    createRect(
                        j * oneBlockSize + wallOffset,
                        i * oneBlockSize + wallOffset,
                        wallSpaceWidth,
                        wallSpaceWidth + wallOffset,
                        ColoreMuro
                    );
                }
                //idem con patate
                if (i > 0 && map[i - 1][j] == 1) {
                    createRect(
                        j * oneBlockSize + wallOffset,
                        i * oneBlockSize,
                        wallSpaceWidth,
                        wallSpaceWidth + wallOffset,
                        ColoreMuro
                    );
                }
            }
        }
    }
};

let creaMuriTemporanei = () =>{

    idmuri = setInterval(()=>{
       if(cont == 3 || cont == 4 || cont== 8 || cont == 9 || cont == 13 || cont ==14){                   
        //map.length->    23
        //map[0].length-> 21
        for (let i = 0; i < map.length; i++) {
            for (let j = 0; j < map[0].length; j++) {
                if(i==9){
                    if(j == 9 || j==10 || j == 11)
                    map[i][j]=1;
                }else if(i==12){
                    if(j==10 && cont>=4)
                    map[i][j]=1;
                }
            }
        }
       }else{
            for (let i = 0; i < map.length; i++) {
                for (let j = 0; j < map[0].length; j++) {
                    if(i==9){
                        if(j == 9 || j==10 || j == 11)
                        map[i][j]=3;
                    }else if(i==12){
                        if(j==10 && cont>=4)
                        map[i][j]=3;
                    }
                }
        }
        }
        cont++;
        if(cont == 16){
            clearInterval(idmuri);
        }
    },1000);

}

let creaNuoviGhosts = () => {
    if(get_mod == "classic" || get_mod == "invasion"){
        velocita_ghost = pacman.speed/2;
    }else if(get_mod == "insane"){
        velocita_ghost = pacman.speed;
    }
    ghosts = [];
    cont=0;
    //if(contaVincite>0){//caso per quando rinizia la partita
        pallinaBlu =0;
    //}
    for (let i = 0; i < numghost ; i++) {

        idSeGhostMorti[i] = setTimeout(()=>{
            let newGhost = new Ghost(                                        //if dice se numero pari allora non sommare la dimensione di un blocco
            id = i,
            infetto = 0,
            9 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,     //è la posizione x e y da cui PARTONO I FANTASMINI
            10 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,    //9 e 10 perchè se conti le caselle 9 è il numero delle colonne e 10 quello delle righe
            oneBlockSize,                                               //width
            oneBlockSize,                                               //height
            velocita_ghost,                                             //velocita
            pos_img_fantasma[i % 4].x,                                  //imageX
            pos_img_fantasma[i % 4].y,                                  //imageY
            124,                                                        //imageHeight !è la grandezza dell'immagine di un singolo fantasmino
            116,                                                        //imageWidth  !presa dal ritaglio di un singolo
            7 + i                                                       // cerchio rosso, cosi l'ultimo ce l'ha piu grande
        );
        ghosts.push(newGhost);                                          //lo va ad aggiungere nell'array di ghost

        },1000*i*5);
    }
    creaMuriTemporanei();
};

CasoMenoFantasmini = () =>{

    if(get_mod == "classic" || get_mod == "invasion"){
        velocita_ghost = pacman.speed/2;
    }else if(get_mod == "insane"){
        velocita_ghost = pacman.speed;
    }

        numghost=4;

    if(ghosts.length == 2 ){

        for(let i=2; i<numghost;i++){
        let newGhost = new Ghost(                                       
        id = i,
        infetto = 0,
        9 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,        
        10 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,        
        oneBlockSize,                                                   
        oneBlockSize,                                                  
        velocita_ghost,                                                 
        pos_img_fantasma[i % 4].x,                                     
        pos_img_fantasma[i % 4].y,                                      
        124,                                                            
        116,                                                            
        7 + i                                                          
        );
        ghosts.push(newGhost);     
       
        }   
    }else if(ghosts.length == 3){
        for(let i=3; i<numghost;i++){
            let newGhost = new Ghost(                                        
            id = i,
            infetto = 0,
            9 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,             
            10 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,    
            oneBlockSize,                                               
            oneBlockSize,                                               
            velocita_ghost,                                           
            pos_img_fantasma[i % 4].x,                               
            pos_img_fantasma[i % 4].y,                              
            124,                                                        
            116,                                                      
            7 + i                                                       
            );
            ghosts.push(newGhost);                     
            }   
    }else if(ghosts.length == 1){
        for(let i=1; i<numghost;i++){
            let newGhost = new Ghost(                                        
            id = i,
            infetto = 0,
            9 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,     
            10 * oneBlockSize + (i % 2 == 0 ? 0 : 1) * oneBlockSize,    
            oneBlockSize,                                               
            oneBlockSize,                                               
            velocita_ghost,                                           
            pos_img_fantasma[i % 4].x,                               
            pos_img_fantasma[i % 4].y,                               
            124,                                                        
            116,                                                        
            7 + i                                                       
            );
            ghosts.push(newGhost);                     
            }   
    }
}

creaNuoviGhosts_rigioco = (id_morto) =>{
    if(get_mod == "classic" || get_mod == "invasion"){
        velocita_ghost = pacman.speed/2;
    }else if(get_mod == "insane"){
        velocita_ghost = pacman.speed;
    }
    ghosts = ghosts.filter((ghost) => ghost.id !== id_morto);


    
        let newGhost = new Ghost(                                        
            id = id_morto,
            infetto = 1,
            9 * oneBlockSize + (id_morto % 2 == 0 ? 0 : 1) * oneBlockSize,     
            10 * oneBlockSize + (id_morto % 2 == 0 ? 0 : 1) * oneBlockSize,    
            oneBlockSize,                                             
            oneBlockSize,                                             
            velocita_ghost,                                       
            pos_img_fantasma[id_morto % 4].x,                     
            pos_img_fantasma[id_morto % 4].y,                           
            124,                                                      
            116,                                                        
            7 + id_morto                                            
        );
        ghosts.push(newGhost);                                     
    
    CasoMenoFantasmini();
}

creaNuovoPacman();
creaNuoviGhosts();
gameLoop();

window.addEventListener("keydown", (event) => {
    let k = event.keyCode;
    setTimeout(() => {
        if (k == 37 || k == 65) {
            // left arrow or a
            pacman.nextDirection = DIRECTION_LEFT;
        } else if (k == 38 || k == 87) {
            // up arrow or w
            pacman.nextDirection = DIRECTION_UP;
        } else if (k == 39 || k == 68) {
            // right arrow or d
            pacman.nextDirection = DIRECTION_RIGHT;
        } else if (k == 40 || k == 83) {
            // bottom arrow or s
            pacman.nextDirection = DIRECTION_BOTTOM;
        }
    }, 1);
});

