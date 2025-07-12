defmodule TamnoonActionsTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Tamnoon,
       [
         [
           router: TamnoonActionsTest.Router,
           methods_modules: [TamnoonActionsTest.Methods.ActionMethods],
         ]
       ]}
      # Starts a worker by calling: TamnoonActionsTest.Worker.start_link(arg)
      # {TamnoonActionsTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TamnoonActionsTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
