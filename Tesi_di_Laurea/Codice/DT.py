import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

# Carico i dati dal file CSV
data = pd.read_csv('data/whole_data_18.csv')

# Seleziono le colonne desiderate
columns_da_tenere = ['self_arousal'] + list(data.columns[7:])
data = data[columns_da_tenere]
print(data)

# Divido i dati in features (X) e target (y)
X = data.iloc[:, 1:]  # Prendo le colonne dalla 2 in poi (escludo la colonna target)
y = data['self_arousal']
print(X)
print(y)

# Suddivido i dati in set di addestramento e di test (20% test, 80% addestramento)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Creo un'istanza del classificatore Decision Tree
classifier = DecisionTreeClassifier()

# Addestro il classificatore
classifier.fit(X_train, y_train)

# Valuto l'accuratezza del classificatore sui dati di test
accuracy = classifier.score(X_test, y_test)

print(f'Accuratezza: {accuracy}')
