# 🌤️ Moodi — Assistant Météo IA

**Moodi** est une application météo intelligente développée en React, connectée à l'API WeatherAPI. Elle fournit des informations météorologiques en temps réel, des recommandations personnalisées (vêtements, activités, déplacements) et une interface esthétique et animée.

---

## 🚀 Fonctionnalités

- 🔍 **Recherche météo** par ville
- 📍 Affichage des données actuelles : température, condition, UV, vent, humidité, lever/coucher du soleil
- 🤖 **Recommandations IA** contextuelles (vêtements, activités, trajet)
- 🎨 **Personnalisation** du thème (chaud / froid)
- 🌈 **Arrière-plan animé** selon la météo
- 📅 **Prévisions sur 7 jours**
- 📱 **Design mobile-first** et accessible

## 🔸 2. Backend (Rails API) — `README.backend.md`

```markdown
# 🔧 Moodi Backend — Ruby on Rails API

Backend de l’application Moodi, développé avec Ruby on Rails (API only). Ce backend permet de :

- Gérer les utilisateurs et leurs préférences météo
- Sauvegarder les requêtes météo
- Générer des recommandations IA personnalisées

---

## 🧱 Stack & Gems

### Ruby / Rails

- Ruby 3.2+
- Rails 7.1 (API mode)

### Gems essentielles

gem 'rack-cors'
gem 'jbuilder'
gem 'devise_token_auth'
gem 'ostruct'
gem 'httparty'
gem "devise"
gem "autoprefixer-rails"
gem "font-awesome-sass", "~> 6.1"
gem "sassc-rails"
gem "ruby-openai"
gem "solid_cable"
gem "solid_queue"
gem 'devise-jwt'

1. Clone du projet
bash

git clone https://github.com/ton-compte/moodi.git
cd moodi/backend

2. Installation des dépendances
bash

bundle install

3. Configuration de .env
Crée un fichier .env :

bash

touch .env
Et ajoute :

ini

WEATHER_API_KEY=ta_clé_weatherapi
FRONTEND_URL=http://localhost:5173
⚠️ Ne pas oublier d’ajouter .env à .gitignore.

4. Setup de la base de données
bash

rails db:create db:migrate db:seed

5. Lancement du serveur
bash

rails s
Le backend tourne sur http://localhost:3000

🔄 CORS pour React
Dans config/initializers/cors.rb :

ruby

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV.fetch('FRONTEND_URL', 'http://localhost:5173')

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end

### 👩‍💻 Auteur
Morgane Bourdillon
