function Graphs(Q, E, delta_t, ti, tf)

displayGraph(Q, delta_t, ti, tf, 'Joint variable', '$t$', '${\bf{q}}(\it{t})$', {'$q_1$', '$q_2$', '$q_3$'});
displayGraph(E, delta_t, ti, tf, 'End effector position error', '$t$', '$\bf{e}(\it{t})$', {'$e_x$', '$e_y$'});

end

