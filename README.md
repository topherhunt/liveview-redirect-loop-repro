# Omg

App for reproing / demostrating a LiveView mount/crash loop bug.

## Repro steps

1. Create a fresh Phoenix app.

```
$ mix phx.new omg
$ cd omg
$ mix ecto.create
```

2. Install LiveView following the standard steps at https://github.com/phoenixframework/phoenix_live_view/

3. Add a new route and a controller action that renders a bare-bones liveview:

```
# router.ex
...
scope "/", OmgWeb do
  pipe_through :browser

  get "/", PageController, :index
  get "/live", PageController, :live
end
...
```

```
# page_controller.ex
...
def live(conn, _params) do
  live_render(conn, OmgWeb.OmgLive, session: %{})
end
...
```

```
# lib/omg_web/live/omg_live.ex
defmodule OmgWeb.OmgLive do
  use Phoenix.LiveView

  def mount(%{}, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
      Here's a string
    """
  end
end
```

4. Start the server: `mix phx.server`

5. In your browser, go to http://localhost:4000/. It renders the homepage.

6. Go to http://localhost:4000/live. It renders the LiveView's content and then stops, as expected.

7. Go to http://localhost:4000/live#. (Optionally add any text after the #.) The console spits out a constant loop of rendering messages, as if the page is getting continually redirected. You can also see the /live websocket generating tons of redirect-related frames.
