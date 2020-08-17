shuf ../BuzzFeedNewsTruth.txt > BuzFNall.txt
head -n 145 BuzFNall.txt > BuzzFeedNewsObs.txt
tail -n 37 BuzFNall.txt > BuzzFeedNewsTruth.txt
cut -f1 BuzzFeedNewsTruth.txt > BuzzFeedNewsTarget.txt
java -Xmx128G -jar psl-cli-2.2.0-SNAPSHOT.jar -infer -model buzzfeed-learned.psl -data buzzfeed.data -output inferred-predicates -e org.linqs.psl.evaluation.statistics.DiscreteEvaluator -D log4j.threshold=INFO --postgres psl |grep F1
