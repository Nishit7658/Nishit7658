from flask import Flask, request, render_template
import joblib

app = Flask(__name__)
model = joblib.load('spam_classifier.pkl')

@app.route('/', methods=['GET', 'POST'])
def home():
    prediction = ''
    if request.method == 'POST':
        message = request.form['message']
        prediction = model.predict([message])[0]
    return render_template('index.html', prediction=prediction)

if __name__ == '__main__':
    app.run(debug=True)
