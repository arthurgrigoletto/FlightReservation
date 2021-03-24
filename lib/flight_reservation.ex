defmodule FlightReservation do
  alias FlightReservation.Bookings.Agent, as: BookingAgent
  alias FlightReservation.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias FlightReservation.Bookings.Get, as: GetBooking
  alias FlightReservation.Bookings.Report, as: BookingReport
  alias FlightReservation.Users.Agent, as: UserAgent
  alias FlightReservation.Users.CreateOrUpdate, as: CreateOrUpdateUser

  def start_agents do
    UserAgent.start_link(%{})
    BookingAgent.start_link(%{})
  end

  defdelegate create_user(params), to: CreateOrUpdateUser, as: :call

  defdelegate create_booking(user_id, params), to: CreateOrUpdateBooking, as: :call

  defdelegate get_booking(booking_id), to: GetBooking, as: :call

  defdelegate generate_report(params, filename \\ "report.csv"), to: BookingReport, as: :create
end
