function [x, r, c] = pgmread(pgmfile)
% PGMREAD  -- read a Portable Gray Map file.
%
% [x, r, c] = pgmread(pgmfile)
%
% The data in pgmfile is returned as a single vector x.  The number of
% rows and columns are returned in r and c respectively.
%
% The image can be viewed (the right way up) with something like the following:
%     [x, r, c] = pgmread('xxx.pgm'); 
%     imagesc(reshape(x, c, r)'); 
%     colormap('gray'); 
%     axis equal; 
%     axis tight


% Copyright (c)   Richard Everson,	Exeter University 2000
% $Id$
if nargin < 1, error('Which file?'); end

f = fopen(pgmfile);

line = fgetl(f);
if line ~= 'P5'
  error(sprintf('%s does not seem to be a (binary) PGM file', pgmfile))
end

% Skip comments
while 1
  line = fgetl(f);
  if line(1) ~= '#'
    break
  end
end


% Extract dimensions
[s, count] = sscanf(line, '%d');
c = s(1);
r = s(2);
line = fgetl(f);

[x, count] = fread(f, r*c, 'uchar');
if count < r*c
  error(sprintf('Count too small for %s', pgmfile))
end

fclose(f);
return
