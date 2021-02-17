defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(&String.replace(&1, ~r(_), " "))
    |> Enum.map(&String.split/1)
    |> List.flatten()
    |> Enum.map(&String.split(&1, "-", trim: true))
    |> List.flatten()
    |> Enum.reduce("", fn x, acc ->
      acc <> String.first(x)
    end)
    |> String.upcase()
  end
end
