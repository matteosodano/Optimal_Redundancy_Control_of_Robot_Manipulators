function proj = projection(E, v) 

F = GramSchmidt(E);         % matrix of a orthonormal basis of E
proj = (F*F') * v;

end

