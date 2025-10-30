
from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
import os

contexte = {
    "title": "404 — Not Found",
    "error_code": 404,
    "error_code_2": 403,
    "error_code 3": 401,
    "error_code 4": 400,
    "error_code 5": 429,
    "error_code 6": 500,
    "error_code 7": 502,
    "error_code 8": 503,

    "error_title": "Not Found",
    "error_title_2": "acces denied",
    "error_title_3": "Non autorisé",
    "error_title_4": "Mauvaise requête",
    "error_title_5": "Trop de requêtes",
    "error_title_6": "Erreur serveur interne",
    "error_title_7": "Bad gateway",
    "error_title_8": "service indisponnible",

    "error_type": "client",

    "error_text": "La page demandée est introuvable ou a été déplacée.",
    "error_text_2": "Vous n'avez pas l'autorisation de voir cette page.",
    "error_text_3": "Authentification requise ou invalide",
    "error_text_4": "requette mal formulée (URL/params/JSON non valides)",
    "error_text_5": "Trop de requêtes (rate-limit/WAF)",
    "error_text_6": "Erreur inattendue côté application",
    "error_text_7": "La passerelle (proxy WAF) a reçu une mauvaise réponse du backend.",
    "error_text_8": "Service indisponible (maintenance/surcharge)",
    
    "request_id": "abc123",
    "client_ip": "203.0.113.7",
    "request_time": "2025-10-15 10:42:00",
    "nonce_style": "randomNonceValue",
    # "button": "",
      "cta": {
        "label": "Contactez le support",
        "url": "https://support.ouitec.fr/#login"
    },
}

env = Environment(
    loader=FileSystemLoader("templates"),
    autoescape=select_autoescape(["html", "xml"])
)
tpl = env.get_template("error.html")

html = tpl.render(contexte)

os.makedirs("dist", exist_ok=True)
Path("dist/404.html").write_text(html, encoding="utf-8")
print("OK -> dist/404.html")

# on crée une page html css avec plusieurs structure , ensuite on cache les structure ( display none )