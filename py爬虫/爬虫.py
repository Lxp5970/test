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
    req = urllib2.Request(url,None,hander)#����һ������
    opens = urllib2.urlopen(req)#��ʼ�������URL�����ؽ����ֵ��opens
    content = opens.read()#��ȡopens����
    img = re.findall(r'<img (.*?)src="(.*?)"',content,re.S)
    for j,i in img:
        try:
            name = i.rsplit('/',1)[1]#��/�з�1�Σ�ȡ����ֵΪ1��Ԫ��
            urllib.urlretrieve(i,name)#�����ļ���������Ƶ��ͼƬ����Ƶ
            print name,'is done'
        except:
            continue
qb('http://www.qiushibaike.com/pic/')
    


















