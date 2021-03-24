defmodule FlightReservation.Users.AgentTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.User

  describe "save/1" do
    test "should save an user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert {:ok, _id} = UserAgent.save(user)
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "should return an user when user exists" do
      user = build(:user)

      {:ok, uuid} = UserAgent.save(user)

      response = UserAgent.get(uuid)

      expected_response =
        {:ok,
         %User{
           cpf: "12345678900",
           email: "arthur@teste.com",
           name: "Arthur"
         }}

      assert expected_response == response
    end

    test "should return an error when user does not exists" do
      uuid = UUID.uuid4()
      response = UserAgent.get(uuid)

      expected_response = {:error, "User not found"}

      assert expected_response == response
    end
  end
end
