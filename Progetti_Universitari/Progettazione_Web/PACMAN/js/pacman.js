class Pacman {
    constructor(x, y, width, height, speed) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.speed = speed;
        this.direction = 4;
        this.nextDirection = 0;         //4 per farlo andare subito a dx
        this.frameCount = 7;            //sono i 7 diversi stati del pacman
        this.currentFrame = 1;          //è il frame corrente
        setInterval(() => {
            this.changeAnimation();
        }, 100);
    }
    

    moveProcess() {
        this.slidingPacman();
        this.checkPallinaBlu();

        this.changeDirectionIfPossible();           // verifica se il personaggio ha ricevuto un comando per cambiare direzione
        this.moveForwards();                        //il personaggio viene spostato nella sua direzione corrente di un certo valore 
        if (this.checkCollisions()) {               
            this.moveBackwards();                   //il personaggio viene spostato indietro nella sua posizione precedente (prima del movimento) per evitare di attraversare muri
            return;
        }
    }

    checkPallinaBlu(){


        if ((this.x == 20 && this.y == 20 || this.x == 380 && this.y == 20 || this.x == 20 && this.y == 420 || this.x == 380 && this.y == 420) 
            && !triggeredCoords.includes(`${this.x}-${this.y}`)) {
                if (isUserInteracted) 
                    sound_5.play();
            pallinaBlu = 1;
            for(let i=0; i<ghosts.length; i++){
                if(ghosts[i].infetto == 1){
                    ghosts[i].infetto =0;
                }
            }
            triggeredCoords.push(`${this.x}-${this.y}`);
            pallinaBluEnabled = false; // disabilita il secondo ramo dell'if


            if(conta_volte >=0)
            clearTimeout(id_check[conta_volte]);     
            conta_volte++;                         

            id_check[conta_volte] = setTimeout(() => {
                pallinaBluEnabled = true; // ripristina la possibilità di entrare nel secondo ramo dell'if dopo 10 secondi
                // rimuove le coordinate dalla lista dopo 10 secondi

            }, 10000);
            
            setTimeout(() => {
                triggeredCoords = triggeredCoords.filter(coords => coords !== `${this.x}-${this.y}`);
            }, 10000);

        } else if (pallinaBluEnabled) {
            pallinaBlu = 0;
        }
    }

    eat() {

        for (let i = 0; i < map.length; i++) {
            for (let j = 0; j < map[0].length; j++) {
                if (
                    map[i][j] == 2 &&
                    this.getMapX() == j &&
                    this.getMapY() == i
                ) {

                    map[i][j] = 3;
                    score++;
                    if (isUserInteracted) {
                        if (soundIndex === 0) {
                            sound.play();
                            soundIndex = 1;
                        } else {
                            sound_2.play();
                            soundIndex = 0;
                        }
                    }
                    
                }
            }
        }
    }


    moveBackwards() {
        switch (this.direction) {
            case DIRECTION_RIGHT: // Right
                this.x -= this.speed;
                break;
            case DIRECTION_UP: // Up
                this.y += this.speed;
                break;
            case DIRECTION_LEFT: // Left
                this.x += this.speed;
                break;
            case DIRECTION_BOTTOM: // Bottom
                this.y -= this.speed;
                break;
        }
    }
    moveForwards() {
        switch (this.direction) {
            case DIRECTION_RIGHT: // Right
                this.x += this.speed;
                break;
            case DIRECTION_UP: // Up
                this.y -= this.speed;
                break;
            case DIRECTION_LEFT: // Left
                this.x -= this.speed;
                break;
            case DIRECTION_BOTTOM: // Bottom
                this.y += this.speed;
                break;
        }
    }

    checkCollisions() {
        let isCollided = false;
        if (
            map[this.getMapY()][            
                this.getMapX()
            ] == 1 ||
            map[this.getMapYRightSide()][   
                this.getMapX()
            ] == 1 ||
            map[this.getMapY()][            
                this.getMapXRightSide()
            ] == 1 ||
            map[this.getMapYRightSide()][   
                this.getMapXRightSide()
            ] == 1
        ) {
            isCollided = true;
        }
        return isCollided;
    }

    
    slidingPacman() {

        if (this.x == 0 && this.y == 200) {

            this.x = 404;
            this.y = 200;
        }else if (this.x == 404 && this.y == 200) {

            this.x = 0;
            this.y = 200;
        }
    }

    checkGhostCollision(ghosts) {
        for (let i = 0; i < ghosts.length; i++) {
            let ghost = ghosts[i];
            if (
                ghost.getMapX() == this.getMapX() &&
                ghost.getMapY() == this.getMapY()
            ) {
                return true;
            }
        }
        return false;
    }

    checkGhostCollision_blu(ghosts) {
        for (let i = 0; i < ghosts.length; i++) {
            let ghost = ghosts[i];
            if (
                ghost.getMapX() == this.getMapX() &&
                ghost.getMapY() == this.getMapY()
            ) {
                return ghosts[i].id;
            }
        }
        return false;
    }

    checkGhostCollision_singolo(ghosts) {
        for (let i = 0; i < ghosts.length; i++) {
            let ghost = ghosts[i];
            if (
                ghost.getMapX() == this.getMapX() &&
                ghost.getMapY() == this.getMapY() &&
                ghosts[i].infetto == 1
            ) {
                
                return true;
            }
        }
        return false;
    }
    

    changeDirectionIfPossible() {
        if (this.direction == this.nextDirection) return;
        let tempDirection = this.direction;
        this.direction = this.nextDirection;
        this.moveForwards();                            //!!lo fa andare avanti -> necessario che lui vada avanti se no non sappiamo se ha preso un muro con la nuova direzione
        if (this.checkCollisions()) {                   //se ce collisione
            this.moveBackwards();                       //ritorna dov eri prima 
            this.direction = tempDirection;             //e restor della direzione
        } else {
            this.moveBackwards();                       //all'inizio lo abbiamo fatto andare avanti
        }
    }

    getMapX() { 
        let mapX = parseInt(this.x / oneBlockSize);
        return mapX;
    }
    getMapY() {
        let mapY = parseInt(this.y / oneBlockSize);

        return mapY;
    }
    getMapXRightSide() {
        let mapX = parseInt((this.x * 0.99 + oneBlockSize) / oneBlockSize);
        return mapX;
    }
    getMapYRightSide() {
        let mapY = parseInt((this.y * 0.99 + oneBlockSize) / oneBlockSize);
        return mapY;
    }

    changeAnimation() {
        this.currentFrame =
            this.currentFrame == this.frameCount ? 1 : this.currentFrame + 1;       //se è arrivato all'ultimo stato ritorna al primo se no cambia stato di uno
    }

    draw() {
        canvasContext.save();                                           // salva lo stato corrente del contesto di rendering della canvas.
        canvasContext.translate(                                        // sposta l'origine del sistema di riferimento del contesto di rendering
            this.x + oneBlockSize / 2,                                  //la figura viene posizionata al centro del blocco 
            this.y + oneBlockSize / 2                                   //in cui si trova il personaggio
        );
        canvasContext.rotate((this.direction * 90 * Math.PI) / 180);    /*L'angolo di rotazione viene calcolato moltiplicando this.direction per 90 gradi (che corrisponde all'angolo di rotazione di ogni spostamento) e convertendolo in radianti, che è il formato richiesto dalla funzione */
        canvasContext.translate(                                        //ritorniamo alla posizione originale
            -this.x - oneBlockSize / 2,
            -this.y - oneBlockSize / 2
        );
        canvasContext.drawImage(
            pacmanFrames,                                               //immagine da disegnare
            (this.currentFrame - 1) * oneBlockSize,                     //la posizione corretta dell'immagine da disegnare
            0,                                                          //contiene solo una riga di frame
            oneBlockSize,                                               //larghezza dell'immagine da disegnare.
            oneBlockSize,                                               //l'altezza dell'immagine da disegnare.
            this.x,                                                     //coordinate di Pac-Man sulla canvas
            this.y,
            this.width,                                                 //queste sono la larghezza e l'altezza dell'immagine di Pac-Man da disegnare
            this.height
        );
        canvasContext.restore();                                        //riportiamo tutto allo stato originale
    }
}