function y = ldif( u,stepsize, nosteps, varargin)
%
% LDIF  Khuech tan tuyen tinh
%

[verbose, drawstep, imscale] = parse_inputs(varargin{:});

% Variable initialization
dif_time = 0;
if ndims(u) > 2
   error('Input image must be grayscale.')
   return
end
if strcmp(class(u),'double')
   y = u;
else
   y = double(u);
end

% Verifying inputs
[stepsize] = verify_inputs(stepsize, nosteps);

% Initial Drawing
if verbose
   figure(verbose);
   subplot(1,2,1); 
   if strcmp(imscale,'imscale')
      imagesc(y);
   else
      image(y);
   end
   colorbar
   title('Anh ban dau'); drawnow;
   difplot(u, 0, 0, 'Khuech tan tuyen tinh', verbose, imscale);
end

% Khuech tan 
for i=1:nosteps
   
   % Tinh toan Nhan
   sd = sqrt(2*stepsize(i));
   kern_index = -ceil(3*sd):ceil(3*sd);
   kern = normpdf(kern_index,0,sd);
   
   % Tinh toan anh moi
   y = conv2br(kern,kern,y);
   
   % Tinh toan thoi gian khuech tan
   dif_time = dif_time + stepsize(i);  
      
   % ve do thi   
   if verbose & ~mod(i,drawstep)
      difplot(y, dif_time, i, 'Khuech tan tuyen tinh', verbose, imscale);
   end
end

% do thi cuoi cung
if verbose
difplot(y, dif_time, i, 'Khuech tan tuyen tinh', verbose, imscale);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [verbose, drawstep, imscale] = parse_inputs(varargin)
verbose = -1;
drawstep = -1;
imscale = 'null';

for i = 1 : length(varargin)
   flag = 0;
   if strcmp(varargin{i},'imscale')
      imscale = 'imscale';
      flag = 1;
   end
   if flag == 0 & verbose == -1
      verbose = varargin{i};
      flag = 1;
   end
   if flag == 0 & drawstep == -1
      drawstep = varargin{i};
      flag = 1;
   end
   if flag == 0
      error('Too many parameters !')
      return
   end
end

if verbose == -1
   verbose = 0;
end

if drawstep == -1
   if verbose == 0
      drawstep = 0;
   else
      drawstep = 1;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [nstepsize] = verify_inputs(stepsize, nosteps)

% Verifying stepsize
if sum(size(stepsize)>1) == 0 % constant stepsize
   nstepsize = linspace(stepsize,stepsize,nosteps);
else
   if sum(size(stepsize)>1) > 1
      error('stepsize must be a row vector')
      return
   end
   if length(stepsize)~=nosteps
      error('length(stepsize) must be equal to number of steps')
      return
   end
   nstepsize = stepsize;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = normpdf(x,m,s)
y = exp( -.5*(( (x-m)./s).^2) ) ./ (sqrt(2*pi)*s);