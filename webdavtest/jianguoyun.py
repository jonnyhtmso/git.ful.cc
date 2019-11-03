from python_webdav import client

clt = client.Client('https://dav.jianguoyun.com/','/dav')
clt.set_connection(username='860003213@qq.com',password='yysyz0412')

ls = list(filter(lambda x:not x.startswith('_'),dir(clt)))
print(ls)
