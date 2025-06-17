defmodule SwaggerLibTestWeb.ErrorJSONTest do
  use SwaggerLibTestWeb.ConnCase, async: true

  test "renders 404" do
    assert SwaggerLibTestWeb.ErrorJSON.render("404.json", %{}) == %{
             errors: %{detail: "Not Found"}
           }
  end

  test "renders 500" do
    assert SwaggerLibTestWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
