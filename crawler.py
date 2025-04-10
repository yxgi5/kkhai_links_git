#!/usr/bin/env python
#-*-coding:utf-8-*-

import sys
# import controler
import downloader
import pageparser
import time
from requests.exceptions import HTTPError

def get_dict(url):
    """get the dict of the detail page and yield the dict"""

    url_html = downloader.get_html(url)
    for detail_url in pageparser.parser_homeurl(url_html):
        try:
            detail_page_html = downloader.get_html(detail_url)
            dict_data = pageparser.parser_content(detail_page_html)
        # except Exception as err:
        #     with open('fail_url.txt', 'a') as fd:
        #         fd.write('%s %d: %s\n' % ('ERROR CODE', err.code, url))
        #     print("Fail to crawl %s\ncrawl next detail page......" % detail_url)
        #     continue
        except HTTPError as err:
            if err.response.status_code == 404:
                with open('404_url.txt', 'a') as fd:
                    fd.write('%s\n' % detail_url)
            else:
                with open('fail_url.txt', 'a') as fd:
                    fd.write('%s\n' % detail_url)
            print("Fail to crawl %s\ncrawl next detail page......" % detail_url)
            continue
        except Exception as err:
            with open('fail_url.txt', 'a') as fd:
                fd.write('%s\n' % detail_url)
            print("Fail to crawl %s\ncrawl next detail page......" % detail_url)
            continue

        yield dict_data, detail_url

def get_data_single(url):
    """get the dict of the detail page and yield the dict"""

    try:
        detail_page_html = downloader.get_html(url)
        dict_data = pageparser.parser_content(detail_page_html)
    except HTTPError as err:
        if err.response.status_code == 404:
            with open('404_url.txt', 'a') as fd:
                fd.write('%s\n' % url)
        else:
            with open('fail_url.txt', 'a') as fd:
                fd.write('%s\n' % url)
        print("Fail to crawl %s\ncrawl next detail page......" % url)
    except Exception as err:
        with open('fail_url.txt', 'a') as fd:
            fd.write('%s\n' % url)
        print("Fail to crawl %s\ncrawl next detail page......" % url)
    else:
        yield dict_data, url

def write_data(dict, url):
    with open('update_list.txt', 'a') as fd:
        fd.write('%s %s\n' % (url, dict))
        print("Success to crawl %s" % url)
    pass

def homeurl_handler(entrance):
    if entrance[-1] =='/':
        entrance = entrance[:-1]

    for dict_data,detail_url in get_dict(entrance):
        write_data(dict_data, detail_url)

def singleurl_handler(entrance):
    if entrance[-1] =='/':
        entrance = entrance[:-1]
    
    for dict_data, detail_url in get_data_single(entrance):
        write_data(dict_data, detail_url)

if __name__ == '__main__':
    homeurl_handler('https://www.kakahai.org/list')