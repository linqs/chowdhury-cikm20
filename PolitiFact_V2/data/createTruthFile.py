import csv
import sys

f = sys.argv[1]
of = sys.argv[2]

with open(f) as fp, open(of, 'w') as ofp:
    cf = csv.reader(fp)
    ocf = csv.writer(ofp, delimiter='\t')
    for row in cf:
        r = row[0].split('_')[1]
        if r == "Real":
            ocf.writerow([row[0], 0.0])
        else:
            ocf.writerow([row[0], 1.0])
