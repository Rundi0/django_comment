# About

This documents includes the information about setting up and adjusting the project locally.

<br>

## 🔨 Setup the project locally

## 🚧 Mandatory steps

Clone the project from GitHub

```bash
git clone git@github.com:Rundi0/django_comment.git
```

<br>

## 🔧 Setup the environment

### 📌 Setup dependencies

For running the application locally without a tool like Docker you would need to install all dependencies by yourself.
First of all you have to install Python3.11 on your machine since they are main infrastructure components.

Then you have to install Python dependencies that are used for running the application. For doing this we just use build-in tools and pip-tools.

```bash
# install pip-tools
pip install pip-tools

# create the environment
python -m venv venv

# activate the virtual environment
# unix
source ./venv/bin/activate

# windows (powershell/cmd)
.\venv\Scripts\activate



# install dependencies
pip install -r requirements/main.txt

# install dev dependencies
pip install -r requirements/dev.txt
```

**🤔 How to install new deps?**

```bash
requests~=2.31 >> pyproject.toml  # add a new dependency to the file
pip-compile pyproject.toml -o requirements/main.txt  # resolve the dependency (find sub-deps, check other packages sub-versions)
pip install -r requirements/main.txt  # perform the installation process
```

## 🏃‍♂️ Run the application

```bash
python -m uvicorn src.main:app
```

## Using `.env` file

```bash
# create the .env file base on the .env.default file
cp .env.default .env

# export all environment variables on Unix
set -o allexport; source .env; set +o allexport
```

> 💡 Also, you can use dotenv plugin if you familar with Zsh on Unix
>
> activate the virtual environment & export all environment variables automatically ༼ つ ◕_◕ ༽つ━☆ﾟ.\*･｡ﾟ

## Shame database

### Table:

> Comment:
> |Colume      | Type                     | Note                             |
> |------------|--------------------------|----------------------------------|
> |id          | bigint                   | generated by default as identity |
> |username    | character varying(32)    |                                  |
> |email       | character varying(254)   |                                  |
> |home_page   | character varying(200)   |                                  |
> |text        | character varying        |                                  |
> |created_at  | timestamp with time zone |                                  |
> |reply_to_id | bigint                   |                                  |

## About the application
