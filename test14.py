import Image
im = Image.open('Ì½ÊÓÂë.png')
print im.format, im.size, im.mode
#im.thumbnail((200, 100))
im.save('Ì½ÊÓÂë.jpg', 'JPEG')