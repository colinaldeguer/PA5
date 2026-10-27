# PA5

Name: ALDEGUER, Colin B.

Section: 2ECE-A

Date Submitted: October 27, 2026

This Program Assignment demonstrates the use of MATLAB for matrix operations and solving a system of linear equations. Two programming problems were solved: transpose operations on real and complex matrices, and solving a 4×4 linear system using the Inverse Method and Cramer's Rule. The script ALDEGUER_PA5.m contains the full implementation.

```
% Aldeguer, Colin B.
% 2ECE-A
% 10/27/2026
% PROBLEM A: TRANSPOSE OPERATIONS
R = [ 5, -2, 0, 7;
1, 3, -4, 2;
6, 0, 8, -1 ];

Z = [ 2 + 3i, -1 + 4i, 5 - 2i;
-3 + 1i, 6, 2 + 5i ];

% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
A = [ 2, -1, 3, 2;
1, 4, -2, 1;
3, 2, 1, -1;
-2, 3, 4, 2 ];

b = [ 16;
-7;
6;
7 ];

```

# Problem A. TRANSPOSE OPERATIONS
This program defines two matrices: R, a 3×4 real matrix, and Z, a 2×3 complex matrix. For each matrix, the three transpose expressions are computed and displayed: transpose(A), A' (Hermitian transpose), and A.' (plain transpose). The results show how each operator behaves on real versus complex entries.
```

%% Real Matrix displays
disp('Real Matrix R');
disp(transpose(R));
disp(R');
disp(R.');

%% Complex Matrix displays
disp('Complex Matrix Z');
disp(transpose(Z));
disp(Z');
disp(Z.');
```

# Problem A-Answers. TRANSPOSE GUIDE QUESTIONS

a. Which operations give identical results for the real matrix R?

All three operations give identical results: transpose(R), R', and R.'. Since R has no imaginary components, there is nothing for the apostrophe operator to conjugate, so the Hermitian transpose and the plain transpose are the same.

b. Which two operations give identical results for the complex matrix Z?

transpose(Z) and Z.' give identical results. Both perform a plain transpose without touching the complex values. Z' gives a different result because it also conjugates.

c. What additional operation is performed by the apostrophe operator ' when the matrix contains complex entries?

The apostrophe operator ' performs complex conjugation in addition to transposition. That is, Z' is the complex-conjugate (Hermitian) transpose — it swaps rows and columns and flips the sign of every imaginary part. The dot-apostrophe .' skips the conjugation.

```

%% a. Which operations give identical results for the real matrix R?

% All three operations give identical results

%% b. Which two operations give identical results for the complex matrix Z?

% The transpose(Z) function and the dot ' operator Z.'

%% c. What additional operation is performed by the apostrophe operator ' when the matrix contains complex entries?

% the apostrophe conjugates the complex numbers
```

# Problem B. TWO METHODS FOR A LINEAR SYSTEM
The system of equations:

 2x1 -  x2 + 3x3 + 2x4 = 16
  x1 + 4x2 - 2x3 +  x4 = -7
 3x1 + 2x2 +  x3 -  x4 = 6
-2x1 + 3x2 + 4x3 + 2x4 = 7

is written in matrix form A·x = b. The program computes the solution in two ways: the Inverse Method and Cramer's Rule. The left-division operator is not used.
```
%% Inverse Method
x_inv = inv(A) * b;

%% Cramer's Rule
detA = det(A);
n = length(b);
x_cramer = zeros(n, 1);

for i = 1:n
Ai = A;
Ai(:, i) = b;
x_cramer(i) = det(Ai) / detA;
end
```

# Problem B-Results. REQUIRED CHECKS
The program displays both solution vectors, det(A), and the two norm checks. det(A) is nonzero, confirming a unique solution. Both norm(x_inv - x_cramer) and norm(A*x_inv - b) are approximately zero to numerical precision, confirming the two methods agree and that the solution satisfies the original system.
```
%% Displays and checks
disp('Inverse Method Solution (x_inv)');
disp(x_inv);

disp('Cramer''s Rule Solution (x_cramer)');
disp(x_cramer);

disp('det(A)');
disp(detA);

disp('Norm Checks');
disp(norm(x_inv - x_cramer));
disp(norm(A * x_inv - b));
```
