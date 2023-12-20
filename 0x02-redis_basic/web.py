import requests
from functools import lru_cache
import time

@lru_cache(maxsize=None, typed=False)
def get_page(url: str) -> str:
    # Track the access count for the URL
    get_page.access_count[url] = get_page.access_count.get(url, 0) + 1
    print(f"Access count for {url}: {get_page.access_count[url]}")

    # Simulate a slow response
    time.sleep(5)

    # Make the request and return the HTML content
    response = requests.get(url)
    return response.text

# Dictionary to store the access count for each URL
get_page.access_count = {}