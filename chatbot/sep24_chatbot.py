API_KEY = 'AIzaSyDE2VptjZdZC8SCjoNRWCfm5Xm_cdSdt5A'

from google import genai
from google.genai import types
from PIL import Image
from io import BytesIO

client = genai.Client(api_key=API_KEY)

chat = client.chats.create(model="gemini-2.5-flash")

# response = chat.send_message("I have 2 dogs in my house.")
# print(response.text)

# response = chat.send_message("How many paws are in my house?")
# print(response.text)

# for message in chat.get_history():
#     print(f'role - {message.role}',end=": ")
#     print(message.parts[0].text)

# while True:
    
#     c = input('\nChat: ')
#     if c == 'exit': break

#     res = chat.send_message_stream(c)
#     # print('Bot: ' + res.text)
#     print('\nBot: ', end="")
#     for chunk in res:
#         print(chunk.text, end=" ")
    

# for message in chat.get_history():
#     # print(f'role - {message.role}',end=": ")
#     # print(message.parts[0].text)
    
#     print(message)
    
    
    
# prompt = (
#     "Create a realistic image of a fancy black and red Lamboghini"
# )

# response = client.models.generate_content(
#     model="gemini-2.5-flash-image-preview",
#     contents=[prompt],
# )

# for part in response.candidates[0].content.parts:
#     if part.text is not None:
#         print(part.text)
#     elif part.inline_data is not None:
#         image = Image.open(BytesIO(part.inline_data.data))
#         image.save("generated_image.png")




# # Set up the wave file to save the output:
# def wave_file(filename, pcm, channels=1, rate=24000, sample_width=2):
#    with wave.open(filename, "wb") as wf:
#       wf.setnchannels(channels)
#       wf.setsampwidth(sample_width)
#       wf.setframerate(rate)
#       wf.writeframes(pcm)


# response = client.models.generate_content(
#    model="gemini-2.5-flash-preview-tts",
#    contents="Say cheerfully: Have a wonderful day!",
#    config=types.GenerateContentConfig(
#       response_modalities=["AUDIO"],
#       speech_config=types.SpeechConfig(
#          voice_config=types.VoiceConfig(
#             prebuilt_voice_config=types.PrebuiltVoiceConfig(
#                voice_name='Kore',
#             )
#          )
#       ),
#    )
# )

# data = response.candidates[0].content.parts[0].inline_data.data

# file_name='out.wav'
# wave_file(file_name, data) # Saves the file to current directory




# response = client.models.generate_images(
#     model='imagen-4.0-generate-001',
#     prompt='Robot holding a red skateboard',
#     config=types.GenerateImagesConfig(
#         number_of_images= 4,
#     )
# )
# for generated_image in response.generated_images:
#   generated_image.image.show()