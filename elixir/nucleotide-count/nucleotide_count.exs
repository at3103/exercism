defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  
  @spec count([char], char) :: non_neg_integer
  def count([], _ ), do: 0
  def count([head|rest_strand], nucleotide) when head==nucleotide, do: 1 + count(rest_strand, nucleotide)
  def count([_|rest_strand], nucleotide), do: count(rest_strand, nucleotide)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
  
	Enum.reduce( @nucleotides, %{}, fn(x, histMap) ->
		Map.put(histMap, x, count(strand, x))
	end )
  end
end
