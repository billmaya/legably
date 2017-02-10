defmodule Legably.Repo do
  #use Ecto.Repo, otp_app: :legably

  @moduledoc """
  In memory repository.
  """

  def all(Legably.User) do
    [%Legably.User{id: "1", lawyer: true, firm: false, first_name: "Bill", last_name: "Maya",
                   email: "bill.maya@gmail.com", password: "Qwerty1234", bar_id: "1234", bar_state: "RI",
                   phone: "914.434.7258", firm_name: "", area_of_focus: "",
                   street_address_1: "", street_address_2: "", city: "", state: "", zip: ""},
     %Legably.User{id: "2", lawyer: false, firm: true, first_name: "Daniel", last_name: "Reilly",
                    email: "daniell.reilly@gmail.com", password: "Qwerty5678", bar_id: "", bar_state: "",
                    phone: "914.434.7258", firm_name: "Reilly & Associates", area_of_focus: "Corporate Law",
                    street_address_1: "60 Dorrance Street", street_address_2: "", city: "Providence", state: "RI", zip: "02903"},
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end

end
