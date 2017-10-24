#!/usr/bin/env python
"""This script combines the json files for each year into a single data set"""
import os
import io
import json

COMBINED_JSON = []

PATH = './analysis'
LISTING = os.listdir(PATH)
print LISTING
for result in LISTING:
    file_name = result.split('.')[0]
    print "current file is " + result
    #read in the file
    file_input = io.open(PATH + '/' + result)
    file_raw = file_input.read()
    parsed_json = json.loads(file_raw)
    for record in parsed_json:
        record['Year'] = file_name
        COMBINED_JSON.append(record)
with open('combined-results.json', 'wb') as outfile:
    json.dump(COMBINED_JSON, outfile)
