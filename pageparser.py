#!/usr/bin/env python
#-*-coding:utf-8-*-

from bs4 import BeautifulSoup
from urllib.parse import urlparse
import downloader
import re

def _get_cili_url(soup):
    """get_cili(soup).get the ajax url and Referer url of request"""

    # ajax_get_cili_url = 'https://www.javbus5.com/ajax/uncledatoolsbyajax.php?lang=zh'
    ajax_get_cili_url = 'https://www.javbus.com/ajax/uncledatoolsbyajax.php?lang=zh'

    '''
    0:
    '\n   var gid = 60013997586'
    1:
    '\r\n\tvar uc = 0'
    2:
    "\r\n\tvar img = '/pics/cover/apwc_b.jpg'"
    '''
    
    # ajax_data = soup.select('script')[9].text
    # for l in ajax_data.split(';')[:-1]:
    #     ajax_get_cili_url += '&%s' % l[7:].replace("'","").replace(' ','')

    html = soup.prettify()
    '''获取img'''
    img_pattern = re.compile(r"var img = '.*?'")
    match = img_pattern.findall(html)
    img=match[0].replace("var img = '","").replace("'","")

    '''获取uc'''
    uc_pattern = re.compile(r"var uc = .*?;")
    match = uc_pattern.findall(html)
    uc = match[0].replace("var uc = ", "").replace(";","")

    '''获取gid'''
    gid_pattern = re.compile(r"var gid = .*?;")
    match = gid_pattern.findall(html)
    gid = match[0].replace("var gid = ", "").replace(";","")

    ajax_get_cili_url = ajax_get_cili_url + '&gid=' + gid + '&img=' + img + '&uc=' + uc
    return ajax_get_cili_url


def _parser_magnet(html):
    """parser_magnet(html),get all magnets from a html and return the str of magnet"""

    #存放磁力的字符串
    magnet = ''
    soup = BeautifulSoup(html,"html.parser")
    # for td in soup.select('td[width="70%"]'):
        # magnet += td.a['href'] + '\n'
    
    avdist={'title':'','magnet':'','size':'','date':''}
    for tr in soup.find_all('tr'):
        i=0
        for td in tr:
            if(td.string):
                continue
            i=i+1
            avdist['magnet']=td.a['href']
            if (i%3 == 1):
                avdist['title'] = td.a.text.replace(" ", "").replace("\t", "").replace("\r\n","").replace("\n","")
            if (i%3 == 2):
                avdist['size'] = td.a.text.replace(" ", "").replace("\t", "").replace("\r\n","").replace("\n","")
            if (i%3 == 0):
                avdist['date'] = td.a.text.replace(" ", "").replace("\t", "").replace("\r\n","").replace("\n","")
        # print(avdist)
        magnet += '%s\n' % avdist

    return magnet

def get_next_page_url(entrance, html):
    """get_next_page_url(entrance, html),return the url of next page if exist"""
    print("done the page.......")
    soup = BeautifulSoup(html, "html.parser")
    next_page = soup.select('a[id="next"]')
    if next_page:
        next_page_link = next_page[0]['href'].split('/')[-2:]
        next_page_link = '/'+'/'.join(next_page_link)
        next_page_url = entrance + next_page_link
        print("next page is %s" % next_page[0]['href'].split('/')[-1])
        return next_page_url
    return None


def parser_homeurl(html):
    """parser_homeurl(html),parser every url on every page and yield the url"""

    soup = BeautifulSoup(html,"html.parser")
    main = soup.select_one('main.container')
    for url in main.select('a[data-toggle="tooltip"]'):
        yield url['href']


def parser_content(html):
    """parser_content(html),parser page's content of every url and yield the dict of content"""

    soup = BeautifulSoup(html, "html.parser")

    categories = {}

    updated_time_tag = soup.find("meta", property="og:updated_time")
    if updated_time_tag:
        updated_time = updated_time_tag.get("content")
    categories['updated_time'] = updated_time
    if updated_time == '':
        return

    published_time_tag = soup.find("meta", property="article:published_time")
    if published_time_tag:
        published_time = published_time_tag.get("content")
    categories['published_time'] = published_time
    if published_time == '':
        return

    return categories


