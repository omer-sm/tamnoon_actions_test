defmodule TamnoonActionsTest.Router do
  @moduledoc """
  This module provides a default router for HTTP(S) requests, which builds and serves the web app.
  """

  use Plug.Router

  plug(Plug.Static,
    at: "/tamnoon",
    from: :tamnoon,
    gzip: false
  )

  plug(Plug.Static,
    at: "/",
    from: :tamnoon_actions_test,
    gzip: false
  )

  plug :match
  plug :dispatch

  get "/" do
    Tamnoon.LiveReload.try_recompile()
    Tamnoon.Compiler.build_from_root(TamnoonActionsTest.Components.Root)
    send_file(conn, 200, "tamnoon_out/app.html")
  end

  match _ do
    send_resp(conn, 404, "404")
  end
end
