import os

from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello():
    return 'Cloud Austin is ... {}'.format(os.environ.get('STATUS', 'Okay I guess.'))

if __name__ == '__main__':
    # Bind to PORT if defined, otherwise default to 5000.
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
