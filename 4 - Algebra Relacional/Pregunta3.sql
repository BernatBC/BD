A=empleats{ciutat_empl->ciutat_empl2, num_empl->num_empl2, sou->sou2, nom_empl->nom_empl2, num_dpt->num_dpt2, num_proj->num_proj2}
B=empleats[ciutat_empl!=ciutat_empl2, num_empl != num_empl2, num_dpt=num_dpt2]A
D=B*departaments
E=D[num_dpt, nom_dpt]
