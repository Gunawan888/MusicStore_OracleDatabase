# MusicStore_OracleDatabase
## Description
This project includes design and implementation of the music store object relational database in Oracle Database
### Requirement
Download Oracle SQL Developer to run the sql file: https://www.oracle.com/tools/downloads/sqldev-downloads.html

### Scenario
OMDB maintains information about music albums available for purchase from an online music
store. The database supports a website that allows users to query this information and search for
albums; visit https://music.amazon.com for an illustration of a similar website. Albums are
available as audio CDs, vinyl records, or in MP3 format for download. The price of albums varies
depending on the format, e.g. a vinyl record is typically more expensive than an audio CD of the
same album. New albums are generally more expensive than used items. Note that albums with the
same title can be released on different dates and on different media (i.e. release date, price, etc. of
vinyl, audio CD and MP3 can have different values for the same album title)

## Design & Implementation
The following are the schema design for the database:
### Entity Relationship Diagram
![RelationalModel](https://github.com/Gunawan888/MusicStore_OracleDatabase/blob/master/ERD.png)
### Relational Model
![RelationalModel](https://github.com/Gunawan888/MusicStore_OracleDatabase/blob/master/Relational_Model.png)

### Execute the code
Run Create_schema.sql then insert_data.sql to create the database

For testing purposes, run query_testing.sql or simply create your own query
