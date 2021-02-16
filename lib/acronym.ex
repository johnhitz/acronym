defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(fn x -> Macro.underscore(x) end)
    |> Enum.map(fn x -> String.replace(x, ~r(_), " ") end)
    |> Enum.map(fn x -> String.split(x) end)
    |> List.flatten()
    |> Enum.map(fn x -> String.split(x, "-", trim: true) end)
    |> List.flatten()
    |> Enum.reduce("", fn x, acc ->
      acc <> String.first(x)
    end)
    |> String.upcase()
  end
end
