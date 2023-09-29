import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neural_network import MLPClassifier

# carico i dati dal file CSV
data = pd.read_csv('data/whole_data_18.csv')

# seleziono le colonne desiderate
columns_da_tenere = ['self_arousal'] + list(data.columns[7:])
data = data[columns_da_tenere]
# tengo la colonna target "self_arousal" e le altre dalla 8 (inclusa) fino alle fine
print(data)

# divido i dati in features (X) e target (y)
X = data.iloc[:, 1:]  # prendo le colonne dalla 2 in poi (escludo la colonna target)
y = data['self_arousal']
print(X)
print(y)

# suddivido i dati in set di addestramento e di test (20% test, 80% addestramento)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# creo un'istanza del classificatore MLP
classifier = MLPClassifier()

# addestro il classificatore
classifier.fit(X_train, y_train)

# valuto l'accuratezza del classificatore sui dati di test
# la percentuale di predizioni corrette del classificatore sui dati di test
accuracy = classifier.score(X_test, y_test)

print(f'Accuratezza: {accuracy}')
