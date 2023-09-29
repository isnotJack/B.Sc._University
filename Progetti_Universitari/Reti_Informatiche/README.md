# Restaurant Project

Benvenuti nel repository del progetto di Reti Informatiche. Questo progetto è stato sviluppato per creare un sistema che gestisce un ristorante, consentendo ai clienti di prenotare tavoli, inviare comande e monitorare lo stato dei loro pasti. Di seguito sono riportate le principali funzionalità del sistema e la sua struttura.
### Progetto valutato: 5/5
## Funzionalità del Progetto

Il progetto include le seguenti funzionalità:

1. **Prenotazione Tavoli**: I clienti possono prenotare tavoli selezionando la data, l'ora e il numero di persone. Il sistema verifica la disponibilità dei tavoli e offre opzioni ai clienti.

2. **Table Device**: Una volta prenotato un tavolo, i clienti possono utilizzare un "table device" situato al tavolo per sbloccarlo inserendo un codice di prenotazione valido.

3. **Menu**: Il sistema mostra il menu giornaliero ai clienti attraverso il "table device", consentendo loro di selezionare i piatti desiderati.

4. **Comande**: I clienti possono inviare comande per i loro pasti attraverso il "table device". 

5. **Gestione Comande**: Le comande inviate dai clienti vengono inoltrate ai cuochi nella cucina. I cuochi accettano e preparano le comande.

6. **Stato delle Comande**: Lo stato delle comande (in attesa, in preparazione, in servizio) viene visualizzato sul "table device" per informare i clienti.

7. **Chiusura del Pasto**: I clienti possono richiedere il conto attraverso il "table device" per chiudere il pasto.

## Struttura del Progetto

Il progetto è composto dai seguenti componenti:

- **Server Multiservizio**: Il server gestisce sia il servizio di prenotazione che quello delle comande. 

- **Table Device**: Questi dispositivi sono situati ai tavoli e vengono utilizzati dai clienti per sbloccare il tavolo, visualizzare il menu, inviare comande e richiedere il conto.

- **Kitchen Device**: Ogni cuoco nella cucina ha un "kitchen device" che accetta comande, le prepara e ne segnala lo stato al server.


## Documentazione

Ogni implementazione del progetto è descritta in una piccola documentazione (di massimo 2 pagine) che spiega le scelte implementative, discutendone i pregi e i difetti in modo critico e sistematico.

