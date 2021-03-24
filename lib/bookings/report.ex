defmodule FlightReservation.Bookings.Report do
  alias FlightReservation.Bookings.Agent, as: FlightAgent
  alias FlightReservation.Bookings.Booking

  def create(%{from_date: from_date, to_date: to_date}, filename) do
    flight_list = build_flight_list(from_date, to_date)

    File.write(filename, flight_list)
  end

  defp build_flight_list(from_date, to_date) do
    FlightAgent.list_all()
    |> Map.values()
    |> Enum.filter(fn flight -> compare_date(flight, from_date, to_date) end)
    |> Enum.map(fn flight -> flight_string(flight) end)
  end

  defp compare_date(%Booking{data_completa: data}, from_date, to_date) do
    result_from = Date.compare(data, from_date)
    result_to = Date.compare(data, to_date)

    (result_from == :gt or result_from == :eq) and (result_to == :lt or result_to == :eq)
  end

  defp flight_string(%Booking{
         id_usuario: user_id,
         cidade_origem: origem,
         cidade_destino: destino,
         data_completa: data
       }) do
    "#{user_id},#{origem},#{destino},#{data}\n"
  end
end
