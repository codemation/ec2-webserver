from flask import Flask
app = Flask(__name__)
import setup
setup.run(app)
app.run('0.0.0.0','80', debug=True)
