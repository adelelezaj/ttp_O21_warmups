-- YET ANOTHER CASE WHEN PROBLEM :D

-- Return the titles and descriptions of all films, with a new column "Holiday",
-- that contains the holiday referenced in the film, if any, otherwise is blank.
-- all holiday's welcome :) 

-- EXAMPLE: 
-- title: "Fiction Christmas" -> 'Christmas'
-- description: "The story of a chritmas elf who ...." --> 'Christmas'
-- "Something About Mary" --> ""

-- BONUS: return all of the holiday films first, and sort all films with their 
-- respective holiday category in alphabetical order.

-- BONUS BONUS:
-- Our marketing team is doing a holiday promo. All holiday films 1/2.
-- Can you return the same results, but with the price reflecting the discount?

-- Feel free to peek at your previous warmup to remind yourself of the syntax.
WITH holiday_film AS (
    SELECT title, description,
        CASE 
        WHEN title ILIKE '%christmas%' OR description ILIKE '%christmas%' THEN 'Christmas'
        WHEN title ILIKE '%new year%' OR description ILIKE '%new year%' THEN 'New Year'
        WHEN title ILIKE '%thanksgiving%' OR description ILIKE '%thanksgiving%' THEN 'Thanksgiving'
        WHEN title ILIKE '%halloween%' Or description ILIKE '%halloween%' THEN 'Halloween'
        WHEN title ILIKE '%easter%' Or description ILIKE '%easter%' THEN 'Easter'
        ELSE NULL
        END AS holiday,
        rental_rate
    FROM film
    ORDER BY holiday asc NULLS LAST
    )
SELECT *,
CASE 
WHEN holiday IS NOT NULL THEN ROUND(rental_rate * 0.5,2)
ELSE rental_rate
END AS holiday_promo
FROM holiday_film;


  

