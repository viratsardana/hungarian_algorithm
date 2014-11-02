hungarian_algorithm
===================

hungarian algorithm implementation in matlab done for operation research project

Project Members
Virat Sardana -12bce1123
Rishabh Bhatia - 12bce1029


Problem Statement

E-commerce: Algorithm for calculating discounts

The scenario is:
•	e-commerce web-site
•	lots of products
•	lots of discounts mixed on these products
A product is identified by a unique ProductID and has a sales price. Very classic scenario. The product can also be in one or more discounts.
A discount can be of different types. One example of a discount is:
•	Buy two or more within a set of products and get X percent off each product
A line item can only get one discount thus once a line item has been discounted it is not available for other discounts.
Test Case Data:
•	Product-1: $10
•	Product-2: $10
•	Product-3: $50
•	Product-4: $100
Discount-A: Buy two or more and get 20 % off the any of the following products
•	Product-1
•	Product-2
•	Product-3
•	Product-4
Discount-B: Buy product and get 50 % off the following product
•	Product-3
Test Scenario 1:
Basket: containing line items with:
•	Product-1
•	Product-3
•	Product-4
Calculation #1:
•	Discount-A: Product-1, Product-3, Product-4 = $2 + $10 + $20 = $32
•	= $32 total saving
Calculation #2:
•	Discount-A: Product-2, Product-4 = $2 + $20 = $22
•	Discount-B: Product-3 = $25
•	= $22 + $25 = $47 total saving
Which means that a combination of Discount-A and Discount-B will give the best possible discount for the customer.






Test Scenario 2:
Basket: containing line items with:
•	Product-3
•	Product-4
Calculation #1:
•	Discount-A: Product-3, Product-4 = $10 + $20 = $30
•	= $30 total saving
Calculation #2:
•	Discount-B: Product-3 = $25
•	= $25 total saving
Which means that applying Discount-A will give the best possible discount for the customer.
________________________________________
In order to calculate the best discount for a given basket, literally all combinations of products and available discounts on these products must be evaluated.
Normally there is 30-40 line items in a basket each with 0-3 discounts each.
Basically I'm stuck with finding an efficient way to do this calculation.
Right now the algorithm I have for applying the discounts is something like:
•	Clear discounts on the Basket
•	Get all unique ProductID's for LineItems in the Basket
•	Get all discounts available for these ProductID's
•	For-Each Discount (unordered)
•	Apply the Discount if it is satisfied by non-discount flagged line items
•	Flag line items in discount as discounted
But this is not at all sufficient as it does not try out different combinations of line items / discounts
SOLUTION TO THE PROBLEM
Assuming that:
1.	We can compute all available discounts based on your basket
2.	Each product can only have a single discount applied to it
3.	Each discount can only be used once

Then the problem becomes one that is called an assignment problem and can be optimally solved in O(n^3) using the Hungarian algorithm.

We will need to compute a matrix mat[x,y] containing the money saved if using discount a on product b. (If a discount does not apply, then set the money saved to 0.)
The Hungarian algorithm will compute the way of assigning discounts to products that saves the most money.
If we don't have the same number of discounts and products, then add dummy discounts (with zero savings) or dummy products (again with zero savings) until the number of discounts matches the number of products.

