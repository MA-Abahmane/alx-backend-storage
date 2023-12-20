#!/usr/bin/env python3

"""
Implementing an expiring web cache and tracker
"""

import redis
import requests as req
from typing import Callable
from functools import lru_cache, wraps

# Redis database connection
db = redis.Redis()


def count_calls(func: Callable) -> Callable:
    """
        Decorator to count how many times a function is called.
        Increments the count in the Redis database.
        Caches the page content with a 10-second expiration time.
    """
    @wraps(func)
    def wrapper(url):
        """
            Wrapper function that tracks the number
            of calls and caches the result.
        """
        # Increment the count in Redis
        db.incr(f'count:{url}')
        # Check if the page content is already cached
        cachedPage = db.get(f'cached:{url}')

        # Fetch the page content using the provided function
        if cachedPage:
            return cachedPage.decode('UTF-8')

        # Cache the page content with a 10-second expiration time
        response = func(url)
        db.setex(f'cashed:{url}', 10, response)

        return response
    return wrapper


@count_calls
def get_page(url: str) -> str:
    """
        uses the requests module to obtain the HTML content of
        a particular URL and returns it
    """
    response = req.get(url)
    return response.text
