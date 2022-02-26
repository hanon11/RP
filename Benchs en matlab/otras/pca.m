function [U, lambda, tr] = pca(A, n)
% PCA:  Principal component analysis of a matrix.
%
% [U, lambda, tr] = pca(A, n)
% 
% A is a data matrix, each column of which is to be thought of as an
% observation or snapshot.  [U, lambda] = PCA(A) returns principal
% components of A as the columns of U and a vector eigenvalues as lambda.
%
% lambda = pca(A) returns a vector containing the eigenvalues.
%
% tr is the trace of A*A' which is the sum of the unnormalised eigenvalues.
%
% pca(A, n) finds just the first n eigenvalues and eigenvectors vectors, but
% this uses eigs which is slow compared with eig for small matrices.  It
% will often be much more efficient to find all the singular values and
% throw away the ones you don't want.

% Copyright (c)   Richard Everson,	Exeter University 2000
% $Id: pca.m,v 1.1 2001/01/11 09:39:38 reverson Exp $

if nargin < 1, error('PCA of what?'); end
[N, T] = size(A);
R = min(N, T);
if nargin < 2 | isempty(n), n = R; end
if n > R, n = R; end

opt.disp = 0;

if nargout < 2
  if N <= T
    if n < R, D = eigs(A*A', n, opt); else, D = eig(A*A'); end
  else
    if n < R, D = eigs(A'*A, n, opt); else, D = eig(A'*A); end
  end
  lambda = flipud(sort(D))/T;
  U = lambda;				% Name of first arg.
  return
end

if N <= T
  % Direct method.
  C = A*A';
  tr = trace(C);
  if n < R, [U, D] = eigs(C, n, opt); else, [U, D] = eig(C); end
  lambda = diag(D)/T;
  [lambda, I] = sort(lambda);
  lambda = flipud(lambda);
  I = flipud(I);
  U = U(:,I);
else
  % Snapshot method.
  disp('Snapshot');
  C = A'*A;
  size(C)
  tr = trace(C);
  if n < R, [V, D] = eigs(C, n, opt); else, [V, D] = eig(C); end
  lambda = diag(D)/T;
  S = sqrt(diag(D));
  [S, I] = sort(S);
  S = flipud(S);
  I = flipud(I);
  V = V(:,I);
  U = A*V*diag(1./S);
  lambda = lambda(I);
end
return
