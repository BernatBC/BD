CREATE TABLE comandes
         (	numComanda INTEGER,
	instantComanda INTEGER NOT NULL,
	client CHAR(30),
	encarregat INTEGER NOT NULL,
	supervisor INTEGER ,
	UNIQUE (instantComanda, client),
	PRIMARY KEY (numComanda),
	FOREIGN KEY (encarregat) REFERENCES EMPLEATS (NUM_EMPL),
	FOREIGN KEY (supervisor) REFERENCES EMPLEATS (NUM_EMPL));

CREATE TABLE productesComprats
         (	numComanda INTEGER not null,
	producte CHAR(20),
	quantitat INTEGER not null default 1,
	preu INTEGER,
	PRIMARY KEY (numComanda, producte),
	FOREIGN KEY (numComanda) REFERENCES comandes (numComanda));
