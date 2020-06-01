function animate(Q, name)

DHTABLE = dhtableRTB([0; 0; 0]);
r = SerialLink(DHTABLE, 'name', 'Planar 3r');
s = size(Q);
c = s(2);

if c == 1001
    q = Q(:, 1:10:c);
else
    q = Q;
end

%% animation
W = [-1.5 3.5 -1.5 3.5 -1 1];
V = [0 90];
d = 1.5;
red = 'r';
ts = 0.5;
jd = 1;
r.plot(q', 'delay', d, 'view', V, 'workspace', W, 'movie', name, 'linkcolor' , red, 'noname', 'nowrist', 'tilesize', ts, 'jointdiam', jd);

end

