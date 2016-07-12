defmodule Flog.BioController do
  use Flog.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
