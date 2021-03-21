defmodule FlightReservation.Users.Agent do
  use Agent

  alias FlightReservation.Users.User

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    uuid = UUID.uuid4()

    Agent.update(__MODULE__, &update_state(&1, user, uuid))

    {:ok, uuid}
  end

  def get(id), do: Agent.get(__MODULE__, &get_user(&1, id))

  defp update_state(state, %User{} = user, uuid), do: Map.put(state, uuid, user)

  defp get_user(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
