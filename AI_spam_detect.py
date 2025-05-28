import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.metrics import classification_report

# Load the dataset
url = 'https://raw.githubusercontent.com/junioralive/india-spam-sms-classification/main/dataset/spam_ham_india.csv'
df = pd.read_csv(url)

# Preprocess the data
df['Label'] = df['Label'].map({'ham': 0, 'spam': 1})
X = df['Msg']
y = df['Label']

# Split the dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Vectorize the text
vectorizer = TfidfVectorizer()
X_train_vec = vectorizer.fit_transform(X_train)
X_test_vec = vectorizer.transform(X_test)

# Train the model
model = MultinomialNB()
model.fit(X_train_vec, y_train)

# Evaluate the model
y_pred = model.predict(X_test_vec)
print(classification_report(y_test, y_pred))

# Function to predict new messages
def predict_message(message):
    message_vec = vectorizer.transform([message])
    prediction = model.predict(message_vec)[0]
    return "SPAM" if prediction else "HAM"

# Example usage
message = "Congratulations! You've won a free ticket to Goa. Call now!"
print(f"Message: {message}")
print(f"Prediction: {predict_message(message)}")
