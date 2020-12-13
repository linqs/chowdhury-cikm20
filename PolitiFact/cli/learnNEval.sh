dataset=$1
alg=$2
fold=$3
# Ensure you have postgres installed and have a database named psl. For details visit https://linqs-data.soe.ucsc.edu/psl-docs/wikis/psl-wiki-2.1.0.html#UsingPostgreSQLwithPSL
#Learn Weights
java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -l org.linqs.psl.application.learning.weight.search.grid.ContinuousRandomGridSearch -model ${dataset}-${alg}.psl -data ${dataset}-${fold}-learn.data -output inferred-predicates -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl >output/${dataset}-${alg}-${fold}-learned.out
#Perform inference evaluation
java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -infer -model ${dataset}-${alg}-learned.psl -data ${dataset}-${fold}-eval.data -output inferred-predicates -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl > output/${dataset}-${alg}-${fold}-eval.out
grep "F1" output/${dataset}-${alg}-${fold}-eval.out 
