# USES Bezier.m and DeCasteljau.m

# Test 00
# Bezier curve for n = 3
figure
A = [1 1; 2 3; 4 3; 3 1]
Bezier(A, 250)

# Test 01
# Bezier curve for n = 3
# Reason: 1st and 4th points are the same
figure
A = [1 1; 2 3; 4 3; 1 1];
Bezier(A,250)

# Test 02
# Bezier curve for n = 3 
# Reason: Repeated 2 points
figure
A = [1 1; 2 3; 2 3; 3 1];
Bezier(A,250)

# Test 03
# Bezier curve for n = 3
# Reason: Modified the repeated points
figure
A = [1 1; 2 3; 2.2 3; 3 1];
Bezier(A,250)

# Test 04
# Bezier curve for n = 3
# Reason: One data point altered
figure
A = [1 1; 2 1; 4 3; 3 1]
Bezier (A, 250)


