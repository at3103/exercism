def distance(dna1, dna2):
	
	# Raise ValueError for unequal strings
	if len(dna1) != len(dna2):
		raise ValueError
	
	# Produce a pair of the respective characters in the dna and aggregate a count of mismatches
	return reduce(lambda dist, new_pair: dist + int(new_pair[0] != new_pair[1]), zip(dna1,dna2),0)
