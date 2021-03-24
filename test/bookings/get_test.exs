defmodule FlightReservation.Bookings.GetTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Bookings.Agent, as: BookingAgent

  describe "call/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "should return an booking when booking exists" do
      booking = build(:booking)
      {:ok, uuid} = BookingAgent.save(booking)

      response = BookingAgent.get(uuid)

      expected_response = {:ok, booking}

      assert expected_response == response
    end

    test "should return an error when user does not exists" do
      uuid = UUID.uuid4()
      response = BookingAgent.get(uuid)

      expected_response = {:error, "Flight Booking not found"}

      assert expected_response == response
    end
  end
end
