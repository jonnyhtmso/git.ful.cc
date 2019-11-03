from python_webdav import client
from urllib.parse import unquote

clt = client.Client('https://dav.jianguoyun.com/','/dav/%e6%88%91%e7%9a%84%e5%9d%9a%e6%9e%9c%e4%ba%91/')
clt.set_connection(username='860003213@qq.com',password='yysyz0412')

ls = list(filter(lambda x:not x.startswith('_'),dir(clt)))
print(ls)
clt.mkdir('/dav/%e6%88%91%e7%9a%84%e5%9d%9a%e6%9e%9c%e4%ba%91/wistron') #新建文件夹的时候需要使用完整路径
clt.chdir('wistron')
clt.upload_file('/home/jovyan/home/webdavtest/jianguoyun.py')
lsfold = clt.ls()
print(lsfold)
pwd = clt.pwd()
print(pwd)

lsfold2 = [unquote(i[0]) for i in lsfold]
print(lsfold2)
