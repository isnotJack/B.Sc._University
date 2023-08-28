#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#define REQUEST_LEN 3

struct prenotazione{
    char cognome[20];
    int num_persone;
    char data[9];
    int HH;
};


void stampa(){
    printf("\nfind --> ricerca la disponibilità per una prenotazione\n");
    printf("book --> invia una prenotazione\n");
    printf("esc  --> termina il client\n");
}

int main(int argc, char* argv[]){
    int ret, sd, len;
    char choose[10];
    char buffer[2024];
    uint16_t lmsg;
    struct sockaddr_in srv_addr;
    uint16_t port = (uint16_t)strtol(argv[1],NULL,10);
    char riga[100];
    int numero_choose;
    //char* id = "CL\0"; 
    char *cmd = "C\0";
    
    sd = socket(AF_INET,SOCK_STREAM,0);

    memset(&srv_addr, 0, sizeof(srv_addr));
    srv_addr.sin_family = AF_INET;
    srv_addr.sin_port = htons(port);
    inet_pton(AF_INET, "127.0.0.1", &srv_addr.sin_addr);

    
    ret = connect(sd, (struct sockaddr*)&srv_addr, sizeof(srv_addr));
     ret = send(sd, cmd, strlen(cmd)+1, 0);
    
    if(ret < 0){
        perror("Errore in fase di connessione: \n");
        exit(1);
    }

    for(;;){    
        stampa();

        struct prenotazione p;
        //scanf("%s %s %d %s %d",choose,p.cognome,&p.num_persone, p.data, &p.HH);
        fgets(riga, 100, stdin);
        /*non dobbiamo farla più*/
        //ret = send(sd, id, strlen(id)+1, 0);
        
        if(sscanf(riga, "%s %s %d %s %d",choose,p.cognome,&p.num_persone, p.data, &p.HH ) == 5){
            
            if(strcmp(choose, "find")== 0){
            //printf("\nsei nella find ");
        
            printf("\ncognome %s, numero %d, data %s, ora %d \n",p.cognome,p.num_persone, p.data, p.HH);
            

            ret = send(sd, choose, strlen(choose)+1, 0);

            sprintf(buffer,"%s %d %s %d" , p.cognome, p.num_persone, p.data, p.HH);
            len = strlen(buffer)+1;
            lmsg = htons(len);
            ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
            ret = send(sd, (void*) buffer, len, 0);
            

                ret = recv(sd, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(sd, (void*)buffer, len, 0); 
                printf("%s\n", buffer);
                //sscanf(buffer, "%s %s %s", tav.nome_tavolo, tav.nome_sala, tav.vicinanza);
                //printf("%s %s %s\n",tav.nome_tavolo, tav.nome_sala, tav.vicinanza);
                
        }
        }else if(sscanf(riga, "%s %d", choose, &numero_choose) == 2){
            
            if(strcmp(choose, "book")== 0){
            //printf("SONO NELLA BOOK %d", numero_choose);
            ret = send(sd, choose, strlen(choose)+1, 0);

            sprintf(buffer,"%d", numero_choose);
            len = strlen(buffer)+1;
            lmsg = htons(len);
            ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
            ret = send(sd, (void*) buffer, len, 0);

            ret = recv(sd, (void*)buffer, REQUEST_LEN, 0);
            if(strcmp(buffer,"OK\0")==0){
                printf("\nPRENOTAZIONE EFFETTUATA");
            }
            ret = recv(sd, (void*)&lmsg, sizeof(uint16_t), 0);
            // Conversione in formato 'host'
            len = ntohs(lmsg); 
            // Ricezione del messaggio
            ret = recv(sd, (void*)buffer, len, 0);
            printf("\n%s", buffer);
        }
        }else if(sscanf(riga, "%s", choose) == 1){
            //printf("ha funzionato la esc");
            if(strcmp(choose, "esc")== 0){
            printf("ARRIVEDERCI\n");
            close(sd);
            break;
        }
        }
        else {
            printf("input non valido");
        }

        

    
}
//return 0;
}
