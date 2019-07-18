defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    cond do
      String.length(input) == 0 ->
        "Fine. Be that way!"
      yelling?(input) && questioning?(input) ->
        "Calm down, I know what I'm doing!"
      yelling?(input) ->
        "Whoa, chill out!"
      questioning?(input) ->
        "Sure."
      true -> "Whatever."
    end
  end

  defp questioning?(input) do
    String.ends_with?(input, "?")
  end

  defp yelling?(input) do
    includes_letter?(input) && String.upcase(input) == input
  end

  defp includes_letter?(input) do
    String.upcase(input) != String.downcase(input)
  end
end
