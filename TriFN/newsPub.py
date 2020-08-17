import csv
import sys

f = sys.argv[1]

with open(f) as fi:
    cf = csv.reader(fi)
    headerDone = False
    for row in cf:
        if not headerDone:
            headerDone = True
            continue
        if not (row[6] == "[]" or row[6] == "") :
            print("{}\t{}".format(row[0], row[6]))
        else:
            print("{}\t{}".format(row[0], "unknown"))
