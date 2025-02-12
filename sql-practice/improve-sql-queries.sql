----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

    -- Your code here
    --EXPLAIN QUERY PLAN
    --SELECT cats.* 
    --FROM cats 
    --JOIN cat_toys ON cats.id = cat_toys.cat_id
    --WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
    


----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- Your code here
    --EXPLAIN QUERY PLAN
    --SELECT cats.* 
    --FROM cats 
    --JOIN cat_toys ON cats.id = cat_toys.cat_id
    --WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
    --SCAN TABLE cat_toys
    --SEARCH TABLE cats USING INTEGER PRIMARY KEY (rowid=?)


-- What do your results mean?

    -- Was this a SEARCH or SCAN?


    -- What does that mean?




----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here

-- Paste your results below (as a comment):

    --Run Time: real 0.001 user 0.000767 sys 0.000049


----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

    -- Your code here
    CREATE INDEX idx_toyd ON cat_toys(toy_id);

-- Analyze Query:
    -- Your code here
    --EXPLAIN QUERY PLAN
    --SELECT cats.* 
    --FROM cats 
    --JOIN cat_toys ON cats.id = cat_toys.cat_id
    --WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):
 
    --SEARCH TABLE cat_toys USING INDEX idx_toyd (toy_id=?)
    --SEARCH TABLE cats USING INTEGER PRIMARY KEY (rowid=?)

-- Analyze Results:

    -- Is the new index being applied in this query?




----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here
    SELECT cats.* 
    FROM cats 
    JOIN cat_toys ON cats.id = cat_toys.cat_id
    WHERE cat_toys.toy_id = 5;

-- Paste your results below (as a comment):


-- Analyze Results:
    -- Are you still getting the correct query results?


    -- Did the execution time improve (decrease)?
    -- execution time improved drastically due to changing the inital plan from scan to search using an index


    -- Do you see any other opportunities for making this query more efficient?


---------------------------------
-- Notes From Further Exploration
---------------------------------