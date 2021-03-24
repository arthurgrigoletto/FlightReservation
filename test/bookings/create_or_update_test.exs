defmodule FlightReservation.Bookings.CreateOrUpdateTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Bookings.CreateOrUpdate
  alias FlightReservation.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      user = build(:user)

      FlightReservation.start_agents()
      {:ok, uuid} = UserAgent.save(user)

      {:ok, user_id: uuid}
    end

    test "should save an booking when all params are valid", %{
      user_id: id
    } do
      params = %{
        data_completa: ~N[2021-03-24 17:28:00],
        cidade_origem: "São Paulo",
        cidade_destino: "Campo Grande"
      }

      response = CreateOrUpdate.call(id, params)

      assert {:ok, _uuid} = response
    end

    test "should returns an error when user inexists" do
      params = %{
        data_completa: ~N[2021-03-24 17:28:00],
        cidade_origem: "São Paulo",
        cidade_destino: "Campo Grande"
      }

      response = CreateOrUpdate.call(UUID.uuid4(), params)

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
