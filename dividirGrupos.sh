#!/bin/bash

echo -n "Quantas pessoas por grupo? "
read NUM

TOTAL=$(wc -l "alunos.csv" | cut -d" " -f1)
NUM_GRUPOS=$(( $TOTAL/$NUM ))
GRUPO_ATUAL=1

mapfile -t ALUNOS <<<`shuf alunos.csv`

for (( r = 0; r < ${#ALUNOS[*]}; r++ ))
do
	if [ $(( ($r+1) % $NUM )) -eq 1 ]; then
		echo -e "\nGRUPO" $GRUPO_ATUAL
		GRUPO_ATUAL=$(( $GRUPO_ATUAL + 1 ))
	fi
	ALUNO=$(sed -e 's/^"//;s/"$//' <<<${ALUNOS[$r]})
	echo $ALUNO
done	

exit 0
