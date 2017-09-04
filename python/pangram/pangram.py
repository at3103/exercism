import re

def is_pangram(sentence):
	# Convert the sentence to only alpha characters in lower case
	formatted_string = re.sub(r'[^a-zA-Z]','',sentence).lower()
	# Check if all 26 characters of the English alpahbet is present
	return len(set(formatted_string)) == 26
