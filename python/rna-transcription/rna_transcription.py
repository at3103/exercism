from collections import defaultdict

def to_rna(dna):
	"""Converts a given dna strand into a rna strand"""
	
	# Create a map of dna to rna
	dna_complement = {'G':'C','C':'G','T':'A','A':'U'}
	
	# Check if it is an invalid dna strand
	if set(dna) - set(dna_complement.keys()):
		return ''
	
	return reduce(lambda acc,x: acc+dna_complement.get(x), list(dna),"")
