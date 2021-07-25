defmodule Pratipad.Example.Server.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    connect_node()

    children = [
      {Pratipad.Example.Server.Client,
       [
         name: :pratipad_example_server,
         forwarder_name: :pratipad_backwarder_input,
         backwarder_name: :pratipad_forwarder_output,
         max_retry_count: :infinity
       ]},
      {Pratipad.Example.Server.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Pratipad.Example.Server.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp connect_node() do
    server_name = Application.fetch_env!(:pratipad_example_server, :server_name)
    Node.connect(server_name)
  end
end
