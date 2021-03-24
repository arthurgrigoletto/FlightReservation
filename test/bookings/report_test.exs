defmodule FlightReservation.Bookings.ReportTest do
  use ExUnit.Case

  import FlightReservation.Factory

  alias FlightReservation.Bookings.Agent, as: BookingAgent
  alias FlightReservation.Bookings.Report

  describe "create/1" do
    test "should create the report file" do
      user_id = UUID.uuid4()
      BookingAgent.start_link(%{})

      :booking
      |> build(id_usuario: user_id)
      |> BookingAgent.save()

      :booking
      |> build(id_usuario: user_id)
      |> BookingAgent.save()

      :booking
      |> build(data_completa: ~N[2021-04-20 17:30:00])
      |> BookingAgent.save()

      expected_response =
        "#{user_id},São Paulo,Campo Grande,2021-03-24 16:56:00\n" <>
          "#{user_id},São Paulo,Campo Grande,2021-03-24 16:56:00\n"

      Report.create(%{from_date: ~D[2021-03-20], to_date: ~D[2021-03-25]}, "report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected_response
    end
  end
end
