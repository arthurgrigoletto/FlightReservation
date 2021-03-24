defmodule FlightReservation.Bookings.BookingTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Bookings.Booking

  describe "build/2" do
    test "should returns the item when all params are valid" do
      id_usuario = UUID.uuid4()
      response = Booking.build(~N[2021-03-24 16:56:00], "São Paulo", "Campo Grande", id_usuario)
      expected_response = {:ok, build(:booking, %{id_usuario: id_usuario})}

      assert response == expected_response
    end
  end
end
