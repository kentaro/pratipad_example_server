import Config

config :pratipad_example_server,
  node_name: :"server@172.16.0.127",
  cookie: :pratipad_cookie,
  dataflow: :"dataflow@172.16.0.127",
  ecto_repos: [Pratipad.Example.Server.Repo]

config :pratipad_example_server, Pratipad.Example.Server.Repo,
  adapter: Ecto.Adapters.MyXQL,
  database: "pratipad_example",
  username: "pratipad",
  password: "pratipad",
  hostname: "localhost"
