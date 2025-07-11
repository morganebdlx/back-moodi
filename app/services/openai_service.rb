require "openai"
require "json"

class OpenAIService

  def initialize(weather:, forecast:, preferences:)
    @weather = weather
    @forecast = forecast
    @preferences = preferences

    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

 def call
    response = @client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_prompt }
        ],
        temperature: 0.7
      }
    )

    response.dig("choices", 0, "message", "content")
  end

  private

  def system_prompt
    "Tu es un assistant météo intelligent qui donne des recommandations pratiques et personnalisées en français selon la météo actuelle, les prévisions de la journée et les préférences utilisateur."
  end

  def user_prompt
    <<~PROMPT
      ### Météo actuelle
      Ville : #{@weather[:location]}
      Température : #{@weather[:temp_c]}°C
      Condition : #{@weather[:condition]}
      Vent : #{@weather[:wind_kph]} km/h
      Humidité : #{@weather[:humidity]}%
      UV : #{@weather[:uv]}

      ### Prévisions horaires
      #{@forecast.map { |f| "#{f[:hour]}h : #{f[:temp]}°C, #{f[:condition]}, UV #{f[:uv]}" }.join("\n")}

      ### Préférences utilisateur
      Activités sportives : #{@preferences[:sports].join(", ")}
      Style vestimentaire : #{@preferences[:clothing_style]}

      ### Ta tâche
      Donne 2 recommandations :
      - 1 pour s'habiller selon la météo et sa sensibilité
      - 1 sur le meilleur moment pour faire une activité de plein air comme vélo, running ou trail
      Format attendu :
      - Titre
      - Emoji
      - Description
      - Confiance (en %)
    PROMPT
  end
end
