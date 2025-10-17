


from pathlib import Path
from jinja2 import Environment, FileSystemLoader, select_autoescape
import os

contexte = {
    "title": "404 — Not Found",
    "error_code": 404,
    "error_title": "Not Found",
    "error_type": "client",
    "error_text": "La ressource est introuvable.",
    "request_id": "abc123",
    "client_ip": "203.0.113.7",
    "request_time": "2025-10-15 10:42:00",
    "nonce_style": "randomNonceValue",
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