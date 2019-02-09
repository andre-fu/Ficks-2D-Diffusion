function c = FicksDiffusion_2D(x0, y0, x, y, t, D)
 c = (1 ./(sqrt(4 .* pi .* D .* t))) * exp((-((x - x0 ).^2 + (y - y0) .^2))./(4 .* D .* t));
end 

