% Aldeguer, Colin B.
% 2ECE-A
% 10/27/2026
%% PROBLEM A: TRANSPOSE OPERATIONS
R = [ 5, -2,  0,  7; 
    1,  3, -4,  2; 
    6,  0,  8, -1 ];


Z = [  2 + 3i, -1 + 4i, 5 - 2i; 
    -3 + 1i,       6, 2 + 5i ];


%% Real Matrix displays
disp('Real Matrix R');
disp(transpose(R));
disp(R');
disp(R.');


% Complex Matrix displays
disp('Complex Matrix Z');
disp(transpose(Z));
disp(Z');
disp(Z.');

%% a. Which operations give identical results for the real matrix R?

% All three operations give identical results 
%% b. Which two operations give identical results for the complex matrix Z? 

% The transpose(Z) function and the dot ' operator Z' 
%% c. What additional operation is performed by the apostrophe operator ' when the matrix contains complex entries?

% the apostrophe conjugates the complex numbers
%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
A = [  2, -1,  3,  2;
    1,  4, -2,  1;
    3,  2,  1, -1;
    -2,  3,  4,  2 ];


b = [ 16; 
    -7; 
    6; 
    7 ];


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