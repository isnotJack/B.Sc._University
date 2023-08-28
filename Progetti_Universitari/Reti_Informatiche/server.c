#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define BUFFER_SIZE 1024

#define WEEK_SIZE 7
#define ROOM_SIZE 3
#define TABLE_SIZE 20
#define HOUR_SIZE 24

#define CHOOSE_LEN 5
#define ID_LEN 3
#define ID_BOOK_LEN 12

#define MENU_SIZE 8
#define COMANDA_SIZE 4
#define TAV_SIZE 4

#define MAX_DEVICE 10

typedef struct {
int sd;
char tp;
} device;

/*struct usate per memorizzare i vari socket
  che si connettono al server (device_2 memorizza solo i vari td)*/

typedef struct {
int sd;
int tp;
} device_2;

/*struct usata per memorizzare per ogni giorno della settimana le sale(3), per ogni sala il tavolo(20),
  per ogni tavolo le varie ore in cui è disponibile*/

struct settimana{
    int nome_giorno;
    struct sala{
        char nome_sala[6];           
        struct tavolo{
            char nome_tavolo[4];
            char vicinanza[20];
            int num_posti;
                struct status{
                    int HHT;
                    int stato;
                }status[HOUR_SIZE];
        }tav[TABLE_SIZE];   
    }sala[ROOM_SIZE];
}sett[WEEK_SIZE];

/*usato nella find per memorizzare ogni singola prenotazione arrivata*/
struct prenotazione{
    char cognome[20];
    int num_persone;
    char data[9];
    int HH;
};

//il td può inviare 4 comande, per ogni comanda può ordinare al max 8 piatti(cioè tutto il menu)
struct table{
    int numero_tav;
    struct comanda{
        int cod_comanda;
        int status; //0: in-attesa, 1: in-preparazione, 2: in-servizio
        struct menu{
            char codice[3];
            //char nome_piatto[30];
            //int costo;
            int quantita;
        }menu[MENU_SIZE];
    }com[COMANDA_SIZE];
}table[TAV_SIZE];

/*la carica_device apre il file e carica il num socket corrispondente e il tipo*/
void carica_device(device*d, int numdevice){
    FILE*fptr;
    fptr=fopen("connessioni.txt","w");
    if(fptr == NULL)
    {
      printf("Error!");   
      exit(1);             
    }
    int i_f;
    for(i_f=0; i_f<numdevice; i_f++){
        fprintf(fptr,"%d %c \n", d[i_f].sd, d[i_f].tp);
    }
    fclose(fptr);
}

// fa la stessa cosa della carica_device, solo che invece del tipo memorizza il numero del td
void carica_device_2(device_2*d_2, int numdevice){
    FILE*fptr;
    fptr=fopen("connessioni_2.txt","w");
    if(fptr == NULL)
    {
      printf("Error!");   
      exit(1);             
    }
    int i_f;
    for(i_f=0; i_f<numdevice; i_f++){
        fprintf(fptr,"%d %d \n", d_2[i_f].sd, d_2[i_f].tp);
    }
    fclose(fptr);
}

int  leggi_tipo(int newsocket, char* newtype, int numdevice){
    FILE* fptr;
    int socket=0;
    char type;
    int controllo=0;
    int i;
    if((fptr = fopen("connessioni.txt","r")) == NULL){
       printf("Error! opening file");
       // Program exits if the file pointer returns NULL.
       exit(1);
    }
    for( i=0; i<numdevice; i++){
      fscanf(fptr,"%d %c",&socket,&type );

        printf("\nil socket è %d, il new %d", socket, newsocket);
      if(socket==newsocket){ //se quello che prende dal file è uguale a quello NUOVO
        *newtype=type;       // Aggiorna type
        controllo=1;         // metti controllo a 1
      }
      
    }
    return controllo;       //se non lo trovi metti controllo a 0
    fclose(fptr);
}

int  leggi_tipo_2(int newsocket, int* newtype, int numdevice){
    FILE* fptr;
    int socket=0;
    int type;
    int controllo=0;
    int i;
    if((fptr = fopen("connessioni_2.txt","r")) == NULL){
       printf("Error! opening file");
       // Program exits if the file pointer returns NULL.
       exit(1);
    }
    for( i=0; i<numdevice; i++){
      fscanf(fptr,"%d %d",&socket,&type );

        printf("\nil socket è %d, il new %d", socket, newsocket);
      if(socket==newsocket){ //se quello che prende dal file è uguale a quello NUOVO
        *newtype=type;       // Aggiorna type
        controllo=1;         // metti controllo a 1
      }
      
    }
    return controllo;       //se non lo trovi metti controllo a 0
    fclose(fptr);
}

//usata nella book per inserire una prenotazione effettuata dal client in registro_prenotazione.txt
void inserisci_prenotazione(struct settimana* sett,int index, FILE* fptr){

//    printf("il numero è %d\n", index);
//    printf("il nome è %d\n",sett[index].nome_giorno );
int j;int k; int g;
    fprintf(fptr,"\n%d",sett[index].nome_giorno);
     for(j = 0; j<ROOM_SIZE; j++){
        fprintf(fptr,"\n%s",sett[index].sala[j].nome_sala);
        for(k = 0; k<TABLE_SIZE; k++){
            fprintf(fptr,"\n%s",sett[index].sala[j].tav[k].nome_tavolo);
            fprintf(fptr," %s",sett[index].sala[j].tav[k].vicinanza);
            fprintf(fptr," %d",sett[index].sala[j].tav[k].num_posti);
               for(g=0; g<HOUR_SIZE;g++){
                fprintf(fptr,"\n%d",sett[index].sala[j].tav[k].status[g].HHT);
                fprintf(fptr," %d",sett[index].sala[j].tav[k].status[g].stato);
               } 
        }
     }

}
//inserisce una comanda dentro comanda.txt
void inserisci_comanda(struct table* table, int index, FILE* fptr, int volte){
    //char* eof= "FINE\0";
    fprintf(fptr,"\n%d",table[0].numero_tav);
    fprintf(fptr," %d",table[0].com[index].cod_comanda);
    fprintf(fptr," %d",table[0].com[index].status);
    fprintf(fptr," 0");  
    int j;
    for(j=0; j<volte;j++){
    fprintf(fptr,"\n%s",table[0].com[index].menu[j].codice);
    fprintf(fptr," %d",table[0].com[index].menu[j].quantita);  
    if(j == volte -1){
        fprintf(fptr,"\nNO");
    }else{
        fprintf(fptr,"\nSI");
    }
    }
    //fprintf(fptr,"\nNO\0"); 
    
}

void inserisci_comanda2(struct table* table, int index, FILE* fptr, int volte){
    //char* eof= "FINE\0";
    fprintf(fptr,"\n%d",table[1].numero_tav);
    fprintf(fptr," %d",table[1].com[index].cod_comanda);
    fprintf(fptr," %d",table[1].com[index].status);  
    fprintf(fptr," 0");
    int j;
    for(j=0; j<volte;j++){
    fprintf(fptr,"\n%s",table[1].com[index].menu[j].codice);
    fprintf(fptr," %d",table[1].com[index].menu[j].quantita);  
    if(j == volte -1){
        fprintf(fptr,"\nNO");
    }else{
        fprintf(fptr,"\nSI");
    }
    }
    //fprintf(fptr,"\nNO\0"); 
    
}

/* 
void copia_kd(){
    FILE *fp1, *fp2;
    char buffer_copia[BUFFER_SIZE];
    int n;

    fp1 = fopen("comanda.txt", "rb");
    fp2 = fopen("comanda_kd.txt", "wb");
    if (fp1 == NULL || fp2 == NULL) {
        printf("Errore nell'apertura dei file\n");
        
    }
    while ((n = fread(buffer_copia, 1, BUFFER_SIZE, fp1)) > 0)
    fwrite(buffer_copia, 1, n, fp2);

    fclose(fp1);
    fclose(fp2);
   
}
*/
//usata nella take per cambiare lo stato della comanda nello stato in attesa da più tempo
void cambia_stato(struct table* table, int n_for){

    FILE *fp;
    char nume5[3];int intero=0;
    //n_for=1;
    printf("\n n_for %d:", n_for);

    fp = fopen("comanda.txt", "r+");
    if (fp == NULL) {
      perror("Errore apertura file");
    }
    int n_s;int nn;
    for(n_s=0; n_s<n_for+1;n_s++){    
        fscanf(fp,"%*d");
        fscanf(fp,"%*d");
        if(n_s == n_for){
            fscanf(fp,"%d",&intero);
            fseek(fp, -1 , SEEK_CUR);
            intero=1;
            fprintf(fp,"%d",intero);
            fscanf(fp,"%*d");
        }else{
            fscanf(fp,"%*d");
            fscanf(fp,"%*d");
        }
        for(nn=0; nn<MENU_SIZE; nn++){
            fscanf(fp,"%*s");
            fscanf(fp,"%*d");
            fscanf(fp,"%s",nume5);
            if(strcmp(nume5, "NO\0")==0 ){
            break;
            }
        }
        fscanf(fp,"%*s");
    }
}
//come la cambia stato, solo che invece cambia il kd di chi ha effettuato la take
/*mi spiego meglio:
comanda.txt è organizzata così -> 0(rapp. il tavolo) 0(rapp. la comanda) 0(rapp. lo stato) 0(rapp. il kd)
ovviamente il kd quando si inserisce la comanda è 0, quando un kd fa la take viene aggiornato il campo relativo
con il numero del kd che ha accettato la comanda*/
void aggiorna_kd(struct table* table, int command, int tab, int kd){
    FILE *fp3;
    
    fp3 = fopen("comanda.txt", "r+");
    if (fp3 == NULL) {
        printf("Errore nell'apertura dei file\n");
        
    }
    char nume5[3];int intero=0;
    int n=0;int n1=0;int a_k;int nn;

    for(a_k =0; a_k<COMANDA_SIZE*2; a_k++){
        fscanf(fp3,"%d", &n1);
        if(n1 == tab){
            fscanf(fp3,"%d", &n);
            if(n == command){
                fscanf(fp3,"%*d");
                fscanf(fp3,"%d",&intero);
                fseek(fp3, -1 , SEEK_CUR);
                intero=kd;
                fprintf(fp3,"%d",intero);
                command = 100;
                for(nn=0; nn<MENU_SIZE; nn++){
                    fscanf(fp3,"%*s");
                    fscanf(fp3,"%*d");
                    fscanf(fp3,"%s",nume5);
                    if(strcmp(nume5, "NO\0")==0 ){
                        break;
                    }
                }
            }else{
            fscanf(fp3,"%*d");
            fscanf(fp3,"%*d");
            for(nn=0; nn<MENU_SIZE; nn++){
                    fscanf(fp3,"%*s");
                    fscanf(fp3,"%*d");
                    fscanf(fp3,"%s",nume5);
                    if(strcmp(nume5, "NO\0")==0 ){
                        break;
                    }
            }    
            }
        }else{
            fscanf(fp3,"%*d");
            fscanf(fp3,"%*d");
            fscanf(fp3,"%*d");
            for(nn=0; nn<MENU_SIZE; nn++){
                    fscanf(fp3,"%*s");
                    fscanf(fp3,"%*d");
                    fscanf(fp3,"%s",nume5);
                    if(strcmp(nume5, "NO\0")==0 ){
                        break;
                    }
            } 
        }
    fscanf(fp3,"%*s");
    
    }
}
/*per la comanda il tavolo e il kd che ha richiesto la set va impostare la comanda nello stato in servizio*/
void aggiorna_set(int name_tavolo, int name_comanda, int ki_dev, int* ritorno){
    FILE *fp4;
    
    fp4 = fopen("comanda.txt", "r+");
    if (fp4 == NULL) {
        printf("Errore nell'apertura dei file\n");
        
    }
    int intero=2;char nume5[3];
    int n=0;int n1=0;int n2=0;int n4; 
    int a_s;int nn;
    for(a_s =0; a_s<COMANDA_SIZE*2; a_s++){
        fscanf(fp4,"%d", &n1);
        if(n1 == name_tavolo){
            fscanf(fp4,"%d", &n);
            if(n == name_comanda){
                fscanf(fp4,"%*d");
                fscanf(fp4,"%d",&n2);
                    if(n2 == ki_dev){
                        *ritorno= *ritorno +1;
                        fseek(fp4, -3 , SEEK_CUR);
                        fprintf(fp4,"%d",intero);
                        fscanf(fp4,"%d",&n4);
                        //printf("\nVEDIAMO N4:%d\n",n4);
                        for( nn=0; nn<MENU_SIZE; nn++){
                            fscanf(fp4,"%*s");
                            fscanf(fp4,"%*d");
                            fscanf(fp4,"%s",nume5);
                            if(strcmp(nume5, "NO\0")==0 ){
                                break;
                            }
                        }
                    }else{
                        for(nn=0; nn<MENU_SIZE; nn++){
                            fscanf(fp4,"%*s");
                            fscanf(fp4,"%*d");
                            fscanf(fp4,"%s",nume5);
                            if(strcmp(nume5, "NO\0")==0 ){
                                break;
                            }
                        }    
                    }
                }else{
                    fscanf(fp4,"%*d");
                    fscanf(fp4,"%*d");
                    for(nn=0; nn<MENU_SIZE; nn++){
                            fscanf(fp4,"%*s");
                            fscanf(fp4,"%*d");
                            fscanf(fp4,"%s",nume5);
                            if(strcmp(nume5, "NO\0")==0 ){
                                break;
                            }
                    }
                }
            }else{
                fscanf(fp4,"%*d");
                fscanf(fp4,"%*d");
                fscanf(fp4,"%*d");
                for(nn=0; nn<MENU_SIZE; nn++){
                        fscanf(fp4,"%*s");
                        fscanf(fp4,"%*d");
                        fscanf(fp4,"%s",nume5);
                        if(strcmp(nume5, "NO\0")==0 ){
                            break;
                        }
                } 
            }
            
            fscanf(fp4,"%*s");
        }
    fclose(fp4);
}
/*serve in conto per andare a prendere per quel relativo codice dal menu il costo*/
void leggi_da_menu(char codice[3], int *soldi){
    FILE *fp5;
    
    fp5 = fopen("menu.txt", "r");
    if (fp5 == NULL) {
        printf("Errore nell'apertura dei file\n");
        
    }
    char lm[3]; int lm1;
    int i;
    for(i=0; i<MENU_SIZE;i++){
        fscanf(fp5,"%s",lm);
        printf("\nIL CODICE GIUSTO:%s",lm);
        if(strcmp(lm,codice)==0){
            fscanf(fp5,"%d",&lm1);
            printf("\nI SOLDI GIUSTI:%d",lm1);
            *soldi = lm1;
            
        }else{
            fscanf(fp5,"%*d");
        }
        fscanf(fp5,"%*[^\n]s");
    }
    fclose(fp5);
}
/*utilizzata nella stop del server per andare a leggere dal file connessioni.txt(contiene tutti i socket connessi)
tutti i socket e andarli a chiudere tutti*/
void chiudi_tutto(){
    FILE *fp6;
    
    fp6 = fopen("connessioni.txt", "r");
    if (fp6 == NULL) {
        printf("Errore nell'apertura dei file\n");
        
    }char str[100];
    int pp=0;
    while (fgets(str, 100, fp6) != NULL) { 
        fscanf(fp6,"%d", &pp);
        printf("\nil socket:%d",pp);
        fscanf(fp6,"%*c");
       
        close(pp);
    }

    fclose(fp6);
}

int main(int argc, char* argv[]){
    int ret, new_sd, len,i;
    int listener;
    int find,find2;
    int count=0;
    int numero_choose=0;
    uint16_t lmsg; 
    struct sockaddr_in my_addr, cl_addr;
    uint16_t port = (uint16_t)strtol(argv[1],NULL,10);
    char buffer[BUFFER_SIZE];
    char buffer_hour[BUFFER_SIZE];
    char choose_buffer[BUFFER_SIZE];
    char buffer_id_comanda[9];
    char buffer_id_take[5];
    char buffer_take[BUFFER_SIZE];
    char buffer_take1[100];
    char buffer_show[BUFFER_SIZE];
    char buffer_show1[100];
    char buffer_conto[BUFFER_SIZE];
    char buffer_conto1[100];
   
    char id_book_buffer[ID_BOOK_LEN];
    char firstTwo[3];char firstTwo2[3];
    char newbuf[10024];
    char* cmd = "OK\0"; 
    char tavolo[4];
    char sala[6];
    char codice_prenotazioni[ID_BOOK_LEN];
    char ch[ID_BOOK_LEN];

    int num=0;
    char num1[6];
    char num2[3];
    char num3[15];
    int num4=0;
    int num5=0;
    int num6=0;

    char riga[100];
    int ind=0;
    int in=0;
    int volte_autenticazione=0;

    char type;
    int numdevice=0;
    int check=0;
    //int controllo=0;

    int socket_scorri;
    char type_scorri;

    int kd=0;
    char buffer_kd[BUFFER_SIZE];
    int kkd=0;
    char buffer_kkd[BUFFER_SIZE];
    //int kkkd=0;
    //char buffer_kkkd[BUFFER_SIZE];
    char riga_set[100];
    //char buffer_id_set[1024];

    //char buftype_2[2];
    int type_2 = 0;
    int numdevice_2=0;
    int check_2=0;

    time_t rawtime;
    struct tm * timeinfo;

    struct prenotazione p;
    struct settimana sett[WEEK_SIZE];
    struct table table[TAV_SIZE];
    device d[MAX_DEVICE];
    device_2 d_2[MAX_DEVICE];
    int nn;
    fd_set master;
    fd_set read_fds;
    int fdmax;

    FD_ZERO(&master);
    FD_ZERO(&read_fds);
    
    FILE *fptr;
//popola comanda
    int conn; int con;
for(conn=0; conn<TAV_SIZE; conn++){
for(con=0; con<COMANDA_SIZE; con++){
    table[conn].com[con].status =0;
}}
    
//nuova popola 
if ((fptr = fopen("registro_prenotazioni.txt","r")) == NULL){
       printf("Error! opening file");

       // Program exits if the file pointer returns NULL.
       exit(1);
   }
    int prova;int j;int k;int g;
    for(prova=0;prova<WEEK_SIZE; prova++){
        //popola_file(sett, i, fptr);
    fscanf(fptr,"%d", &num);
    sett[prova].nome_giorno = num; 
        //printf("GIORNO %d\n", sett[i].nome_giorno);
        for( j = 0; j<ROOM_SIZE; j++){
            fscanf(fptr,"%s", num1);
            strcpy(sett[prova].sala[j].nome_sala,num1);
            //sprintf(sett[i].sala[j].nome_sala, "%s", j+1);
            //printf("%s\n", sett[i].sala[j].nome_sala);
            for(k = 0; k<TABLE_SIZE; k++){
                fscanf(fptr,"%s", num2);
                strcpy(sett[prova].sala[j].tav[k].nome_tavolo,num2);
                //sprintf(sett[i].sala[j].tav[k].nome_tavolo, "T%d", k+1);
                //printf("%s ", sett[i].sala[j].tav[k].nome_tavolo);
                //vicinanza
                fscanf(fptr,"%s", num3);
                strcpy(sett[prova].sala[j].tav[k].vicinanza,num3);
                //printf(" %s", sett[i].sala[j].tav[k].vicinanza);
                fscanf(fptr,"%d", &num4);
                sett[prova].sala[j].tav[k].num_posti =num4 ;
                //printf(" num_posti:%d\n",sett[i].sala[j].tav[k].num_posti);
                for(g=0; g<HOUR_SIZE;g++){
                    fscanf(fptr,"%d", &num5);
                    sett[prova].sala[j].tav[k].status[g].HHT = num5;
                   // printf("%d ",sett[i].sala[j].tav[k].status[g].HHT);
                    fscanf(fptr,"%d", &num6);
                    sett[prova].sala[j].tav[k].status[g].stato = num6 ;
                    //printf("%d\n",sett[i].sala[j].tav[k].status[g].stato);
                }
            }
        }

    }       
    fclose(fptr);
    /* Creazione socket */
    listener = socket(AF_INET, SOCK_STREAM, 0);

    /* Creazione indirizzo di bind */
    memset(&my_addr, 0, sizeof(my_addr)); 
    my_addr.sin_family = AF_INET;
    my_addr.sin_port = htons(port);
    //my_addr.sin_addr.s_addr = INADDR_ANY;
    inet_pton(AF_INET, "127.0.0.1", &my_addr.sin_addr);

    /* Aggancio del socket */
    ret = bind(listener, (struct sockaddr*)&my_addr, sizeof(my_addr) );
    ret = listen(listener, 10);
    if(ret < 0){
        perror("Errore in fase di bind: \n");
        exit(-1);
    }

    FD_SET(listener, &master);
    FD_SET(0, &master);
    fdmax = listener;

    while(1){
        read_fds = master;
        ret = select(fdmax+1, &read_fds, NULL, NULL, NULL);
        if(ret<0){
            perror("ERRORE SELECT:");
            exit(1);
        }
        for(i=0; i<= fdmax; i++){
            if(FD_ISSET(i, &read_fds)) {
                if(i==0){
                    char buffer_1[BUFFER_SIZE];
                    char buffer_stdin[BUFFER_SIZE];
                    char choose[5];
                    char line[20];
                    scanf("%s", choose);
                    
                    //printf("\nHA SCELTO:%s",choose);
                    if(strcmp(choose,"stat\0")==0){
                    scanf("%s", line);
                    if(strcmp(line,"T1\0")==0){
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        } 
                        int pp=0;int pp0=0;int pp1=0;int pp2=0;char pp3[3];int pp4; char pp5[3];
                        char str[100];
                        while (fgets(str, 100, fptr) != NULL) {
                            fscanf(fptr,"%d", &pp);
                            if(pp == 1){
                                fscanf(fptr,"%d", &pp0);
                                fscanf(fptr,"%d", &pp1);
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn==0){
                                    if(pp1 == 0){
                                        sprintf(buffer_1,"\ncom%d <in attesa>\n%s %d ",pp0, pp3, pp4);
                                    }else if(pp1 == 1){
                                        sprintf(buffer_1,"\ncom%d <in preparazione>\n%s %d ",pp0, pp3, pp4);
                                    }else if(pp2 == 2){
                                        sprintf(buffer_1,"\ncom%d <in servizio>\n%s %d ",pp0, pp3, pp4);
                                    }
                                    }else{
                                        sprintf(buffer_1,"\n%s %d ", pp3, pp4);
                                    }
                                    //printf("\nil buf è prima:%s",buffer_stdin);
                                    strcat(buffer_stdin, buffer_1);
                                    //printf("\nil buf è dopo:%s",buffer_stdin);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }else{
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }
                        fscanf(fptr,"%*s");
                        }
                        fclose(fptr);
                        printf("\n%s",buffer_stdin);
                    }else if(strcmp(line,"T2\0")==0){
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        } 
                        int pp=0;int pp0=0;int pp1=0;int pp2=0;char pp3[3];int pp4; char pp5[3];
                        char str[100];
                        char buffer_2[BUFFER_SIZE]; char buffer_stdin_2[BUFFER_SIZE];
                        while (fgets(str, 100, fptr) != NULL) {
                            fscanf(fptr,"%d", &pp);
                            if(pp == 2){
                                fscanf(fptr,"%d", &pp0);
                                fscanf(fptr,"%d", &pp1);
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn==0){
                                    if(pp1 == 0){
                                        sprintf(buffer_2,"\ncom%d <in attesa>\n%s %d ",pp0, pp3, pp4);
                                    }else if(pp1 == 1){
                                        sprintf(buffer_2,"\ncom%d <in preparazione>\n%s %d ",pp0, pp3, pp4);
                                    }else if(pp2 == 2){
                                        sprintf(buffer_2,"\ncom%d <in servizio>\n%s %d ",pp0, pp3, pp4);
                                    }
                                    }else{
                                        sprintf(buffer_2,"\n%s %d ", pp3, pp4);
                                    }
                                    //printf("\nil buf è prima:%s",buffer_stdin_2);
                                    strcat(buffer_stdin_2, buffer_2);
                                    //printf("\nil buf è dopo:%s",buffer_stdin_2);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }else{
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }
                        fscanf(fptr,"%*s");
                        }
                        fclose(fptr);
                        printf("\n%s",buffer_stdin_2);
                    }else if(strcmp(line,"a\0")==0){
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        } 
                        int pp=0;int pp0=0;int pp1=0;char pp3[3];int pp4; char pp5[3];
                        char str[100];
                        char buffer_3[BUFFER_SIZE]; char buffer_stdin_3[BUFFER_SIZE];
                        while (fgets(str, 100, fptr) != NULL) { 
                            fscanf(fptr,"%d", &pp);
                            fscanf(fptr,"%d", &pp0);
                            fscanf(fptr,"%d", &pp1);
                            if(pp1 == 0){
                                fscanf(fptr,"%*d");
                                for( nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn == 0){
                                        sprintf(buffer_3,"\ncom%d T%d\n%s %d ",pp0,pp, pp3, pp4);
                                    }else{
                                        sprintf(buffer_3,"\n%s %d ", pp3, pp4);
                                    }
                                    strcat(buffer_stdin_3, buffer_3);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                        }else{
                            fscanf(fptr,"%*d");
                            for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                            }
                        }
                        fscanf(fptr,"%*s");
                        } 
                        fclose(fptr);
                        printf("\n%s",buffer_stdin_3);
                    }else if(strcmp(line,"p\0")==0){
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        } 
                        int pp=0;int pp0=0;int pp1=0;char pp3[3];int pp4; char pp5[3];
                        char str[100];
                        char buffer_4[BUFFER_SIZE]; char buffer_stdin_4[BUFFER_SIZE];
                        while (fgets(str, 100, fptr) != NULL) { 
                            fscanf(fptr,"%d", &pp);
                            fscanf(fptr,"%d", &pp0);
                            fscanf(fptr,"%d", &pp1);
                            if(pp1 == 1){
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn == 0){
                                        sprintf(buffer_4,"\ncom%d T%d\n%s %d ",pp0,pp, pp3, pp4);
                                    }else{
                                        sprintf(buffer_4,"\n%s %d ", pp3, pp4);
                                    }
                                    strcat(buffer_stdin_4, buffer_4);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                        }else{
                            fscanf(fptr,"%*d");
                            for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                            }
                        }
                        fscanf(fptr,"%*s");
                        } 
                        fclose(fptr);
                        printf("\n%s",buffer_stdin_4);
                    }else if(strcmp(line,"s\0")==0){
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        } 
                        int pp=0;int pp0=0;int pp1=0;char pp3[3];int pp4; char pp5[3];
                        char str[100];
                        char buffer_5[BUFFER_SIZE]; char buffer_stdin_5[BUFFER_SIZE];
                        while (fgets(str, 100, fptr) != NULL) { 
                            fscanf(fptr,"%d", &pp);
                            fscanf(fptr,"%d", &pp0);
                            fscanf(fptr,"%d", &pp1);
                            if(pp1 == 2){
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn == 0){
                                        sprintf(buffer_5,"\ncom%d T%d\n%s %d ",pp0,pp, pp3, pp4);
                                    }else{
                                        sprintf(buffer_5,"\n%s %d ", pp3, pp4);
                                    }
                                    strcat(buffer_stdin_5, buffer_5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                        }else{
                            fscanf(fptr,"%*d");
                            for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                            }
                        }
                        fscanf(fptr,"%*s");
                        } 
                        fclose(fptr);
                        printf("\n%s",buffer_stdin_5);
                    }
                    }else if(strcmp(choose,"stop\0") == 0){
                        //printf("\nhai premuto stop\n");
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        }   
                        int pp=0;int pp0=0;int pp1=0;char pp5[3]; 
                        char str[100];
                        //char buffer_stop[BUFFER_SIZE]; char buffer_stop[BUFFER_SIZE];
                        while (fgets(str, 100, fptr) != NULL) { 
                            fscanf(fptr,"%d", &pp);
                            fscanf(fptr,"%d", &pp0);
                            fscanf(fptr,"%d", &pp1);
                            if(pp1 == 2){
                                fscanf(fptr,"%*d");
                                printf("\nCI SONO COMANDE IN SERVIZIO\n");
                                //leggi il file delle connessioni e una ad una le chiudi
                                chiudi_tutto();
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }

                            fscanf(fptr,"%*s");
                    }
                    fclose(fptr);
                }}
                if(i == listener) {
                    printf("Nuovo cliente rilevato!\n");
                    fflush(stdout);

                    // Dimensione dell'indirizzo del client
                    len = sizeof(cl_addr);
                    socklen_t len_p = sizeof(struct sockaddr);
                    // Accetto nuove connessioni 
                    //*** ATTENZIONE: BLOCCANTE!!! ***
                    new_sd = accept(listener, (struct sockaddr *) &cl_addr, &len_p);
                    printf("il new_sd è:%d\n", new_sd);
                    char buftype[2];
                    ret = recv(new_sd, (void*)buftype, 2, 0);
                    sscanf(buftype, "%c", &type);

                    printf("il tipo è %c\n", type);
                    if(type == 'T'){
                        
                        /*ret = recv(new_sd, (void*)buftype_2, 2, 0);        
                        sscanf(buftype_2, "%c", &type_2);*/
                        ret = recv(new_sd, (void*)&type_2, sizeof(uint16_t), 0);
                        printf("il tipo_2 è %d\n", type_2);
                        check_2 = leggi_tipo_2(new_sd, &type_2, numdevice_2);
                        printf("sono il check_2:%d\n",check_2);
                        if(check_2==0){//se non c'è nella lista lo carico su file
                            
                            d_2[numdevice_2].sd=new_sd;
                            d_2[numdevice_2].tp=type_2;
                            numdevice_2++;
                            carica_device_2(d_2,numdevice_2);
                            printf("\nl'ho caricato nel file\n");
                        }
                    }
                    check = leggi_tipo(new_sd, &type, numdevice);
                    printf("sono il check:%d\n",check);
                    if(check==0){//se non c'è nella lista lo carico su file
                        
                        d[numdevice].sd=new_sd;
                        d[numdevice].tp=type;
                        numdevice++;
                        carica_device(d,numdevice);
                        printf("\nl'ho caricato nel file\n");
                    }
                    printf("\nsto aspettando qui\n");
                    FD_SET(new_sd, &master);
                    if(new_sd > fdmax){fdmax = new_sd;}
                    printf("\nsto aspettando qui DUE\n");
                }else{
                    //se è arrivato qui 'i' è un descrittore già connesso che fa una richiesta
                
                    printf("\nsto aspettando qui TRE\n");
                printf("\nci son cascato di nuovo %d, %c, %d",i, type, numdevice);
                check = leggi_tipo(i, &type, numdevice);
                printf("\nsono il check due %d", check);
                printf("\ndopo ci son cascato %c", type);

                if(type == 'K'){
                    
                    printf("\nSTAI USANDO IL KD\n");
                    ret = recv(i, (void*)buffer_id_take, 5, 0);
                    if(ret == 0){
                        printf("CHIUSURA kitchen rilevata!\n");
                        fflush(stdout);
                        // il client ha chiuso il socket, quindi
                        // chiudo il socket connesso sul server
                        close(i);
                        // rimuovo il descrittore newfd da quelli da monitorare
                        FD_CLR(i, &master);
                        break;
                    }
                    if(ret < 0){
                        perror("Errore in fase di ricezione: \n");
                        close(i);
                        // rimuovo il descrittore newfd da quelli da monitorare
                        FD_CLR(i, &master);
                    }
                    
                    if(strcmp(buffer_id_take,"TAKE\0")==0){
                        printf("\nha chiesto la take\n");
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        }
                        int n;
                        int nume=0;int nume1=0;int nume2=0;char nume3[3];int nume4; char nume5[3]; char nume6[7];
                        memset(buffer_take, '\0', sizeof(buffer_take));
                        memset(buffer_take1, '\0', sizeof(buffer_take1));
                        for(n=0; n<COMANDA_SIZE*2; n++){
                            fscanf(fptr,"%d", &nume1);
                            fscanf(fptr,"%d", &nume);
                            fscanf(fptr,"%d", &nume2);
                            fscanf(fptr,"%*d");
                            if(nume2 == 0){
                                //cambia lo stato
                                // cambia_stato(fptr, com,nume2);
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", nume3);
                                    fscanf(fptr,"%d", &nume4);
                                    fscanf(fptr,"%s", nume5);
                                    if(nn == 0){
                                        sprintf(buffer_take1,"com%d T%d\n%s %d ",nume,nume1, nume3, num4);
                                        printf("\nil buf:%s",buffer_take1);
                                    }else{
                                        sprintf(buffer_take1,"\n%s %d ", nume3, num4);
                                        printf("\nil buf:%s",buffer_take1);
                                    }
                                    printf("\nil buf è prima:%s",buffer_take);
                                    strcat(buffer_take, buffer_take1);
                                    printf("\nil buf è dopo:%s",buffer_take);
                                    if(strcmp(nume5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }else{
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",nume5);
                                    if(strcmp(nume5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }
                            //fscanf(fptr,"%s", nume6);
                            if(nume2==0){
                                fscanf(fptr,"%s", nume6);
                                //copia_stato();
                                cambia_stato(table,n);
                            if(strcmp(nume6,"EOF_SI\0")==0){
                                break;
                            }
                            }else{
                                fscanf(fptr,"%*s");
                            }
                        }
                        printf("\nil NUMERO:%d e il TAVOLO:%d e lo STATO:%d\n",nume,nume1,nume2);
                        //sprintf(buffer_take,"%d %s %d \n",nume, nume3, num4);
                        printf("\nil buffer contiene: %s\n", buffer_take);
                        len = strlen(buffer_take)+1;
                        lmsg = htons(len);
                        ret = send(i, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(i, (void*) buffer_take, len, 0);

                        
                        ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                        // Conversione in formato 'host'
                        len = ntohs(lmsg); 
                        // Ricezione del messaggio
                        ret = recv(i, (void*)buffer_kd, len, 0);
                        sscanf(buffer_kd, "%d", &kd);
                        printf("\nIL KD CHE LHA MESSA IN PREPARAZIONE: %d\n",kd);
                            fclose(fptr);

                        //copia_kd();
                        //printf("SONO IL NUME2:%d", nume2);
                        if(nume2==0){
                        aggiorna_kd(table,nume,nume1,kd);}
                        if(nume2==0){
                        if((fptr = fopen("connessioni_2.txt","r")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        }
                        int socket_scorri_2=0; int type_scorri_2=0;
                        int scorri;
                        for( scorri =0; scorri <numdevice_2; scorri++){
                            char buffer_nuovo[BUFFER_SIZE];
                            
                            fscanf(fptr,"%d %d",&socket_scorri_2,&type_scorri_2 );
                            printf("\nil tipo è %d",type_scorri_2);
                             
                            if(nume1 == type_scorri_2){
                                printf("\nl'ho trovato nella lista %d", socket_scorri_2);
                                printf("\nora invia lo stato");
                                //send(socket);
                                sprintf(buffer_nuovo,"\ncom%d T%d <IN PREPARAZIONE> ",nume,nume1);
                                        
                                //ret = send(socket_scorri, aster, strlen(aster)+1, 0);
                                printf("\nIL BUF CONTIENE:%s\n", buffer_nuovo);
                                len = strlen(buffer_nuovo)+1;
                                lmsg = htons(len);
                                ret = send(socket_scorri_2, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(socket_scorri_2, (void*) buffer_nuovo, len, 0);
                                
                            
                        }
                        //printf("\nsocket_prescelto è: %d", socket_prescelto);
                                    
                        
                        }
                        fclose(fptr);
                    }
                        
                        
                    }else if(strcmp(buffer_id_take,"SHOW\0")==0){
                        printf("\nha chiesto la show\n");
                        ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                        // Conversione in formato 'host'
                        len = ntohs(lmsg); 
                        // Ricezione del messaggio
                        ret = recv(i, (void*)buffer_kkd, len, 0);
                        sscanf(buffer_kkd, "%d", &kkd);
                        printf("\nSONO IL KD:%d\n", kkd);
                        if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                        }
                        char str[100];
                        int pp=0;int pp0=0;int pp1=0;int pp2=0;char pp3[3];int pp4; char pp5[3];
                        memset(buffer_show, '\0', sizeof(buffer_show));
                        memset(buffer_show1, '\0', sizeof(buffer_show1));
                        //for(int p=0;p<COMANDA_SIZE*2;p++){
                        while (fgets(str, 100, fptr) != NULL) {
                            fscanf(fptr,"%d", &pp);
                            fscanf(fptr,"%d", &pp0);
                            fscanf(fptr,"%d", &pp1);
                            fscanf(fptr,"%d", &pp2);
                            if(pp2 == kkd){
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s", pp3);
                                    fscanf(fptr,"%d", &pp4);
                                    fscanf(fptr,"%s", pp5);
                                    if(nn == 0){
                                        sprintf(buffer_show1,"\ncom%d T%d\n%s %d ",pp0,pp, pp3, pp4);
                                        printf("\nil buf:%s",buffer_show1);
                                    }else{
                                        sprintf(buffer_show1,"\n%s %d ", pp3, pp4);
                                        printf("\nil buf:%s",buffer_show1);
                                    }
                                    printf("\nil buf è prima:%s",buffer_show);
                                    strcat(buffer_show, buffer_show1);
                                    printf("\nil buf è dopo:%s",buffer_show);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }

                        }else{
                            for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                        }
                        /*fscanf(fptr,"%s",pp6);
                        if(strcmp(pp6,"EOF_NO\0")==0){
                                break;
                        }*/
                        fscanf(fptr,"%*s");
                    }
                    len = strlen(buffer_show)+1;
                    lmsg = htons(len);
                    ret = send(i, (void*) &lmsg, sizeof(uint16_t),0);
                    ret = send(i, (void*) buffer_show, len, 0);
                    fclose(fptr);
                }else if(strcmp(buffer_id_take,"SET\0")==0){
                    printf("\nha chiesto la set\n");
                    
                    ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                    // Conversione in formato 'host'
                    len = ntohs(lmsg); 
                    // Ricezione del messaggio
                    ret = recv(i, (void*)riga_set, len, 0);
                    printf("\nKD: %s\n", riga_set);
                    //int volte=0;
                    
                    in=0;ind=0;   
                    int name_tav=0;
                    int name_com=0;int ritorno=0;
                    while (riga_set[in] != '\0') {
                        printf("\n(1):%c", riga_set[ind]);
                        ind++;
                        printf("\n(2):%c", riga_set[ind]);   
                        ind++;
                        printf("\n(3):%c", riga_set[ind]);
                        ind++;
                        printf("\n(4):%c", riga_set[ind]);
                        name_com = riga_set[ind];
                        name_com -= 48;
                        printf("\ncom%d",name_com);
                        ind++;
                        printf("\n(5):%c", riga_set[ind]);
                        ind++;
                        printf("\n(6):%c", riga_set[ind]);
                        ind++;
                        printf("\n(7):%c", riga_set[ind]);
                        name_tav=riga_set[ind];
                        name_tav -=48;
                        printf("\nT%d\n",name_tav);
                        ind++;
                        //volte++;
                        in+=8;
                    } 
                    aggiorna_set(name_tav,name_com,1,&ritorno);
                    
                    
                    //printf("\nil val di RITORNO:%d\n", ritorno);
                    
                    if(ritorno ==1){
                        printf("\nè stato modificato con successo\n");
                        ret = send(i, cmd, strlen(cmd)+1, 0);
                    }
                    if(ritorno== 1){
                    if((fptr = fopen("connessioni_2.txt","r")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                    }
                        int socket_scorri_2=0; int type_scorri_2=0;
                        int scorri;
                        for(scorri =0; scorri <numdevice_2; scorri++){
                            char buffer_nuovo[BUFFER_SIZE];
                            
                            fscanf(fptr,"%d %d",&socket_scorri_2,&type_scorri_2 );
                            printf("\nil tipo è %d",type_scorri_2);
                             
                            if(name_tav == type_scorri_2){
                                printf("\nl'ho trovato nella lista %d", socket_scorri_2);
                                printf("\nora invia lo stato");
                                //send(socket);
                                sprintf(buffer_nuovo,"\ncom%d T%d <IN SERVIZIO> ",name_com,name_tav);
                                        
                                //ret = send(socket_scorri, aster, strlen(aster)+1, 0);
                                printf("\nIL BUF CONTIENE:%s\n", buffer_nuovo);
                                len = strlen(buffer_nuovo)+1;
                                lmsg = htons(len);
                                ret = send(socket_scorri_2, (void*) &lmsg, sizeof(uint16_t),0);
                                ret = send(socket_scorri_2, (void*) buffer_nuovo, len, 0);
                                
                            
                        }
                        //printf("\nsocket_prescelto è: %d", socket_prescelto);
                                    
                        
                        }
                    fclose(fptr);
                    }
                }
                }else if(type == 'T'){
                    //printf("prova");
                /*}else if(type == 'T'){
                    printf("prova2");
                } */   
                //QUI RICEVE CON CHI STA PARLANDO
                //ret = recv(i, (void*)id_buffer, ID_LEN, 0);
                //if(strcmp(id_buffer,"TD\0")==0){
                    printf("\nSTAI USANDO IL TD\n");
                if(volte_autenticazione==0){  
                /*ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)buffer_autenticazione, len, 0);
                sscanf(buffer_autenticazione, "%d", &volte_autenticazione);*/
                //if(volte_autenticazione==0){
                    
                ret = recv(i, (void*)id_book_buffer, ID_BOOK_LEN, 0);
                //printf("\n%s\n",id_book_buffer);
                fptr = fopen("codice_prenotazioni.txt", "r"); //apri il file in modalità lettura
                if (fptr == NULL) {
                    printf("Errore nell'apertura del file\n");
                    return 1;
                }
                 while(fscanf(fptr, "%s", ch) != EOF) { //leggi ogni stringa dal file fino a quando non ci sono più stringhe da leggere      printf("%s",ch);
                    //printf("%s",ch);
                    if (strcmp(ch, id_book_buffer) == 0 ) { 
                        ret = send(i, cmd, strlen(cmd)+1, 0); 
                    }
                }
                
                fclose(fptr);}
                volte_autenticazione++;
                //printf("qui ci sono arrivato");
                ret = recv(i, (void*)buffer_id_comanda, 8, 0);
                
                    if(ret == 0){
                                printf("CHIUSURA table device rilevata!\n");
                                fflush(stdout);
                                volte_autenticazione=0;
                                // il client ha chiuso il socket, quindi
                                // chiudo il socket connesso sul server
                                /*fptr = fopen("comanda.txt","r+");
                                if(fptr == NULL)
                                {
                                    printf("Error!");   
                                    exit(1);             
                                }
                                char ultimaRiga[1024];
                                fseek(fptr, -1, SEEK_END); //sposta il puntatore alla fine del file
                                int indec = 1;
                                while (fgetc(fptr) != '\n') { //legge la ultima riga del file
                                    fseek(fptr, -2, SEEK_CUR);
                                    indec++;
                                }
                                fgets(ultimaRiga, indec, fptr);
                                fseek(fptr, -indec, SEEK_END); //sposta il puntatore alla fine dell'ultima riga
                                fprintf(fptr,"\nEOF_NO\0");

                                fclose(fptr);*/ 
                                close(i);
                                // rimuovo il descrittore newfd da quelli da monitorare
                                FD_CLR(i, &master);
                                /*if((fptr = fopen("connessioni.txt","r")) == NULL){
                                printf("Error! opening file");
                                // Program exits if the file pointer returns NULL.
                                exit(1);
                                }
                                for(int scorri =0; scorri <numdevice; scorri++){
                                
                                fscanf(fptr,"%d %c",&socket_scorri,&type_scorri );
                                //printf("\nil tipo è %d",)
                                if(type_scorri == 'K'){
                                    
                                    printf("CHIUSURA kitchen dopo aver inviato asterischi!\n");
                                        fflush(stdout);
                                        // il client ha chiuso il socket, quindi
                                        // chiudo il socket connesso sul server
                                        close(socket_scorri);
                                        // rimuovo il descrittore newfd da quelli da monitorare
                                        FD_CLR(socket_scorri, &master);
                                }
                            }
                                        
                                        
                            fclose(fptr);*/
                            
                                break;
                    }
                
                    if(ret < 0){
                        perror("Errore in fase di ricezione: \n");
                        close(i);
                        // rimuovo il descrittore newfd da quelli da monitorare
                        FD_CLR(i, &master);
                    }
                if(strcmp(buffer_id_comanda,"MENUMEN\0")==0){
                    printf("\nha chiesto il menu\n");
                }
                if(strcmp(buffer_id_comanda,"COMANDA\0")==0){
                ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)riga, len, 0);
                printf("\nTD: %s\n", riga);
                /*riceve il numero del tavolo*/
                int i_tavolo=0;
                char buffer_num_tavolo[BUFFER_SIZE];
                ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)buffer_num_tavolo, len, 0);
                sscanf(buffer_num_tavolo, "%d", &i_tavolo);
                printf("\n il num del mio tavolo è: %d\n", i_tavolo);
                if(i_tavolo == 1){
                int volte=0;
                char buffer_comande[3];
                int i_comanda=0;
                ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)buffer_comande, len, 0);
                sscanf(buffer_comande, "%d", &i_comanda);
                            
                printf("sono la comanda: %d", i_comanda);
                
                if((fptr = fopen("connessioni.txt","r")) == NULL){
                    printf("Error! opening file");
                    // Program exits if the file pointer returns NULL.
                    exit(1);
                }
                int socket_prescelto=0;
                printf("\nnum_dev %d", numdevice);
                int scorri;
                for(scorri =0; scorri <numdevice; scorri++){
                    char* aster = "T1*\0";
                    char* aster1= "T1**\0";
                    //char buffer_nuovo[BUFFER_SIZE];
                    
                    fscanf(fptr,"%d %c",&socket_scorri,&type_scorri );
                    //printf("\nil tipo è %d",)
                    if(type_scorri == 'K'){
                        printf("\nl'ho trovato nella lista %d", socket_scorri);
                        socket_prescelto = socket_scorri;
                    if(i_comanda == 0){
                        printf("\nora invia un asterisco");
                        //send(socket);

                        //ret = send(socket_scorri, aster, strlen(aster)+1, 0);
                        len = strlen(aster)+1;
                        lmsg = htons(len);
                        ret = send(socket_scorri, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(socket_scorri, aster,len, 0);
                    }else if(i_comanda == 1){

                        printf("\nora invia due asterisco");
                        //send(socket);
                        len = strlen(aster1)+1;
                        lmsg = htons(len);
                        ret = send(socket_scorri, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(socket_scorri, aster1,len, 0);
                    }
                    }else{
                        printf("\nnon trovato");
                    }
                }
                printf("\nsocket_prescelto è: %d", socket_prescelto);
                            
                fclose(fptr);
                
                table[0].numero_tav = i_tavolo; 
                table[0].com[i_comanda].cod_comanda = i_comanda;
                /*send dello stato*/
                char buffer_stato[2];
                sprintf(buffer_stato, "%d", table[0].com[i_comanda].status);
                ret = send(i, (void*) buffer_stato, strlen(buffer_stato)+1, 0);
                  
                in=0;ind=0;   
                    while (riga[in] != '\0') {
                        //ind++;
                        if(in==ind) ind++;
                        printf("\n(1):%c", riga[ind]);
                        table[0].com[i_comanda].menu[volte].codice[0] = riga[ind];    
                        //printf("\nIL CODICE E:%c",com[0].menu[volte].codice[0] );
                        ind++;
                        printf("\n(2):%c", riga[ind]);
                        table[0].com[i_comanda].menu[volte].codice[1] = riga[ind];
                        //printf("\nIL CODICE E:%c",com[0].menu[volte].codice[1] );   
                        ind++;
                        printf("\n(3):%c", riga[ind]);
                        ind++;
                        printf("\n(4):%c", riga[ind]);
                        table[0].com[i_comanda].menu[volte].quantita = riga[ind];
                        table[0].com[i_comanda].menu[volte].quantita -= 48;
                        //printf("\nLA QUANTITA E:%d\n",com[0].menu[volte].quantita);
                        ind++;
                        volte++;
                        in+=5;
                    }           
                    //coglione qui ti stai stampando la SECONDA
                    printf("\n LA COMANDA E:%d",table[0].com[i_comanda].cod_comanda);
                    printf("\nIL CODICE E:%s",table[0].com[i_comanda].menu[1].codice);
                    printf("\nLA QUANTITA E:%d\n",table[0].com[i_comanda].menu[1].quantita);
                    fptr = fopen("comanda.txt","a+");
                            if(fptr == NULL)
                            {
                                printf("Error!");   
                                exit(1);             
                            }

                            //for(int indice=0;indice<COMANDA_SIZE; indice++){
                                inserisci_comanda(table, i_comanda, fptr,volte);
                            //}
                            fprintf(fptr,"\nEOF_SI");

                    fclose(fptr); 
                    //remove("comanda.txt");
                    ret = send(i, cmd, strlen(cmd)+1, 0);
                }if(i_tavolo == 2){
                    int volte=0;
                char buffer_comande[3];
                int i_comanda=0;
                ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)buffer_comande, len, 0);
                sscanf(buffer_comande, "%d", &i_comanda);
                            
                printf("sono la comanda: %d", i_comanda);
                
                if((fptr = fopen("connessioni.txt","r")) == NULL){
                    printf("Error! opening file");
                    // Program exits if the file pointer returns NULL.
                    exit(1);
                }
                int socket_prescelto=0;
                printf("\nnum_dev %d", numdevice);
                int scorri;
                for(scorri =0; scorri <numdevice; scorri++){
                    char* aster = "T2*\0";
                    char* aster1= "T2**\0";
                    //char buffer_nuovo[BUFFER_SIZE];
                    
                    fscanf(fptr,"%d %c",&socket_scorri,&type_scorri );
                    //printf("\nil tipo è %d",)
                    if(type_scorri == 'K'){
                        printf("\nl'ho trovato nella lista %d", socket_scorri);
                        socket_prescelto = socket_scorri;
                    if(i_comanda == 0){
                        printf("\nora invia un asterisco");
                        //send(socket);

                        //ret = send(socket_scorri, aster, strlen(aster)+1, 0);
                        len = strlen(aster)+1;
                        lmsg = htons(len);
                        ret = send(socket_scorri, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(socket_scorri, aster,len, 0);
                    }else if(i_comanda == 1){

                        printf("\nora invia due asterisco");
                        //send(socket);
                        len = strlen(aster1)+1;
                        lmsg = htons(len);
                        ret = send(socket_scorri, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(socket_scorri, aster1,len, 0);
                    }
                    }else{
                        printf("\nnon trovato");
                    }
                }
                printf("\nsocket_prescelto è: %d", socket_prescelto);
                            
                fclose(fptr);
                
                table[1].numero_tav = i_tavolo; 
                table[1].com[i_comanda].cod_comanda = i_comanda;
                /*send dello stato*/
                char buffer_stato[2];
                sprintf(buffer_stato, "%d", table[1].com[i_comanda].status);
                ret = send(i, (void*) buffer_stato, strlen(buffer_stato)+1, 0);
                  
                in=0;ind=0;   
                    while (riga[in] != '\0') {
                        //ind++;
                        if(in==ind) ind++;
                        printf("\n(1):%c", riga[ind]);
                        table[1].com[i_comanda].menu[volte].codice[0] = riga[ind];    
                        //printf("\nIL CODICE E:%c",com[0].menu[volte].codice[0] );
                        ind++;
                        printf("\n(2):%c", riga[ind]);
                        table[1].com[i_comanda].menu[volte].codice[1] = riga[ind];
                        //printf("\nIL CODICE E:%c",com[0].menu[volte].codice[1] );   
                        ind++;
                        printf("\n(3):%c", riga[ind]);
                        ind++;
                        printf("\n(4):%c", riga[ind]);
                        table[1].com[i_comanda].menu[volte].quantita = riga[ind];
                        table[1].com[i_comanda].menu[volte].quantita -= 48;
                        //printf("\nLA QUANTITA E:%d\n",com[0].menu[volte].quantita);
                        ind++;
                        volte++;
                        in+=5;
                    }           
                    //coglione qui ti stai stampando la SECONDA
                    printf("\n LA COMANDA E:%d",table[1].com[i_comanda].cod_comanda);
                    printf("\nIL CODICE E:%s",table[1].com[i_comanda].menu[1].codice);
                    printf("\nLA QUANTITA E:%d\n",table[1].com[i_comanda].menu[1].quantita);
                    fptr = fopen("comanda.txt","a+");
                            if(fptr == NULL)
                            {
                                printf("Error!");   
                                exit(1);             
                            }

                            //for(int indice=0;indice<COMANDA_SIZE; indice++){
                                inserisci_comanda2(table, i_comanda, fptr,volte);
                            //}
                            fprintf(fptr,"\nEOF_SI");

                    fclose(fptr); 
                    //remove("comanda.txt");
                    ret = send(i, cmd, strlen(cmd)+1, 0);
                }
                }if(strcmp(buffer_id_comanda,"CONTOCO\0")==0){
                    printf("\nha chiesto il conto\n");
                    char buffer_num_tavolo[BUFFER_SIZE]; int i_tavolo=0;
                    ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                    // Conversione in formato 'host'
                    len = ntohs(lmsg); 
                    // Ricezione del messaggio
                    ret = recv(i, (void*)buffer_num_tavolo, len, 0);
                    sscanf(buffer_num_tavolo, "%d", &i_tavolo);
                    printf("\n il num del mio tavolo è: %d\n", i_tavolo);

                    if((fptr = fopen("comanda.txt","r+")) == NULL){
                            printf("Error! opening file");
                            // Program exits if the file pointer returns NULL.
                            exit(1);
                    } 
                    memset(buffer_conto, '\0', sizeof(buffer_conto));
                    memset(buffer_conto1, '\0', sizeof(buffer_conto1));
                    char str[100];int soldi=0;int conto=0;
                    int pp=0;char pp3[3];int pp4; char pp5[3];
                        while (fgets(str, 100, fptr) != NULL) {
                            fscanf(fptr,"%d", &pp);
                            if(pp == i_tavolo){
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%s",pp3);
                                    leggi_da_menu(pp3,&soldi);
                                    fscanf(fptr,"%d",&pp4);
                                    sprintf(buffer_conto1,"\n%s %d %d", pp3, pp4,soldi);
                                    soldi = soldi * pp4;
                                    conto = conto + soldi;
                                    printf("\nil buf:%s",buffer_conto1);
                                    fscanf(fptr,"%s",pp5);
                                    printf("\nil buf è prima:%s",buffer_conto);
                                    strcat(buffer_conto, buffer_conto1);
                                    printf("\nil buf è dopo:%s",buffer_conto);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }else{
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                fscanf(fptr,"%*d");
                                for(nn=0; nn<MENU_SIZE; nn++){
                                    fscanf(fptr,"%*s");
                                    fscanf(fptr,"%*d");
                                    fscanf(fptr,"%s",pp5);
                                    if(strcmp(pp5, "NO\0")==0 ){
                                        break;
                                    }
                                }
                            }
                            fscanf(fptr,"%*s");
                        }
                        //printf("\nil conto è:%d\n",conto);

                        //printf("\nALLA FINE DELLA FIERA: %s\n",buffer_conto);
                        char numero_stringa[10];
                        sprintf(numero_stringa,"\nTOTALE: %d", conto);
                        strcat(buffer_conto,numero_stringa);
                        printf("\nALLA FINE DELLA FIERA: %s\n",buffer_conto);
                        
                        len = strlen(buffer_conto)+1;
                        lmsg = htons(len);
                        ret = send(i, (void*) &lmsg, sizeof(uint16_t),0);
                        ret = send(i, (void*) buffer_conto, len, 0);

                    fclose(fptr);

                }
                
                }else if(type == 'C'){
                //else if(strcmp(id_buffer,"CL\0")==0){
                    printf("\nSTAI USANDO IL CLIENT\n");
                
                ret = recv(i, (void*)choose_buffer, CHOOSE_LEN, 0);
                // Ricezione della dimensione del mesaggio 
                ret = recv(i, (void*)&lmsg, sizeof(uint16_t), 0);
                // Conversione in formato 'host'
                len = ntohs(lmsg); 
                // Ricezione del messaggio
                ret = recv(i, (void*)buffer, len, 0);
 
                if(ret == 0){
                    printf("CHIUSURA client rilevata!\n");
                    fflush(stdout);
                    // il client ha chiuso il socket, quindi
                    // chiudo il socket connesso sul server
                    close(i);
                    // rimuovo il descrittore newfd da quelli da monitorare
                    FD_CLR(i, &master);
                    break;
                }
                
                if(ret < 0){
                    perror("Errore in fase di ricezione: \n");
                    close(i);
                    // rimuovo il descrittore newfd da quelli da monitorare
                    FD_CLR(i, &master);
                }
                //FIND
                if(strcmp(choose_buffer,"find\0")==0){
                sscanf(buffer, " %s %d %s %d" , p.cognome, &p.num_persone, p.data, &p.HH);
                
                strncpy(firstTwo, p.data, 2);
                firstTwo[2] = '\0';
                find = atoi(firstTwo);
                //printf("%d\n",find);
                int ii;int j;int k; int g;
                for(ii =0; ii<WEEK_SIZE;ii++){
                    count =0;
                    
                    //printf("%d\n",sett[i].nome_giorno);
                    if(find == sett[ii].nome_giorno){
                        memset(buffer, 0, sizeof(buffer));
                        memset(newbuf, 0, sizeof(newbuf));
                        for(j = 0; j<ROOM_SIZE; j++){
                            for(k = 0; k<TABLE_SIZE; k++){
                                if(sett[ii].sala[j].tav[k].num_posti >=
                                p.num_persone){
                                    for(g=0; g<HOUR_SIZE;g++){
                                        if(sett[ii].sala[j].tav[k].status[g].HHT == p.HH){
                                            if(sett[ii].sala[j].tav[k].status[g].stato == 0){
                                                //printf("%s %s %s\n", sett[ii].sala[j].tav[k].nome_tavolo, sett[ii].sala[j].nome_sala, sett[ii].sala[j].tav[k].vicinanza);
                                                count++;
                                                sprintf(buffer,"%d) %s %s %s\n",count, sett[ii].sala[j].tav[k].nome_tavolo, sett[ii].sala[j].nome_sala, sett[ii].sala[j].tav[k].vicinanza);
                                                strcat(newbuf,buffer);
                                                //printf("VEDIAMO%s", buffer);
                                                                                               
                                            }
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                        
                    }
                }
                            printf("SONO IL NUOVO\n %s", newbuf);
                            len = strlen(newbuf)+1;
                            lmsg = htons(len);
                            ret = send(i, (void*) &lmsg, sizeof(uint16_t),0);
                            ret = send(i, (void*) newbuf, len, 0);

                }else if(strcmp(choose_buffer,"book\0")==0){
                    printf("sono nella book\n");
                    sscanf(buffer, "%d" , &numero_choose);
                    printf("%d\n", numero_choose);
                    //printf("%s %d %s %d\n",p.cognome, p.num_persone, p.data, p.HH);
                    int index = 0;
                    while (index < strlen(newbuf)) {
                        char riga[100];
                        int counter = 0;
                        int numero;
                        sscanf(newbuf + index, "%s%n", riga, &counter);//mette in riga cosa ha letto e in count quanto
                        printf("valore di riga%s\n",riga);//il valore appena letto
                        printf("valore di count%d\n",counter);//quanto vale
                        if (sscanf(riga,"%d",&numero) == 1 && numero == numero_choose) {//se è un numero ed è uguale a 2 
                            //printf("speriamo funzioni%d\n",numero);
                            index +=counter;
                            sscanf(newbuf + index, "%s%n", riga, &counter);
                            strcpy(tavolo,riga);
                            printf("%s\n", tavolo);
                            //ora in riga ho il prox e in count quanto vale
                            index +=counter;
                            sscanf(newbuf + index, "%s%n", riga, &counter);
                            strcpy(sala,riga);
                            printf("%s\n", sala);
                            break;
                        }
                        if(newbuf[index+counter] == '\0') break;
                        index += counter;
                    }
                    strncpy(firstTwo2, p.data, 2);
                    firstTwo2[2] = '\0';
                    find2 = atoi(firstTwo);
                    int ii;int j; int k,g;
                    for(ii =0; ii<WEEK_SIZE;ii++){
                        if(find2 == sett[ii].nome_giorno){
                            for(j = 0; j<ROOM_SIZE; j++){
                                if(strcmp(sala,sett[ii].sala[j].nome_sala)==0){
                                    for(k = 0; k<TABLE_SIZE; k++){
                                        if(strcmp(tavolo,sett[ii].sala[j].tav[k].nome_tavolo)==0){
                                            for(g=0; g<HOUR_SIZE;g++){
                                                 if(sett[ii].sala[j].tav[k].status[g].HHT == p.HH){
                                                    if(sett[ii].sala[j].tav[k].status[g].stato == 0){
                                                        sett[ii].sala[j].tav[k].status[g].stato=1;
                                                        printf("prenotazione effettuta%d\n",sett[ii].sala[j].tav[k].status[g].stato);   
                                                        ret = send(i, cmd, strlen(cmd)+1, 0);
                                                        //printf("%s %d %s %d\n",p.cognome, p.num_persone, p.data, p.HH);         
                                                    }
                                                 }
                                            }
                                    }
                                }
                            }
                        }
                    }
                }
                //scriviamo il codice delle prenotazioni
                fptr = fopen("codice_prenotazioni.txt","a+");
                if(fptr == NULL)
                {
                    printf("Error!");   
                    exit(1);             
                }
                //creiamo il codice prenotazione
                sprintf(codice_prenotazioni, "%c%d-%s-%s", p.cognome[0], p.num_persone, tavolo, sala);
                fprintf(fptr,"%s ",codice_prenotazioni);

                //creiamo il timestamp
                // Recupero l'ora corrente
                time(&rawtime);

                // Converto l'ora
                timeinfo = localtime(&rawtime);

                // Creo la risposta mettendola in "buffer"
                
                sprintf(buffer_hour, "%02d:%02d:%02d",
                timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec );
                fprintf(fptr,"%s\n",buffer_hour);
                
                fclose(fptr); 

                sprintf(buffer,"%s %s" , codice_prenotazioni, buffer_hour);
                len = strlen(buffer)+1;
                lmsg = htons(len);
                ret = send(i, (void*) &lmsg, sizeof(uint16_t),0);
                ret = send(i, (void*) buffer, len, 0);
                //sovrascriviamo il registro
                fptr = fopen("registro_prenotazioni.txt","w");
                if(fptr == NULL)
                {
                    printf("Error!");   
                    exit(1);             
                }
                int indice;
                for(indice=0;indice<WEEK_SIZE; indice++){
                    inserisci_prenotazione(sett, indice, fptr);
                }

                fclose(fptr); 
                
                }else if(strcmp(choose_buffer, "esc\0")== 0){
                    printf("sono nella esc");   
                }
                
                }//qui chiudi l'if del client
                                            
            }
        }
    }
    }
}