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
