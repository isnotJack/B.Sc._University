import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

# Carico i dati dal file CSV
data = pd.read_csv('data/whole_data_18.csv')

# Lista delle labels
labels = ['external_arousal', 'external_valence', 'partner_arousal', 'partner_valence', 'self_arousal', 'self_valence']

# Usato memorizzare i vettori di feature importance per ogni etichetta
feature_importance_dict = {}

for label in labels:
    # Seleziono le colonne desiderate per l'etichetta corrente
    columns_da_tenere = [label] + list(data.columns[7:])
    data_label = data[columns_da_tenere]

    # Divido i dati in features (X) e target (y) per l'etichetta corrente
    X_label = data_label.iloc[:, 1:]
    y_label = data_label[label]

    # Suddivido i dati in set di addestramento e di test (20% test, 80% addestramento)
    X_train_label, X_test_label, y_train_label, y_test_label = train_test_split(X_label, y_label, test_size=0.2,random_state=42)

    # Creo un'istanza del classificatore Decision Tree
    classifier_label = DecisionTreeClassifier()

    # Addestro il classificatore per l'etichetta corrente
    classifier_label.fit(X_train_label, y_train_label)

    # Calcolo la feature importance per l'etichetta corrente
    feature_importance_dict[label] = classifier_label.feature_importances_

# Creo un dataframe con i vettori di feature importance per le diverse etichette
df_feature_importance = pd.DataFrame(feature_importance_dict)

# Calcolo la correlazione di Pearson tra i vettori di feature importance
correlation_matrix = df_feature_importance.corr(method='pearson')

print("Correlazione di Pearson tra i vettori di feature importance:")
# Imposta l'opzione di stampa di pandas per visualizzare tutte le colonne e righe
# Lo faccio se no non riesco a visualizzare correttamente tutti i dati
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

# Stampo la matrice di correlazione
print(correlation_matrix)

# Ripristino le opzioni di stampa predefinite
pd.reset_option('display.max_columns')
pd.reset_option('display.max_rows')

# Creo la heatmap utilizzando seaborn e matplotlib
plt.figure(figsize=(10, 8))
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', fmt=".2f")
plt.title('Correlazione di Pearson tra i vettori di feature importance', fontsize=16)
plt.xlabel('Etichette di emozioni', fontsize=14)
plt.ylabel('Etichette di emozioni', fontsize=14)
plt.xticks(rotation=45, ha='right')
plt.yticks(rotation=0)
plt.show()
