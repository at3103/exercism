import re

def is_isogram(string):
	"""Check if a given string is an isogram"""
	# Format the given string resulting in only alpha characters in the same case
	formated_string = re.sub(r'[^a-zAZ]','',string).lower()
	# Check if the string contains only unique characters
	return len(set(formated_string)) == len(formated_string)
