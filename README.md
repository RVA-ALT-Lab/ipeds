# IPEDS Data on Distance Education

This repo contains a whole bunch of source data collected from the IPEDS original data files.

# General Workflow for Data

Here is just a quick description, mostly for myself, about the ETL process for the data set.
1. Download desired table from IPEDS data source as a CSV
2. Import this CSV into SQL using table import wizard
3. Run necessary SQL query to produce desired data sets (mostly joins of tables)
4. Export those resultant SQL queries as JSON
5. Run various Python scripts against that JSON to combine/transform as necessary

# Data Dictionary

For most of the cases, we've tried to rename the variable and codes used in the originial IPEDS data tables to something more sensible and human readable:

Ex. EFDEEXC -> Exclusive_Distance

This occurs mostly for the names of specific columns. A lot of the actual value codes haven't been modified. In that case, I'll include reference dictionaries here for app development.

EFDEFEV (Level of Student)
1 -> All students total
2 -> Undergraduate total
3 -> Degree/certificate seeking total
11 -> Non-degree/certificate seeking total
12 -> Graduate

From this description from the IPEDS data dictionary, it's not clear to me how Degree/certificate seeking students differ from or are included in the counts for undergraduate or graduate total:

"Degree/certificate-seeking students  Students enrolled in courses for credit and recognized by the institution as seeking a degree, certificate, or other formal award. High school students also enrolled in postsecondary courses for credit are not considered degree/certificate-seeking."