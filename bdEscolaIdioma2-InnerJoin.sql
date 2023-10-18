 USE bdEscolaIdiomas2

--1)Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;

SELECT nomeAluno 'Nome do Aluno',nomeCurso 'Nome do Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idAluno=tbAluno.idAluno
		INNER JOIN tbTurma ON tbTurma.idTurma= tbMatricula.idTurma
			INNER JOIN tbCurso ON tbCurso.idCurso=tbTurma.idCurso

--2)Apresentar a quantidade de alunos matriculados por nome do curso;

SELECT COUNT (tbAluno.idAluno) 'quantidade de alunos matriculados',nomeCurso 'Nome do Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idAluno=tbAluno.idAluno
		INNER JOIN tbTurma ON tbTurma.idTurma= tbMatricula.idTurma
			INNER JOIN tbCurso ON tbCurso.idCurso=tbTurma.idCurso
				GROUP BY tbCurso.nomeCurso

--3)Apresentar a quantidadede alunos matriculados por nome da turma;

SELECT COUNT (tbAluno.idAluno) 'quantidade de alunos matriculados', nometurma 'Nome da Turma' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idAluno=tbAluno.idAluno
		INNER JOIN tbTurma ON tbTurma.idTurma= tbMatricula.idTurma
			GROUP BY tbTurma.nomeTurma


--4)Apresentar a quantidadede alunos que fizeram matricula em mar�o de 2016;

SELECT COUNT (tbAluno.idAluno) 'Quantidadde de Alunos', dataMatricula 'Data de Matricula' FROM tbAluno
		INNER JOIN tbMatricula ON tbMatricula.idAluno = tbAluno.idAluno
			WHERE MONTH (dataMatricula) = '03' AND YEAR (dataMatricula) = 2016
				GROUP BY tbMatricula.dataMatricula

--5)Apresentar o nome dos alunos em ordem alfab�tica ao lado do nome das turmas em que est�o matriculados

SELECT (nomeAluno) 'Nome do Aluno' , nomeTurma 'Nome da Turma' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idAluno = tbAluno.idAluno
		INNER JOIN tbTurma ON tbTurma.idTurma = tbMatricula.idTurma
			ORDER BY nomeAluno

-- 6)Apresentar o nome dos cursos e os hor�rios em que eles s�o oferecidos

SELECT nomeCurso 'Curso',  horarioTurma 'Hor�rio' FROM tbCurso
	INNER JOIN tbTurma
		ON tbTurma.idCurso = tbCurso.idCurso

--7)Apresentar a quantidade de alunos nascidos por estado

SELECT COUNT (idAluno) 'Alunos', naturalidadeAluno 'Estado' FROM tbAluno
	GROUP BY naturalidadeAluno

--8)Apresentar o nome dos alunos ao lado da data de matr�cula no formato dd/mm/aaaa

SELECT nomeAluno 'Aluno', FORMAT(dataMatricula,'d','pt-br') 'Data da Matr�cula' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idMatricula = tbAluno.idAluno

--9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de ingl�s

SELECT nomeAluno 'Aluno',nomeCurso 'Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.idAluno=tbAluno.idAluno
		INNER JOIN tbTurma ON tbTurma.idTurma= tbMatricula.idTurma
			INNER JOIN tbCurso ON tbCurso.idCurso=tbTurma.idCurso
				WHERE nomeAluno LIKE 'A%' AND nomeCurso = 'Ingl�s'	

--10)Apresentar a quantidade de matriculas feitas no ano de 2016

SELECT COUNT(idMatricula) 'Matr�cula', dataMatricula'Data da matr�cula' FROM tbMatricula
	WHERE YEAR (dataMatricula) = 2016
		GROUP BY tbMatricula.dataMatricula