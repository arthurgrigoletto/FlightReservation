defmodule FlightReservation.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "should saves an user when all params are valid" do
      params = %{
        name: "Arthur",
        email: "arthur@teste.com",
        cpf: "12345678900"
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User Created or Updated successfully"}

      assert {:ok, _uuid} = response
    end
  end
end
