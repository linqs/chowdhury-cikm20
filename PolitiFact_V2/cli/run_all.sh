mkdir output
dataset=politifact
for alg in lr-big lr-uig pcs ucs cs;do
    echo "================= Running ${dataset} ${alg} ====================="
    for i in {1..30};do 
        ./learnNEval.sh ${dataset} ${alg} ${i}
    done > output/buzzfeed_run.out
    echo "Mertic Mean Std"
    grep -o "Accuracy:........" output/buzzfeed_run.out > temp.out
    val=$(./computeMeanStd.sh temp.out | tail -n1)
    echo "Accuracy ${val}"
    grep -o "F1:........" output/buzzfeed_run.out > temp.out
    val=$(./computeMeanStd.sh temp.out | tail -n1)
    echo "F1 ${val}"
    grep -o "Positive Class Precision:........" output/buzzfeed_run.out > temp.out
    val=$(./computeMeanStd.sh temp.out | tail -n1)
    echo "Precision ${val}"
    grep -o "Positive Class Recall:........" output/buzzfeed_run.out > temp.out
    val=$(./computeMeanStd.sh temp.out | tail -n1)
    echo "Recall ${val}"
    rm temp.out
done
