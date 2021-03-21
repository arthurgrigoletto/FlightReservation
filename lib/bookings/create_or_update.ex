defmodule FlightReservation.Bookings.CreateOrUpdate do
  alias FlightReservation.Bookings.Agent, as: BookingAgent
  alias FlightReservation.Bookings.Booking
  alias FlightReservation.Users.Agent, as: UserAgent

  def call(user_id, %{
        data_completa: data_completa,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino
      }) do
    with {:ok, _user} <- UserAgent.get(user_id),
         {:ok, booking} <- Booking.build(data_completa, cidade_origem, cidade_destino, user_id) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
