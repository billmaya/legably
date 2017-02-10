defmodule Legably.User do
  use Legably.Web, :model

  defstruct [:id, :lawyer, :firm, :first_name, :last_name, :email, :password,
             :bar_id, :bar_state, :phone, :firm_name, :area_of_focus,
             :street_address_1, :street_address_2, :city, :state, :zip]
             
end
