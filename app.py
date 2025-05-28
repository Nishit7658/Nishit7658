from flask import Flask, request, render_template
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB

# Load dataset from GitHub
url = "https://raw.githubusercontent.com/junioralive/india-spam-sms-classification/main/dataset/spam_ham_india.csv"
df = pd.read_csv(url)

# Convert 'Label' to 0 and 1
df['Label'] = df['Label'].map({'ham': 0, 'spam': 1})

# Add more Indian-style spam messages
extra_data = pd.DataFrame({
    'Label': [1, 1, 1, 1, 1, 1],
    'Msg': [
        'You won ₹1000! Claim now.',
        'Free recharge offer just for you!',
        'Click this link to get your prize.',
        'Congratulations! You have won a car.',
        'Urgent: Your account will be blocked. Click to verify.',
        'Get 50% cashback on your UPI now.'
    ]
})
df = pd.concat([df, extra_data], ignore_index=True)

# ✅ Drop empty or NaN messages
df.dropna(subset=['Msg'], inplace=True)

# Features and labels
X = df['Msg']
y = df['Label']

# Train/test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Vectorize text messages
vectorizer = TfidfVectorizer()
X_train_vec = vectorizer.fit_transform(X_train)
X_test_vec = vectorizer.transform(X_test)

# Train a Naive Bayes classifier
model = MultinomialNB()
model.fit(X_train_vec, y_train)

# Prediction function
def predict_message(message):
    vec = vectorizer.transform([message])
    pred = model.predict(vec)[0]
    return "SPAM" if pred else "HAM"

# Flask app
app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def home():
    prediction = ''
    if request.method == 'POST':
        message = request.form['message']
        prediction = predict_message(message)
    return render_template('index.html', prediction=prediction)

if __name__ == '__main__':
    app.run(debug=True)
