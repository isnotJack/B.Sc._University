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
#define max(a, b) ((a) > (b) ? (a) : (b))
#define REQUEST_LEN 3
#define MENU_SIZE 8
#define COMANDA_SIZE 10

    struct menu{
        char codice[3];
        char nome_piatto[30];
        int costo;
        int quantita;
    }menu[MENU_SIZE];

struct comanda{
    int cod_comanda;
    int status; //0: in-attesa, 1: in-preparazione, 2: in-servizio
    struct menu_com{
        char codice[2];
        //char nome_piatto[30];
        //int costo;
        int quantita;
    }menu_com[MENU_SIZE];
}com[COMANDA_SIZE];


void inserisci_menu(struct menu* menu, int index, FILE* fptr){
    fprintf(fptr,"%s",menu[index].codice);
    fprintf(fptr," %d",menu[index].costo);
    fprintf(fptr,"%s\n",menu[index].nome_piatto);

}
    
void stampa(){
    printf("\n*******************BENVENUTO*******************");
    printf("\nDigita un comando:");
    printf("\n1) help       --> mostra i dettagli dei comandi");
    printf("\n2) menu       --> mostra il menu dei piatti");
    printf("\n3) comanda    --> invia una comanda");
    printf("\n4) conto      --> chiede il conto\n");
    sleep(2);
    fflush(stdin);
}

int main(int argc, char* argv[]){
    int ret, sd, len,i;
    int in = 0;int ind=0;
    char choose[10];
    char buffer[2024];
    char new_buffer[1024];
    char buffer_conto[1024];
    uint16_t lmsg;
    struct sockaddr_in srv_addr;
    char riga[100];
    uint16_t port = (uint16_t)strtol(argv[1],NULL,10);
    //int numero_choose;
    int num_tavolo=1;
    //char* id = "TD\0"; 
    char *cmd = "T\0";
    //char *cmd_1 = "1\0";
    int cmd_new =1;
    char* id_comanda = "COMANDA\0";
    char* id_menu = "MENUMEN\0";
    char* id_conto = "CONTOCO\0";
    
    char cod_prenotazione[12];
    char buffer_comande[3];
    char buffer_num_tavolo[1024];

    char num[3];
    char num1[100];
    int num2=0;
    //char line[100];
    int conto_comande=0;
    int volte_autenticazione=0;
    struct comanda com[COMANDA_SIZE];
    struct menu menu[MENU_SIZE];

    FILE *fptr;

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

    //ret = send(sd, cmd_1, strlen(cmd_1)+1, 0); 
    ret = send(sd, (void*) &cmd_new, sizeof(uint16_t),0); 
    if(ret < 0){
        perror("Errore in fase di connessione: \n");
        exit(1);
    }

    
    FD_SET(sd, &master);
    FD_SET(0, &master);
    //fdmax = listener;
    fdmax = max(sd, 0);//#define max(a, b) ((a) > (b) ? (a) : (b))
    if(volte_autenticazione==0) printf("\nINSERISCI IL CODICE DI PRENOTAZIONE\n");
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
                    //for(;;){
                        //char buffer_autenticazione[3];
                    /*NON DOBBIAMO FARLA */
                    //ret = send(sd, id, strlen(id)+1, 0);
                    
                    //scanf("%d", &ada);
                    //printf("il num è:%d\n",ada);
                    if(volte_autenticazione==0){
                    /*sprintf(buffer_autenticazione, "%d", volte_autenticazione);
                                len = strlen(buffer_autenticazione)+1;
                                lmsg = htons(len);
                                ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(sd, (void*) buffer_autenticazione, len, 0);*/
                    
                    //if(volte_autenticazione==0){            
                            //printf("\nINSERISCI IL CODICE DI PRENOTAZIONE\n");
                            //ret = send(sd, id, strlen(id)+1, 0);
                            scanf("%s", cod_prenotazione);
                            ret = send(sd, cod_prenotazione, strlen(cod_prenotazione)+1, 0);
                            ret = recv(sd, (void*)buffer, REQUEST_LEN, 0);}

                        if(strcmp(buffer,"OK\0")==0){
                            
                            if(volte_autenticazione==0) {
                                printf("\nIL CODICE E' CORRETTO\n");
                                stampa();}
                            volte_autenticazione++;
                                
                            //for(;;){
                                //printf("ho fatto il giro");
                                scanf("%s", choose);
                                fgets(riga, 100, stdin);
                                //printf("sono arrivato qui:%s\n", choose);
                                //printf("la riga e:%s", riga);
                                if(strcmp(choose,"help\0")==0){
                                    printf("\nDigita:");
                                    printf("\n Menu: per mostrare il menu;");
                                    printf("\n Comanda {<patto_1-quantità_1>...<patto_n-quantità_n>}: per ordinare n piatti;");
                                    printf("\n Conto: per richiedere il conto dei piatti ordinati;\n");
                                }else if(strcmp(choose,"menu\0")==0){
                                ret = send(sd, id_menu, strlen(id_menu)+1, 0);    
                                    
                                        //printf("SEI NEL:%s\n", choose);
                                    
                                            //printf("SEI NEL MENU\n");
                                        //popola menu
                                        
                                        if ((fptr = fopen("menu.txt","r")) == NULL){
                                            printf("Error! opening file");

                                            // Program exits if the file pointer returns NULL.
                                            exit(1);
                                        }
                                            int prv;
                                            for( prv=0;prv<MENU_SIZE; prv++){
                                            
                                            fscanf(fptr,"%s", num);
                                            strcpy(menu[prv].codice,num);
                                            
                                            fscanf(fptr,"%d", &num2);
                                            menu[prv].costo = num2; 
                                            
                                            fscanf(fptr,"%[^\n]s", num1);
                                            strcpy(menu[prv].nome_piatto,num1);
                                            
                                            }       
                                            fclose(fptr);
                                            for(prv=0;prv<MENU_SIZE; prv++){

                                            printf("%s %s %d\n",menu[prv].codice,menu[prv].nome_piatto, menu[prv].costo);

                                            }
                                        //scriviamolo in un file 
                                        fptr = fopen("menu.txt","w");
                                        if(fptr == NULL)
                                        {
                                            printf("Error!");   
                                            exit(1);             
                                        }
                                        int indice;
                                        for(indice=0;indice<MENU_SIZE; indice++){
                                            inserisci_menu(menu, indice, fptr);
                                        }

                                        fclose(fptr); 
                                        
                                
                                }else if(strcmp(choose,"comanda\0")==0){
                                ret = send(sd, id_comanda, strlen(id_comanda)+1, 0);    
                                //printf("\nsei nella comanda\n");
                                
                                // Rimuovi il carattere di nuova riga
                                if (riga[strlen(riga) - 1] == '\n') riga[strlen(riga) - 1] = '\0';
                                //printf("\nla riga è: %s\n",riga);
                                len = strlen(riga)+1;
                                lmsg = htons(len);
                                ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(sd, (void*) riga, len, 0);
                                /*invia il numero del tavolo*/
                                sprintf(buffer_num_tavolo, "%d", num_tavolo);
                                len = strlen(buffer_num_tavolo)+1;
                                lmsg = htons(len);
                                ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(sd, (void*) buffer_num_tavolo, len, 0);
                                
                                // Stampa ogni carattere della riga
                                sprintf(buffer_comande, "%d", conto_comande);
                                len = strlen(buffer_comande)+1;
                                lmsg = htons(len);
                                ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(sd, (void*) buffer_comande, len, 0);
                                char buffer_stato[2];
                                com[conto_comande].cod_comanda = conto_comande;
                                //recv dello stato
                                ret = recv(sd, (void*)buffer_stato, 4, 0);
                                sscanf(buffer_stato, "%d", &com[conto_comande].status);
                                //com[conto_comande].status =0;
                                //printf("\nLO STATO DELLA COMANDA E:%d\n", com[conto_comande].status);
                                int volte=0;
                                in =0; ind=0;
                                while (riga[in] != '\0') {
                                    //ind++;
                                    if(in==ind) ind++;
                                    //printf("\n(1):%c", riga[ind]);
                                    com[conto_comande].menu_com[volte].codice[0] = riga[ind];    
                                    //printf("\nIL CODICE E:%c",com[conto_comande].menu_com[volte].codice[0] );
                                    ind++;
                                    //printf("\n(2):%c", riga[ind]);
                                    com[conto_comande].menu_com[volte].codice[1] = riga[ind];
                                    com[conto_comande].menu_com[volte].codice[2] = '\0';
                                    //printf("\nIL CODICE E:%c",com[conto_comande].menu_com[volte].codice[1] );   
                                    ind++;
                                    //printf("\n(3):%c", riga[ind]);
                                    ind++;
                                    //printf("\n(4):%c", riga[ind]);
                                    com[conto_comande].menu_com[volte].quantita = riga[ind];
                                    com[conto_comande].menu_com[volte].quantita -= 48;
                                    //printf("\nLA QUANTITA E:%d\n",com[0].menu[volte].quantita);
                                    ind++;
                                    volte++;
                                    in+=5;
                                }        
                                //printf("com_num %d\n", conto_comande);   
                                    int ss_com;
                                    printf("\nHai inserito:");
                                    for(ss_com=0; ss_com<volte; ss_com++){
                                        fflush(stdout);
                                        printf("\n Numero comanda:%d",com[conto_comande].cod_comanda);
                                        printf("\n Codice piatto:%s",com[conto_comande].menu_com[ss_com].codice);
                                        printf("\n Quantità:%d\n",com[conto_comande].menu_com[ss_com].quantita);
                                    }
                                
                                ret = recv(sd, (void*)new_buffer, REQUEST_LEN, 0);
                                if(strcmp(new_buffer,"OK\0")==0){
                                    printf("\nCOMANDA RICEVUTA\n");
                                }
                    
                                if(com[conto_comande].status==0){
                                    printf("\nCOMANDA <in attesa>\n");
                                }else if(com[conto_comande].status==1){
                                    printf("\nCOMANDA <in preparazione>");
                                }else if(com[conto_comande].status==2){
                                    printf("\nCOMANDA <in servizio>");
                                }

                                conto_comande++;
                                }else if(strcmp(choose,"conto")==0){
                                    ret = send(sd, id_conto, strlen(id_conto)+1, 0); 
                                    //printf("sei nel conto");
                                    sprintf(buffer_num_tavolo, "%d", num_tavolo);
                                    len = strlen(buffer_num_tavolo)+1;
                                    lmsg = htons(len);
                                    ret = send(sd, (void*) &lmsg, sizeof(uint16_t),0);
                                    ret = send(sd, (void*) buffer_num_tavolo, len, 0);
                                    
                                    ret = recv(sd, (void*)&lmsg, sizeof(uint16_t), 0);
                                    // Conversione in formato 'host'
                                    len = ntohs(lmsg); 
                                    // Ricezione del messaggio
                                    ret = recv(sd, (void*)buffer_conto, len, 0); 
                                    printf("%s\n", buffer_conto);

                                }
                            }
                        
                        //}
                }else{
                    char buffer_take[1024];
                    ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                    // Conversione in formato 'host'
                    len = ntohs(lmsg); 
                    // Ricezione del messaggio
                    ret = recv(i, (void*)buffer_take, len, 0); 
                    printf("%s\n", buffer_take);
                }
            }//fine fdset
        }//fine for 1
    }//fine while
}
    //RICORDA: ALLA PRIMA RECV DI CHIUDERE TUTTO