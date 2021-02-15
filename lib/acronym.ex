defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(" - ", " ") # This seems brittle. Is there a better way to accompish this?
    |> String.split()
    |> Enum.map(fn x -> String.split(x, "-") end)
    |> List.flatten()
    |> IO.inspect()
    |> Enum.reduce("", fn x, acc ->
      acc <> String.first(x)
    end)
    |> String.upcase()
  end
end
