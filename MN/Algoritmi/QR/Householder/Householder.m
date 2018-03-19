% [USES] Algoritmi-ad-hoc/SST
function [Q, R, x] = Householder(A, b)
    n = length(b);
    Q = eye(n);

    % iterate through every step for creating the upper triangular matrix
    for p = 1 : (n - 1)
        % initialize vp with zeros
        vp = zeros(n, 1);
        % fill vp from i + 1 to n with the values from the p-th column of A
        vp((p + 1) : n) = A((p + 1) : n, p);
        % Calculate sigma and the p-th element of vp
        sigma_p = sign(A(p, p)) * norm(A(p : n, p));
        vp(p) = A(p, p) + sigma_p;
        % calculate the p-th step reflector
        Hp = eye(n) - 2 * vp * vp' / (vp' * vp);
        % remove elements under the p-th pivot in A
        A = Hp * A;
        Q = Hp * Q;
    endfor

    % Hn-1 * Hn-2 * ... * H2 * H1 * A = R
    % current Q = Hn-1 * Hn-2 * ... * H1, but for A = Q * R
    % => Q = inverse(current Q) = transpose(current Q)
    Q = Q';
    % A became an upper triangular matrix
    R = A;

    % Solve the upper triangular system
    % A * x = b <=> Q * R * x = b <=> R * x = transpose(Q) * b
    x = SST(R, Q' * b);
endfunction