import re
from lxml import etree
import urllib
import urllib2

url = 'http://www.qiushibaike.com/pic/'
hander = {
        'Referer':'http://www.qiushibaike.com/pic/',
        'User-Agent':'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0'
        }

def qb(url):
    req = urllib2.Request(url,None,hander)#创建一个请求
    opens = urllib2.urlopen(req)#开始请求访问URL，返回结果赋值给opens
    content = opens.read()#读取opens内容
    img = re.findall(r'<img (.*?)src="(.*?)"',content,re.S)
    for j,i in img:
        try:
            name = i.rsplit('/',1)[1]#以/切分1次，取索引值为1的元素
            urllib.urlretrieve(i,name)#下载文件，比如音频，图片，视频
            print name,'is done'
        except:
            continue
qb('http://www.qiushibaike.com/pic/')
    


















