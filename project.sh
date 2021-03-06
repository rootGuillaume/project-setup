function project() {
  echo "### Running script... Please wait ###"

  if [ -d $1 ];then
    echo "ERROR: Directory already exists."
    echo "Script stop running."

  # Creating project folder and github repository
  else
    cd
    mkdir $1
    project.py $1
    cd ./$1

    git init
    git remote add origin https://github.com/username/$1.git

    touch README.md
    touch .gitignore

    git add .
    git commit -m "first commit"
    git push origin master

    echo "### Process complete ###"
  fi
}



function webproject() {
  echo "### Running script... Please wait ###"

  if [ -d $1 ];then
    echo "ERROR: Directory already exists."
    echo "Script stop running."

  # Creating project folder and github repository
  else
    cd
    mkdir $1
    project.py $1
    cd ./$1

    git init
    git remote add origin https://github.com/username/$1.git

    mkdir {css,fonts,img,js}

    touch README.md
    touch .gitignore
    touch index.html
    touch css/styles.css
    touch fonts/.keep
    touch img/.keep
    touch js/script.js

    git add .
    git commit -m "first commit"
    git push origin master

    echo "### Process complete ###"
  fi
}



function djangoproject () {
  echo "### Running script... Please wait ###"

  if [ -d $1 ]; then
    echo "ERROR: Directory already exists."
    echo "Script stop running."

  else
    cd
    mkdir $1
    project.py $1
    cd ./$1

    git init
    git remote add origin https://github.com/username/$1.git

    touch README.md
    touch .gitignore
    touch requirements.txt
    echo "venv/" >> .gitignore
    echo "myproject/myproject/settings.py" >> .gitignore

    python3 -m venv venv
    source venv/bin/activate

    echo "Installing Django..."
    pip install Django
    django-admin startproject $myproject
    echo "Django installed."

    echo pip freeze >> requirements.txt

    cd ./myproject/myproject
    cp settings.py template_settings.py
    sed -i '23d' ./template_settings.py
    sed -i '23iSECRET_KEY = ""' ./template_settings.py
    cd ../../

    git add .
    git commit -m "first commit"
    git push origin master

    echo "### Process complete ###"
  fi
}
