import Config

config :pratipad_example_server,
  node_name: :"server@172.16.0.129",
  cookie: :pratipad_cookie,
  server_name: :"dataflow@172.16.0.127",
  server_port: 17012,
  ecto_repos: [Pratipad.Example.Server.Repo]

config :pratipad_example_server, Pratipad.Example.Server.Repo,
  adapter: Ecto.Adapters.MyXQL,
  database: "pratipad_example",
  username: "pratipad",
  password: "pratipad",
  hostname: "localhost"

config :livebook, LivebookWeb.Endpoint,
  http: [ip: {0, 0, 0, 0}, port: 8080],
  server: true,
  pubsub_server: Livebook.PubSub,
  secret_key_base: "16Eu4wSifR2B7VPnikQdWsSh+lf0havzFj5JdC42VgeS4FFr4VU/lgzJ4ptZjMP5",
  live_view: [signing_salt: "pratipad"]

config :livebook,
  default_runtime: {Livebook.Runtime.Embedded, []},
  authentication_mode: :disabled

config :livebook,
       :cookie,
       :pratipad_cookie

config :livebook,
  root_path: "./livebooks"

config :phoenix, :json_library, Jason

# epmdless config with mTLS connection
# https://github.com/kentaro/epmdless-elixir-example
base_dir = Path.join(Path.dirname(__DIR__), "priv")

config :epmdless,
  transport: :tls,
  listen_port: 17_013,
  ssl_dist_opt: [
    server: [
      cacertfile: "#{base_dir}/ca.crt",
      certfile: "#{base_dir}/server.crt",
      keyfile: "#{base_dir}/server.key",
      fail_if_no_peer_cert: true,
      verify: :verify_peer
    ],
    client: [
      cacertfile: "#{base_dir}/ca.crt",
      certfile: "#{base_dir}/client.crt",
      keyfile: "#{base_dir}/client.key",
      verify: :verify_peer
    ]
  ]
