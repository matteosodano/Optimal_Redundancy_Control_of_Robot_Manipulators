function displayGraph(fvals, delta_t, ti, tf, title_str, xlabel_str, ylabel_str, legend_str)

figure('Name',title_str,'NumberTitle','off');
plot(ti:delta_t:tf, fvals, 'LineWidth',2); 
grid on;
title(title_str); 
x = xlabel(xlabel_str); 
y = ylabel(ylabel_str);
l = legend(legend_str);
set(x, 'Interpreter', 'latex');
set(y, 'Interpreter', 'latex');
set(l, 'Interpreter', 'latex');
end

