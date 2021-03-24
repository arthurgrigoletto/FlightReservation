defmodule FlightReservation.Bookings.AgentTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Bookings.Agent, as: BookingAgent

  describe "save/1" do
    test "should save an booking" do
      booking = build(:booking)

      BookingAgent.start_link(%{})

      assert {:ok, _id} = BookingAgent.save(booking)
    end
  end

  describe "get/1" do
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
