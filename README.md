# PratipadServer

## Usage

Start a dataflow:

```sh
$ ERL_DIST_PORT=44300 iex --name server@server.pratipad.local --erl "-proto_dist inet_tls" --erl "-ssl_dist_optfile config/tls.conf" -S mix
```
