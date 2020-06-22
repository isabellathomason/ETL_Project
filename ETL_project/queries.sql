-- Create tables for raw data to be loaded into
CREATE TABLE avocado (
date Date PRIMARY KEY,
averageprice float
);

CREATE TABLE chipotle (
date Date PRIMARY KEY,
daily_change float,
open float,
close float,
volume INT,
name text
);


-- Joins tables
SELECT avocado.date, avocado.averageprice, chipotle.daily_change, chipotle.open, chipotle.close, chipotle.volume, chipotle.name
FROM avocado
INNER JOIN chipotle
ON avocado.date = chipotle.date;