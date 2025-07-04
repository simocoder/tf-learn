# app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Python and AWS EC2 and CI/CD! (edited.)"
