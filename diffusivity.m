function varargout = diffusivity(lambda, m, varargin)
%
% DIFFUSIVITY   Plots the diffusivity and flux function.
%               Mo phong khuech tan v� ham thong l??ng
%

if length(m)~=length(lambda)
   if length(m)==1
      m = m*ones(size(lambda));
   elseif length(lambda)==1
      lambda = lambda*ones(size(m));
   else
      error('m and lambda must be of same length or length=1.')
      return
   end
end

% Cm constant
Cm = Cmcalc(m)   ;

if nargin==2 % Plot diffusivity function
    % Gradient
    grad = linspace(0, 100, 200);
    
    % Calculate difusivity
    for i = 1 : length(m)
        dif(i,:) = 1 - exp(-Cm(i)./( (grad./lambda(i)+eps).^m(i) +eps));  % grad + eps to avoid division by zero (eps -> 0)
        % Calculate flux
        flux(i,:) = grad.*dif(i,:);
    end
    
    % Plot results
    subplot(2,1,1)
    for i = 1 : length(m)
        plot(grad, dif(i,:),eval(plotcolor(i)))
        if i==1
            hold on;
        end
    end
    ax = axis;
    for i = 1 : length(lambda)
        plot([lambda(i) lambda(i)], [ax(3) ax(4)], 'k:')
    end
    hold off;
    
    Cms = makestring(Cm);
    lambdas = makestring(lambda);
    ms = makestring(m);
    title(['Cm = ', num2str(Cms), ';   lambda = ', num2str(lambdas), ';   m = ', num2str(ms)])
    ylabel('Khuech tan')
    
    subplot(2,1,2)
    for i = 1 : length(m)
        plot(grad,flux(i,:), eval(plotcolor(i)) )
        if i==1
            hold on;
        end
    end
    ax = axis;
    for i = 1 : length(m)
        plot([lambda(i) lambda(i)], [ax(3) ax(4)], 'k:')
    end
    hold off;
    ylabel('Thong luong')
    xlabel('Cuong do Gradient')
    
    switch nargout
    case 0
        return
    case 1
        varargout{1} = Cm;
    case 2
        varargout{1} = Cm;
        varargout{2} = dif;
    case 3
        varargout{1} = Cm;
        varargout{2} = dif;
        varargout{3} = flux;      
    case 4
        error('Too many output parameters.')
    end
    
elseif nargin==3 % Calculates image diffusivity
    x = varargin{1};
    % Calculate difusivity
    dif = 1 - exp(-Cm./( (x/lambda+eps).^m +eps));  % grad + eps to avoid division by zero (eps -> 0)
    varargout{1}=dif;
    
else
    error('Too many inputs1.')
end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Cm = Cmcalc(m)
if any(m <= 1)
   error('Use m > 1')
   return
else
   for i = 1 : length(m)
      Cm(i) = fzero(  strcat(  '1-exp(-x)-x*exp(-x)*',num2str(m(i))  ),[1e-10 1e100]  );
   end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = plotcolor(i)
i = mod(i-1,7)+1;
c = ['b','r','g','c','m','k','y',];
y = [char(39), c(i), char(39)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function y = makestring(x)
y = '';
if all(x==x(1))
   y = num2str(x(1));
else
   for i = 1 : length(x)
      y = [y, num2str(x(i)),','];
   end
   y = y(1:end-1);
end
