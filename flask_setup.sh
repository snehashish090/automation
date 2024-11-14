# script to automatically setup projects for me
# I am first gonna try to auto setup a flask web project


echo "Your Project Name: "$1

echo "creating folder..."
cd ~/Developer
mkdir $1

echo "creating virtual env"
cd ~/Developer/$1

python -m venv env

echo "installing Flask and its dependencies"
source env/bin/activate
pip install Flask
pip install Flask-Session
pip install Flask-Mail
pip install menousdb # a database built by me
echo "dependencies installed"

echo "creating folders and files"
mkdir app
mkdir app/templates
mkdir app/static
mkdir app/tests
touch __main__.py
pip freeze > requirements.txt
touch .gitignore
touch app/app.py

cat <<EOF > app/app.py
from Flask import *
app = Flask($1)
EOF

cat <<EOF > __main__.py
from app.app import app

if __name__ == "__main__":
    app.run(debug=True)
EOF

touch app/templates/index.html

echo "seting up git repo"
git init
git add .
git commit -m "initial setup"

echo "all set and ready to go"


