from flask import Flask


app = Flask(__name__)

@app.route("/")
def index():
    return 'Hello World, this message is for route /'


@app.route("/krishan")
def index1():
    return 'Hello World, this message is for route /krishan'




if __name__ == '__main__':

    app.run(debug=True, host='0.0.0.0',port=80)
