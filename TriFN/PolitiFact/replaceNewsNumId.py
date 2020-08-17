import sys
import numpy as np
import pandas as pd

n_file = sys.argv[1]
nu_file = sys.argv[2]
nuI_file = sys.argv[3]
th = float(sys.argv[4]) if len(sys.argv) >= 5 else 2

nu = pd.read_csv(nu_file, sep='\t', header=None)
n = pd.read_csv(n_file, sep='\t', header=None)

nu[0] = n[0][nu[0]-1].values

nu.to_csv(nuI_file+".txt", sep='\t', header=None, index=False)
nu[nu[2] <= th].to_csv(nuI_file+"Share.txt", sep='\t', header=None, index=False)
nu[nu[2] > th].to_csv(nuI_file+"UltraShare.txt", sep='\t', header=None, index=False)

