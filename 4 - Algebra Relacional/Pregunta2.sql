A=empleats(ciutat_empl != 'MADRID')
B=empleats*departaments
C=A*departaments
D=B[num_dpt, nom_dpt]
E=C[num_dpt, nom_dpt]
F=D-E
