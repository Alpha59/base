import time

from flask import Flask


app = Flask(__name__)



@app.route('/')
def hello():
    count = 0
    return 'Hello World! I have been seen {} times.\n'.format(count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)