# server.py
# ��wsgirefģ�鵼��:
from wsgiref.simple_server import make_server
# ���������Լ���д��application����:
from hello import application

# ����һ����������IP��ַΪ�գ��˿���1943����������application:
httpd = make_server('', 1943, application)
print "Serving HTTP on port 1943..."
# ��ʼ����HTTP����:
httpd.serve_forever()