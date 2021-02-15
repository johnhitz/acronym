defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.reduce("", fn x, acc ->
      acc <> String.first(x)
    end)
    |> String.upcase()
  end
end
