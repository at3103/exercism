defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  
  defmacro is_first_bit_set(code) do
	quote do: unqoute(code) &&& 1 == 1
  end

  def checkForCommand(code, myList) when code == 0 do 
	myList
  end

  def checkForCommand(code, myList) when is_first_bit_set do 
	checkForCommand(code ^^^ 1, myList ++ ["wink"])
  end
  
  def checkForCommand(code, myList) when code &&& 2 == 2 do 
	checkForCommand(code ^^^ 2, myList ++ ["double blink"])
  end


  def checkForCommand(code, myList) when code &&& 4 == 4 do 
	checkForCommand(code ^^^ 4, myList ++ ["close your eyes"])
  end


  def checkForCommand(code, myList) when code &&& 16 == 16 do 
	checkForCommand(code ^^^ 16, myList ++ ["jump"])
  end
  

  def checkForCommand(code, myList) when code &&& 32 == 32 do 
	checkForCommand(code ^^^ 32, Enum.reverse(myList))
  end

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
	checkForCommand(code, [])
  end
end

