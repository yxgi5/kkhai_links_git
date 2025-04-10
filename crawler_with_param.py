#!/usr/bin/env python
#-*-coding:utf-8-*-

import sys
import crawler
import time

if __name__ == '__main__':
	print(sys.argv[1])
	crawler.singleurl_handler(sys.argv[1])

