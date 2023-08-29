import requests

def get_weather(city):
    api_key = "YOUR_OPENWEATHERMAP_API_KEY"  # Ganti dengan kunci API OpenWeatherMap yang valid
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    
    response = requests.get(url)
    data = response.json()
    
    if data["cod"] == 200:
        weather = data["weather"][0]["main"]
        temperature = data["main"]["temp"]
        return weather, temperature
    else:
        return None, None

def main():
    city = input("Enter a city: ")
    weather, temperature = get_weather(city)
    
    if weather and temperature:
        print(f"Weather in {city}: {weather}")
        print(f"Temperature: {temperature}°C")
    else:
        print("City not found or weather data unavailable.")

if __name__ == "__main__":
    main()
