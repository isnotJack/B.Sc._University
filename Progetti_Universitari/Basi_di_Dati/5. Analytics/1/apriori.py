import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Jack01",
  database="SmartHome"
)
#Dati tutti i vari dispositivi della cucina mi costruisco
# tutte le possibili query di calcolo del supporto
#Non tutte le query generate andranno effettivamente eseguite:
#L'algoritmo a Priori scegliera dinamicamente quali far partire

##########################CLASSI
class Dispositivo:
    def __init__(self,n,ind):
        self.name = n.strip("(")
        self.codice = ind

class Query:
    def __init__(self,num):
        #Dato un numero rappresentativo di un Itemset
        #mi costruisco la query di calcolo del supporto
        self.dispo = [] #Lista dei dispositivi coinvolti
        self.code = num
        self.names = " \'"
        mask = 1
        index = 0
        while (num >= mask): #CONTROLLO Se l'elemento dispositivi[index è in query]
            if (mask & num > 0):
                self.dispo.append((dispositivi[index]).name)
            mask = mask <<1
            index += 1
        self.str = ""
        self.names += " ".join(self.dispo)
        self.names +='\''
    def make(self):
        self.str = "SELECT " +str(self.code)+", SUM(IF("
        assert(len(self.dispo) > 0)
        for i in self.dispo:
            self.str += str(i) + " = 0 OR "

        self.str = self.str[:-3]

        self.str += ",0,1)) AS Occorrenze INTO @Itemset, @Occorrenze FROM tabella_cucina;" #Per ottenere il supporto ci basta dividere!


#######################################

#Prendo i dati dal database
try:
    pc = mydb.cursor()
    pc.execute("""
        select d.Codice_dispositivo
		from Dispositivo d inner join smartplug sp on d.codice_smart_plug = sp.codice_smart_plug
		where sp.codice_stanza=0;
""")

    p = pc.fetchall()
except mysql.connector.Error as err:
  print("Errore: {}".format(err))

#Ogni Itemset è rappresentato in maniera univoca da un numero binario


dispositivi = []
index = 0

for i in p:
    d = Dispositivo(i[0],2**index) #l'identificatore di un elemento semplice è un numero binario del tip 1000..
    dispositivi.append(d)
    index += 1

queries = []
insert = "INSERT INTO QuerySupporto VALUES\n"
for i in range(1,2**(len(dispositivi))):
    q = Query(i)
    q.make()
    queries.append(q)

    insert += "(" + str(i) +","+ q.names + ",\""+ q.str + "\")\n,"

insert = insert[:-2] +";"


print(insert)
