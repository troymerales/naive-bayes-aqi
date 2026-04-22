import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import CategoricalNB
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

# Load data
df = pd.read_csv("mandaue_final.csv")

# Mapping categorical pollution levels
mapping = {
    "Low": 0,
    "Medium": 1,
    "High": 2
}

# Apply mapping
features = ['no2', 'co', 'so2', 'o3', 'pm10', 'pm25']

for col in features:
    df[col] = df[col].map(mapping)

# Independent variables
X = df[features]

# Dependent variable
y = df['new_case']

# Handle missing values (just in case)
X = X.fillna(0)

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(
    X, y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

# Model (best for categorical features)
model = CategoricalNB()
model.fit(X_train, y_train)

# Predictions
y_pred = model.predict(X_test)

# Evaluation
print("Accuracy:", accuracy_score(y_test, y_pred))
print("\nConfusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred))