
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
