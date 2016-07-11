defmodule Flog.ControllerHelpers do
  # use Flog.Web, :controller
  import Flog.Router.Helpers
  @doc """
  Given a patterned string, this will return the map.

  Returns: a Map

  ## Examples

    iex> Flog.ControllerHelpers.patterned_string_to_map("dave: true, lisa: false, sarah: true")
    %{dave: true, lisa: false, sarah: true}
  """
  def patterned_string_to_map(string) do
    string
    |> String.split(", ")
    |> Enum.map(&(String.split(&1, ": ")))
    |> Map.new(fn [x, y] -> {String.to_atom(x), String.to_atom(y)} end)
  end

  def get_referer(conn) do
    case List.keyfind(conn.req_headers, "referer", 0) do
      {_, referer} ->
        referer
      nil ->
        page_path(conn, :index)
    end
  end
end
