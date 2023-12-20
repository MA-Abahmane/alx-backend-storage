#!/usr/bin/env python3

"""
Implementing an expiring web cache and tracker
"""
import time
import requests as req
from functools import lru_cache


@lru_cache(maxsize=128, typed=False)
def get_page(url: str) -> str:
    """
        uses the requests module to obtain the HTML content of
        a particular URL and returns it
    """
    response = req.get(url)
    return response.text
