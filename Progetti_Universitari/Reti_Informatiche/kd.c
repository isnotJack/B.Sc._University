#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <math.h>

#define BUFFER_SIZE 1024
#define max(a, b) ((a) > (b) ? (a) : (b))

#define MENU_SIZE 8
#define COMANDA_SIZE 4
#define TAV_SIZE 4

struct table{
    int numero_tav;
    struct comanda{
        int cod_comanda;
        int status; //0: in-attesa, 1: in-preparazione, 2: in-servizio
        struct menu{
            char codice[3];
            int quantita;
        }menu[MENU_SIZE];
    }com[COMANDA_SIZE];
}table[TAV_SIZE];

void menu(){
    printf("\ntake --> accetta una comanda");
    printf("\nshow --> mostra le comande accettate (in preparazione)");
    printf("\nset --> imposta lo stato della comanda\n");
}

int main(int argc, char* argv[]){
    int ret, len,i;
    int sd;
    int kd =1;
    //int kkd =1;
    uint16_t lmsg;
    char *cmd = "K\0";
    //char *cmdd= "OK\0";
    uint16_t port = (uint16_t)strtol(argv[1],NULL,10);
    struct sockaddr_in srv_addr;
    char buffer[BUFFER_SIZE];
    char buffer_take[BUFFER_SIZE];
    char buffer_show[BUFFER_SIZE];
    char new_buffer[BUFFER_SIZE];
    char choose[5];
    char riga[100];
    memset(riga, 0, sizeof(riga));
    char* id_take = "TAKE\0";
    char* id_show = "SHOW\0";
    char* id_set = "SET\0";
    //char* id = "KD1\0";
    char buffer_id_kd[BUFFER_SIZE];
    //char buffer_id_kkd[BUFFER_SIZE];
    //struct table table[TAV_SIZE];

    fd_set master;
    fd_set read_fds;
    int fdmax;

    FD_ZERO(&master);
    FD_ZERO(&read_fds);
    
    sd = socket(AF_INET, SOCK_STREAM, 0);

    /* Creazione indirizzo di bind */
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
    
    FD_SET(sd, &master);
    FD_SET(0, &master);
    //fdmax = listener;
    fdmax = max(sd, 0);//#define max(a, b) ((a) > (b) ? (a) : (b))
    menu();
    while(1){
        read_fds = master;
        ret = select(fdmax+1, &read_fds, NULL, NULL, NULL);
        if(ret<0){
            perror("ERRORE SELECT:");
            exit(1);
        }
        for(i=0; i<= fdmax; i++){
            if(FD_ISSET(i, &read_fds)) {
                if(i == 0) {
                    scanf("%s", choose);
                    //printf("sono arrivato qui:%s\n", choose);
                    if(strcmp(choose,"take\0")==0){
                        ret = send(sd, id_take, strlen(id_take)+1, 0);
                        //printf("\nHA SCELTO TAKE\n");

                        ret = recv(sd, (void*)&lmsg, sizeof(uint16_t), 0);
                        // Conversione in formato 'host'
                        len = ntohs(lmsg); 
                        // Ricezione del messaggio
                        ret = recv(sd, (void*)buffer_take, len, 0); 
                        printf("%s\n", buffer_take);

                        sprintf(buffer_id_kd, "%d", kd);
                        len = strlen(buffer_id_kd)+1;
                        lmsg = htons(len);
                        ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(sd, (void*) buffer_id_kd, len, 0);

                        //sscanf(buffer_take, " %s %d %s %d" , p.cognome, &p.num_persone, p.data, &p.HH);
                

                    }
                    if(strcmp(choose,"show\0")==0){
                        ret = send(sd, id_show, strlen(id_show)+1, 0);
                        //printf("\nHA SCELTO SHOW\n");

                        
                        sprintf(buffer_id_kd, "%d", kd);
                        len = strlen(buffer_id_kd)+1;
                        lmsg = htons(len);
                        ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(sd, (void*) buffer_id_kd, len, 0);

                        ret = recv(sd, (void*)&lmsg, sizeof(uint16_t), 0);
                        // Conversione in formato 'host'
                        len = ntohs(lmsg); 
                        // Ricezione del messaggio
                        ret = recv(sd, (void*)buffer_show, len, 0); 
                        printf("\nLe comande accettate da questo kd sono:");
                        printf("%s\n", buffer_show);
                    }
                    if(strcmp(choose,"set\0")==0){
                        scanf("%s", riga);
                        ret = send(sd, id_set, strlen(id_set)+1, 0);

                       
                        int len=0;                    
                        //if (riga[strlen(riga) -1] == '\n') riga[strlen(riga)-1] = '\0';
                        //printf("\nla riga è:%s\n",riga);
                        len = strlen(riga)+1;
                        lmsg = htons(len);
                        ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(sd, (void*) riga, len, 0);
                        
                        ret = recv(sd, (void*)new_buffer, 3, 0);
                        if(strcmp(new_buffer,"OK\0")==0){
                            printf("COMANDA IN SERVIZIO\n");
                        }
                        
                    }
                    /*FD_SET(new_sd, &master);
                    if(new_sd > fdmax){fdmax = new_sd;}*/
                }else{
                    
                   
                    ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                    len = ntohs(lmsg); 
                    ret = recv(i, (void*)buffer, len, 0);

                    printf("\nhai ricevuto: %s\n",buffer);
                    //ret = send(i, cmdd, strlen(cmdd)+1, 0);
                    //}
                }
            }//fine fdset
        }//fine for 1
    }//fine while
}
    //RICORDA: ALLA PRIMA RECV DI CHIUDERE TUTTO