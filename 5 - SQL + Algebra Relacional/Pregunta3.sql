create table presentacioTFG(
		idEstudiant CHAR(100),
		titolTFG CHAR(100) not null,
		dniDirector CHAR(50) not null,
		dniPresident CHAR(50) not null,
		dniVocal CHAR (50) not null,
		instantPresentacio INT not null,
		nota INT,
		primary key(idEstudiant),
		foreign key(dniDirector) references professors(dni),
		foreign key(dniPresident) references professors(dni),
		foreign key(dniVocal) references professors(dni),
		check(nota >= 0 and nota <= 10),
		check(dniDirector != dniVocal and dniDirector != dniPresident),
		check(dniVocal != dniPresident),
		unique(titolTFG, dniDirector)
		);
