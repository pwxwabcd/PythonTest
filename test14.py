import Image
im = Image.open('̽����.png')
print im.format, im.size, im.mode
#im.thumbnail((200, 100))
im.save('̽����.jpg', 'JPEG')