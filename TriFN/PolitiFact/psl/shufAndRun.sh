shuf ../PolitiFactNewsTruth.txt > PolFNall.txt
head -n 192 PolFNall.txt > PolitiFactNewsObs.txt
tail -n 48 PolFNall.txt > PolitiFactNewsTruth.txt
cut -f1 PolitiFactNewsTruth.txt > PolitiFactNewsTarget.txt
java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -infer -model politifact-learned.psl -data politifact.data -output inferred-predicates -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl |grep F1
