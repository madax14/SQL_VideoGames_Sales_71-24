
##Checking for NULL values
SELECT
  #FORMAT_DATE('%Y', release_date) AS `Year`,
  COUNT(*),
  COUNT(title) AS `Game`,
  COUNT(console) AS `Console`,
  COUNT(total_sales) AS `Total Sales`,
  COUNT( na_sales) AS `Na sales`,
  COUNT(jp_sales) AS `jp_sales`,
  COUNT(pal_sales) AS `pal_sales`,
  COUNT( other_sales) AS ` other_sales`
FROM
  `videogames-sales.Videos_Games_Sales.GamesSales_Table`

  
## MOst sold games
SELECT
  title,
  SUM(total_sales) AS `sales`
FROM
  `videogames-sales.Videos_Games_Sales.GamesSales_Table`
  GROUP BY title
ORDER BY
  sales DESC


## Sales trend
SELECT
  FORMAT_DATE('%Y', release_date) AS `Year`,
  SUM(total_sales) AS `Total Sales`
FROM
  `videogames-sales.Videos_Games_Sales.GamesSales_Table`
GROUP BY
  Year
ORDER BY
  Year DESC

  
## Find the percentage of each country on sales of the total.
  Needed to use CASE because some of the row have null values, waht caused zero/zero erro.
  SELECT
  FORMAT_DATE('%Y', release_date) AS `Year`,

  CASE
    WHEN SUM(total_sales) = 0 THEN 0
    ELSE (SUM(na_sales) / SUM(total_sales)) * 100
END
  AS `USA`,
  CASE
    WHEN SUM(total_sales) = 0 THEN 0
    ELSE (SUM(jp_sales) / SUM(total_sales)) * 100
END
  AS `JAPAN`,
   CASE
    WHEN SUM(total_sales) = 0 THEN 0
    ELSE (SUM(pal_sales) / SUM(total_sales)) * 100
END
  AS `EUROPE`,
     CASE
    WHEN SUM(total_sales) = 0 THEN 0
    ELSE (SUM(other_sales) / SUM(total_sales)) * 100
END
  AS `OTHER`,
  
FROM
  `videogames-sales.Videos_Games_Sales.GamesSales_Table`
GROUP BY `Year`



  ## Consoles that sells more games
SELECT
console,
SUM(total_sales) AS `Total Sales`,
FROM
  `videogames-sales.Videos_Games_Sales.GamesSales_Table`

  GROUP BY console
  ORDER BY `Total Sales` DESC
