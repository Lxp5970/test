from queue import Queue
import requests
from lxml import etree
from urllib import request
import os
import re
import threading


class Procuder(threading.Thread):
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36',
    }

    def __init__(self, page_queue, img_queue, *args, **kwargs):
        super(Procuder, self).__init__(*args, **kwargs)
        self.page_queue = page_queue
        self.img_queue = img_queue

    def run(self):
        while True:
            if self.page_queue.empty():
                break
            url = self.page_queue.get()
            self.parse_page(url)

    def parse_page(self, url):
        response = requests.get(url, headers=self.headers)
        text = response.text
        html = etree.HTML(text)
        imgs = html.xpath("//div[@class='page-content text-center']//img[@class!='gif']")
        for img in imgs:
            img_url = img.get('data-original')
            img_name = img.get('alt')
            img_name = re.sub(r'[?？.,。!！*/\\]', '', img_name)
            suffix = os.path.splitext(img_url)[1]
            filename = img_name + suffix
            self.img_queue.put((img_url, filename))


class Consumer(threading.Thread):
    def __init__(self, page_queue, img_queue, *args, **kwargs):
        super(Consumer, self).__init__(*args, **kwargs)
        self.page_queue = page_queue
        self.img_queue = img_queue

    def run(self):
        while True:
            if self.img_queue.empty() and self.page_queue.empty():
                break
            img_url, filename = self.img_queue.get()
            try:
                request.urlretrieve(img_url, 'images/' + filename)
            except ConnectionResetError as e:
                print('远程主机强迫关闭了一个现有的连接。'+str(e))
            print(filename + '下载完成')


def main():
    page_queue = Queue(1000)
    img_queue = Queue(1000)
    for x in range(1, 1001):
        url = 'https://www.doutula.com/photo/list/?page=%d' % x
        page_queue.put(url)
    for x in range(10):
        t = Procuder(page_queue, img_queue)
        t.start()
    for x in range(10):
        t = Consumer(page_queue, img_queue)
        t.start()


if __name__ == '__main__':
    if not os.path.exists("images/"):
        os.makedirs("images/")
    main()
