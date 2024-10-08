#!/bin/bash

awk 'BEGIN{FS="\t"}{if($2){print $2}}' blastoutputswissport.out > q1_accession.txt	#to extract subject accession for all HSPs
touch q2.txt
echo "alignment_length	%ID" > q2.txt
awk 'BEGIN{FS="\t"}{if($3){print $4,$3}}' blastoutputswissport.out > q2.txt
awk 'BEGIN{FS="\t"}{if($5 > 20){print $0}}' blastoutputswissport.out > q3.txt
awk 'BEGIN{FS="\t"}{if($4 < 100 && $5 > 20){print $0}}' blastoutputswissport.out > q4.txt
awk 'BEGIN{FS="\t"}{if($5 && $5 < 20){print $0}}' blastoutputswissport.out | head -20 > q5.txt
awk 'BEGIN{FS="\t"}{if($5 && $4 < 100){print $0}}' blastoutputswissport.out > q6.txt
awk 'BEGIN{FS="\t"}{if($5){print $0}}' blastoutputswissport.out | head -10 > q7.txt
grep "AEI" blastoutputswissport.out | awk 'BEGIN{FS="\t"}{if($7){print $7}}' > q8.txt
awk 'BEGIN{FS="\t"}{if($5){print $2}}' blastoutputswissport.out | uniq -c | awk 'BEGIN{FS"\t"}{if($1 > 1){print $0}}' | wc -l > q9.txt
awk '{print $0}' blastoutputswissport.out | head -6 > q10.txt && awk 'BEGIN{FS="\t"}{if($4){print $0, $5 /
 $4 * 100}}' blastoutputswissport.out >> q10.txt
