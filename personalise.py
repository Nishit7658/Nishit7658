import torch
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import librosa
import numpy as np
import soundfile as sf
from deepface import DeepFace
import cv2

# ----------------------------
# TEXT EMOTION DETECTION
# ----------------------------
def advanced_text_emotion(text):
    tokenizer = AutoTokenizer.from_pretrained("j-hartmann/emotion-english-distilroberta-base")
    model = AutoModelForSequenceClassification.from_pretrained("j-hartmann/emotion-english-distilroberta-base")
    inputs = tokenizer(text, return_tensors="pt")
    with torch.no_grad():
        logits = model(**inputs).logits
    probs = torch.nn.functional.softmax(logits, dim=1)
    label_id = torch.argmax(probs).item()
    labels = ['anger', 'disgust', 'fear', 'joy', 'neutral', 'sadness', 'surprise']
    return labels[label_id], round(probs[0][label_id].item(), 2)

# ----------------------------
# VOICE EMOTION DETECTION
# ----------------------------
def extract_voice_features(audio_file):
    y, sr = librosa.load(audio_file, duration=3, offset=0.5)
    mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=40)
    return np.mean(mfccs.T, axis=0)

def dummy_voice_classifier(features):
    # Dummy classifier just based on mean value
    mean_feat = np.mean(features)
    if mean_feat > -100:
        return "happy"
    elif mean_feat > -200:
        return "neutral"
    else:
        return "sad"

def detect_voice_emotion(audio_file="voice.wav"):
    features = extract_voice_features(audio_file)
    return dummy_voice_classifier(features)

# ----------------------------
# FACIAL EMOTION DETECTION
# ----------------------------
def detect_face_emotion():
    cam = cv2.VideoCapture(0)
    print("Press 'q' to capture image")
    while True:
        ret, frame = cam.read()
        cv2.imshow("Capture Face", frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    cam.release()
    cv2.destroyAllWindows()
    try:
        result = DeepFace.analyze(frame, actions=['emotion'], enforce_detection=False)
        return result[0]['dominant_emotion']
    except Exception as e:
        return "Error detecting emotion"

# ----------------------------
# MAIN
# ----------------------------
if __name__ == "__main__":
    # Text
    text_input = input("Enter your text input: ")
    emotion_text, score = advanced_text_emotion(text_input)
    print(f"📝 Text Emotion: {emotion_text} ({score})")

    # Voice
    print("Recording 5 seconds of voice...")
    import sounddevice as sd
    voice = sd.rec(int(5 * 22050), samplerate=22050, channels=1)
    sd.wait()
    sf.write("voice.wav", voice, 22050)
    emotion_voice = detect_voice_emotion("voice.wav")
    print(f"🎤 Voice Emotion: {emotion_voice}")

    # Face
    print("Looking for facial emotion (press 'q' when ready)...")
    emotion_face = detect_face_emotion()
    print(f"😊 Facial Emotion: {emotion_face}")
