defmodule Pratipad.Example.Server.Client do
  use Pratipad.Client, mode: :push, backward_enabled: true
  alias Pratipad.Client

  @impl Client.Push
  def push_message() do
    "pong!"
  end

  @impl Client.Backward
  def backward_message(message) do
    Logger.info("backward_message: #{inspect(message)}")
    GenServer.cast(self(), :push_message)
  end
end
