defmodule FlightReservation.Users.UserTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Users.User

  describe "build/5" do
    test "should returns the user when all params are valid" do
      response = User.build("Arthur", "arthur@teste.com", "12345678900")

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end
  end
end
