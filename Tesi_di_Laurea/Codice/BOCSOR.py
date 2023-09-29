import numpy as np
import pandas as pd
from catboost import CatBoostRegressor
from BoundaryCrossingSoloRatio import BoundaryCrossingSoloRatio, importance_accuracy
from sklearn.utils import resample

if __name__ == "__main__":
    current_path = "C:/Users/giaco/PycharmProjects/pandas_example1/"
    data = pd.read_csv(current_path + "data/whole_data_18.csv")  # Nuovo dataset fornito

    # Definizione delle colonne numeriche del nuovo dataset
    numerical_features = ["x", "y", "z", "E4_BVP", "E4_EDA", "E4_HR", "E4_IBI", "E4_TEMP",
                          "Attention", "delta", "lowAlpha", "highAlpha", "lowBeta", "highBeta", "lowGamma", "middleGamma",
                          "theta", "Meditation"]

    # Preparazione dei dati e target
    target = "external_arousal"
    labels = data[target].copy()
    features = data[numerical_features].copy()

    sample_size = 10000
    resampled_features, resampled_labels = resample(features, labels, n_samples=sample_size, random_state=42)

    # Addestramento del modello (CatBoostRegressor) con il dataset resampled
    model = CatBoostRegressor(iterations=10, learning_rate=0.1, depth=4, verbose=False).fit(X=resampled_features, y=resampled_labels)

    # Calcolo dell'importanza ground truth delle feature
    ground_truth_rank = np.argsort(model.feature_importances_)[::-1] + 1

    # Creazione dell'oggetto BoundaryCrossingSoloRatio con il nuovo dataset e il nuovo modello
    c = BoundaryCrossingSoloRatio(x=resampled_features,
                                  y=resampled_labels,
                                  classes=np.unique(resampled_labels),
                                  categorical_features=[],
                                  numerical_features=numerical_features,
                                  model=model,
                                  ground_truth_rank=ground_truth_rank)

    s = 15
    k = 10

    [csv, fi] = c.compute_feature_importance(s, k, current_path, save_to_file=True)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_rows', None)
    print(csv.head())
   # print(fi)
    feature_importance_dict = {}
    for feature_name, importance_value in zip(numerical_features, fi):
        feature_importance_dict[feature_name] = importance_value

    for feature_name, importance_value in feature_importance_dict.items():
        print(f"Feature: {feature_name}, Importance: {importance_value}")

    print(fi)
