defmodule SecretHandshake do
  @commands %{1=>"wink", 2=>"double blink", 4=>"close your eyes", 8=>"jump"}
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
  use Bitwise 
  
  defmacro is_eq(code, value) do
    quote do: unquote(code) == unquote(value) 
  end

  # Recursion breaking condition
  @spec commands(code :: integer) :: list(String.t())
  def checkForCommand(command, code, myList) when code == 0 or command > 16 do 
	myList
  end

  # Check for valid condition
  def checkForCommand(command, code, myList) when is_eq(code &&& command, command) do 
	case command do
		16 ->  checkForCommand(command * 2, code ^^^ command, Enum.reverse(myList))
    
        _ -> checkForCommand(command * 2, code ^^^ command, myList ++ [@commands[command]])
    end 
  end
 
  def checkForCommand(command, code, myList) do 
	checkForCommand(command * 2, code ^^^ command, myList)
  end
  

  #spec commands(code :: integer) :: list(String.t())
  def commands(code) do
  checkForCommand(1, code, [])
  end
end

