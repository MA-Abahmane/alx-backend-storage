#!/usr/bin/env python3

"""
Write a Python script that provides some stats about Nginx logs stored in
 MongoDB:
    * Database: logs
    * Collection: nginx
    * Display (same as the example):
    * first line: x logs where x is the number of documents in this collection
    * second line: Methods:
    * 5 lines with the number of documents with the method = ["GET", "POST", "PUT", "PATCH", "DELETE"] in this order (see example below - warning: it’s a tabulation before each line)
    * one line with the number of documents with:
    * method=GET
    * path=/status
"""

from pymongo import MongoClient


def log_stats():
    # Connect to MongoDB
    client = MongoClient()
    
    # Specify the database and collection
    db = client['logs']
    collection = db['nginx']

    # Count total number of logs
    total_logs = collection.count_documents({})
    print(f"{total_logs} logs")

    # Count logs for each method
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    for method in methods:
        count = collection.count_documents({"method": method})
        print(f"    method {method}: {count}")

    # Count status check logs
    status_check_count = collection.count_documents({"method": "GET", "path": "/status"})
    print(f"{status_check_count} status check")

    # Close the MongoDB connection
    client.close()


if __name__ == "__main__":
    log_stats()
