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


# This part of the script uses the combined json and transforms it
# into a more concise data structure for display on the front end
def transformJson():
    transformed_json = []
    combined_record = io.open('./combined-results.json')
    raw_record = combined_record.read()
    new_parsed_json = json.loads(raw_record)
    for new_record in new_parsed_json:
        record_found = False
        for parsed_record in transformed_json:
            if new_record['ID'] == parsed_record['ID']:
                year_to_add = {
                    'Year': new_record['Year'],
                    'Total_Distance': new_record['Total_Distance'],
                    'Exclusive_Distance': new_record['Exclusive_Distance'],
                    'Some_Distance': new_record['Some_Distance'],
                    'None_Distance' : new_record['None_Distance'],
                    'InState_Students' : new_record['InState_Students'],
                    'OutOfState_Students' : new_record['OutOfState_Students'],
                    'US_Location_Unknown_Students' : new_record['US_Location_Unknown_Students'],
                    'International_Students' : new_record['International_Students'],
                    'Location_Unknown_Students' : new_record['Location_Unknown_Students']
                }
                parsed_record['Years'].append(year_to_add)
                record_found = True
                break
        # Here we add an object to the transformedJson if not found in initial loop
        if not record_found:
            new_school = {
                'ID' : new_record['ID'],
                'State': new_record['State'],
                'Institution_Name': new_record['Institution_Name'],
                'Enrollment_Level': new_record['Enrollment_Level'],
                'Institution_Level': new_record['Institution_Level'],
                'Control': new_record['Control'] ,
                'Years': []
            }
            transformed_json.append(new_school)
    with open('transformed-results.json', 'wb') as new_outfile:
        json.dump(transformed_json, new_outfile)

transformJson()
