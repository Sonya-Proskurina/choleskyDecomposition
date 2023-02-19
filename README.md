# Generating examples by the Cholesky method

A mobile application that implements an algorithm for generating systems of equations in which, when solved by the Cholesky method, only integers will occur. 

## Work example

![Screenrecorder-2023-02-07-03-50-33-871](https://user-images.githubusercontent.com/55708191/219957563-785e53c9-5917-466d-b408-c1469ed18638.gif)


## Algorithm
Consider the solution of the problem of generating
data systems of equations A * X = B on
the example of systems of three equations

1) Generate a matrix L – a 3-by-3 lower triangular matrix
whose elements are random integers from 1 to 10
2) By transposing, we obtain a matrix L+, the elements of which will also be
integers.
3) Further, knowing that A = L * LT, we obtain a matrix A, which will be a symmetric
positive definite matrix of dimension 3 by 3
4) To obtain the matrix B, we generate a matrix X of dimension 1 by 3,
the elements of which are random integers from 1 to 10.
5) Further, knowing the matrices A and X, as well as the fact that A * X = B, we will find a matrix B
that will have dimension 1 by 3 and whose elements will also be
integer

## Article
https://www.elibrary.ru/item.asp?id=50066238&pff=1

Proskurina S.A., Gaev L.V./ DEVELOPMENT OF AN APPLICATION ON FLUTTER FOR CREATING EDUCATIONAL EXAMPLES FOR WORKING OUT THE KHOLETSKY METHOD / International scientific and practical conference "INTERSECTORAL RESEARCH AS A BASIS FOR THE DEVELOPMENT OF SCIENTIFIC THOUGHT", Orenburg, December 27, 2022 – pp. 151-153
