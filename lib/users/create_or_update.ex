defmodule FlightReservation.Users.CreateOrUpdate do
  alias FlightReservation.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, email: email, cpf: cpf}) do
    {:ok, user} = User.build(name, email, cpf)

    UserAgent.save(user)
  end
end
