from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

# --- 1. Connexion à MySQL ---
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",       # Adresse de ton serveur MySQL
        user="Cedric",        # Ton utilisateur MySQL
        password="159357",     # Ton mot de passe
        database="error_manager"
    )
# --- 1.1 Connexion 2 à MySQL ---
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",       # Adresse de ton serveur MySQL
        user="Amine",        # Ton utilisateur MySQL
        password="357258",     # Ton mot de passe
        database="error_manager"
    )

# --- 2. Récupérer les infos d'une erreur depuis la base ---
def get_erreur(code):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM error_page WHERE code = %s", (code,))
    erreur = cursor.fetchone()
    cursor.close()
    conn.close()
    return erreur

# --- 3. Page d'accueil (juste pour test) ---

@app.route('/')
def index():
    erreur = {"code": 404, "message": "Page introuvable."}
    return render_template("erreur.html", erreur=erreur)

# --- 4. Gestion dynamique des erreurs ---
@app.errorhandler(404)
def page_not_found(e):
    return afficher_page_erreur(404), 404

@app.errorhandler(500)
def server_error(e):
    return afficher_page_erreur(500), 500

@app.errorhandler(403)
def access_denied(e):
    return afficher_page_erreur(403), 403

# --- 5. Fonction qui affiche la page Jinja2 correspondante ---
def afficher_page_erreur(code):
    erreur = get_erreur(code)
    if erreur:
        return render_template("erreur.html", code=erreur["code"], description=erreur["message"])
    else:
        # Si l’erreur n’existe pas dans la base
        return render_template("erreur.html", code=code, description="Erreur inconnue.")

# --- 6. Lancer le serveur ---
if __name__ == "__main__":
    app.run(debug=True)


