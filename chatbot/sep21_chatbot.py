API_KEY = 'AIzaSyAD1y4kFtL0JG0ywzwvWtgt0c08oLmVdUs'

from google import genai

client = genai.Client(api_key=API_KEY)

# response = client.models.generate_content(
#     model="gemini-2.5-flash",
#     contents="Explain how AI works in a few words",
# )

# print(response.text)

response = client.models.generate_content_stream(
    model="gemini-2.5-flash",
    contents=["AI egninear road map"]
)
for chunk in response:
    print(chunk.text, end="")