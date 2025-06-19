import random
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import Pipeline
from sklearn.model_selection import train_test_split
import joblib

# Sample spam templates
spam_templates = [
    "Congratulations! You've won a ${amount} {store} gift card. Click here to claim: {link}",
    "URGENT! Your account has been suspended. Verify now at {phishing_link}",
    "You have been selected for a FREE {item}. Claim it now before it expires!",
    "Earn ${amount} a week from home. No experience needed. Apply now!",
    "Your mobile number has won £{amount} in the {lottery} Lottery. Send your details to claim.",
    "We noticed unusual activity on your {service} account. Click here to secure it.",
    "This is not a joke! You are the lucky winner of our ${amount} sweepstakes!",
    "Get rich quick! Join our investment scheme and double your money in a week.",
    "Act Now! Your {store} package is on hold. Update your address here: {link}",
    "You owe IRS money. Pay immediately or face legal action. Call now!"
]

# Values to fill templates
stores = ["Walmart", "Amazon", "BestBuy", "Flipkart"]
items = ["iPhone", "Samsung Galaxy", "PlayStation 5", "Laptop"]
lotteries = ["UK", "Euro", "Mega Millions"]
services = ["PayPal", "SBI", "Google", "Facebook"]
amounts = [100, 500, 1000, 5000]
links = ["bit.ly/abc123", "tinyurl.com/winbig", "short.link/claim-now", "fake.link/gift"]
phishing_links = ["secure-login.net", "verify-now.org", "account-recovery.com"]

# Function to generate spam
def generate_spam_message():
    return random.choice(spam_templates).format(
        amount=random.choice(amounts),
        store=random.choice(stores),
        item=random.choice(items),
        lottery=random.choice(lotteries),
        service=random.choice(services),
        link=random.choice(links),
        phishing_link=random.choice(phishing_links)
    )

# Generate data
spam_data = [generate_spam_message() for _ in range(500)]
ham_data = [
    "Hey, are we meeting tomorrow?",
    "Your OTP is 458926.",
    "Don't forget to call mom.",
    "Meeting postponed to next week.",
    "Dinner at 8 pm?",
    "This is your daily bank balance update.",
    "Your order has been shipped.",
    "Join the Zoom class at 10 AM.",
    "I will be late today.",
    "Let's go out this weekend."
] * 50  # Replicating to match spam count

# Create DataFrame
df = pd.DataFrame({
    'message': spam_data + ham_data,
    'label': ['spam'] * len(spam_data) + ['ham'] * len(ham_data)
})

# Preprocess and train model
X_train, X_test, y_train, y_test = train_test_split(df['message'], df['label'], test_size=0.2, random_state=42)

model = Pipeline([
    ('tfidf', TfidfVectorizer()),
    ('clf', MultinomialNB())
])

model.fit(X_train, y_train)

# Save model
joblib.dump(model, 'spam_classifier.pkl')
