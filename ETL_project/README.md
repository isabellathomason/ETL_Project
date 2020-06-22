# ETL project report
our ETL project was about figuring out if there is any correlation to avocado price and the chipotle stock. We went in with the expectation that as the avocado prices rise, the price of the chipotle stock might be negatively affected as this would impact the profits that chipotle might make from their meal sales. 
EXTRACTION:
For this analysis we retrieved our data from the following sources:
https://www.kaggle.com/neuromusic/avocado-prices
https://www.kaggle.com/camnugent/sandp500
The first link contains a CSV file that reports weekly avocado prices from JAN 2015 to March 2018.
The second links contains a CSV file that reports the daily stock price (open, close, high, low, volume) from Feb 2013 to Feb 2018.
TRANSFORM: 
Avocado CSV:
We retrieved the following columns from the avocado csv:
    - Date (by Region):
        The CSV file reported dates for every sunday, so we added a +1 day to make the dates for every monday. This helped us in postgres to be able to merge the tables on dates as there are not stock prices on sundays. 
    - Average Price: 
        Since there were multiple rows of the same day we did a groupby after adding the +1 day to the date column and found a average avocado price for that particular date across many regions. 
    - Type (Organic vs Conventional):
        We searched Google to see if Chipotle used organic or conventional avocados and we found that most of chipotle's gaucamole was made from conventional avocados.
Chipotle Stock CSV:
We retrieved the following columns from the chipotle csv:
    - Date
    - Daily Change (Close - Open):
        We added this field to be able to compare the daily change for the given monday.
    - open
    - close
    - volume
    - name
Load:
We first created two tables in PostGres
    -Avocado
    -Chipotle
we merged the two tables on "Date" so our final table consists of 144 "Mondays" of data from Jan 2015 to Feb 2018 as the avocada data start from Jan 2015 but chipotle csv ends on Feb 2018. 


Limitation:
1. We excluded all the other variables which might affect chipotle stock prices.
2. We did not weight the avocado prices for each region, and ignored their variouble impacts on chipole stock price. 










