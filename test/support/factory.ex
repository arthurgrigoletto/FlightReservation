defmodule FlightReservation.Factory do
  use ExMachina

  alias FlightReservation.Users.User

  alias FlightReservation.Bookings.Booking

  def user_factory do
    %User{
      name: "Arthur",
      email: "arthur@teste.com",
      cpf: "12345678900"
    }
  end

  def booking_factory do
    %Booking{
      data_completa: ~N[2021-03-24 16:56:00],
      cidade_origem: "São Paulo",
      cidade_destino: "Campo Grande",
      id_usuario: UUID.uuid4()
    }
  end
end
