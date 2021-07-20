defmodule Pratipad.Example.Server.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    start_node()

    children = [
      {Pratipad.Example.Server.Client,
       [
         forwarder_name: :pratipad_backwarder_input,
         backwarder_name: :pratipad_forwarder_output,
         max_retry_count: :infinity
       ]},
      {Pratipad.Example.Server.Repo, []}
    ]

    opts = [strategy: :one_for_one, name: Pratipad.Example.Server.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp start_node() do
    node_name = Application.fetch_env!(:pratipad_example_server, :node_name)
    cookie = Application.fetch_env!(:pratipad_example_server, :cookie)
    dataflow = Application.fetch_env!(:pratipad_example_server, :dataflow)
    Node.start(node_name)
    Node.set_cookie(cookie)
    Node.connect(dataflow)
  end
end
