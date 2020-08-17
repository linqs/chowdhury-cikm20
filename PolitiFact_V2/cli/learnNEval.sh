#java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -l org.linqs.psl.application.learning.weight.search.grid.RandomGridSearch -model politifact.psl -data politifact-${1}-learn.data -output inferred-predicates-learn -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl -D gridsearch.weights=0.1:1.0>learn-${1}.log
#java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -l org.linqs.psl.application.learning.weight.search.grid.ContinuousRandomGridSearch -model politifact.psl -data politifact-${1}-learn.data -output inferred-predicates-learn -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl >learn-${1}.log
#java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -l org.linqs.psl.application.learning.weight.bayesian.GaussianProcessPrior -model politifact.psl -data politifact-${1}-learn.data -output inferred-predicates-learn -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl -D weightlearning.evaluator=org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D gpp.maxiter=50>learn-${1}.log
java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -infer -model politifact-big.psl -data politifact-${1}-eval.data -output inferred-predicates-${1} -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl |grep F1
