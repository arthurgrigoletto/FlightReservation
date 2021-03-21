defmodule FlightReservation.Bookings.Get do
  alias FlightReservation.Bookings.Agent, as: BookingAgent

  def call(booking_id) do
    case BookingAgent.get(booking_id) do
      {:ok, booking} -> {:ok, booking}
      error -> error
    end
  end
end
