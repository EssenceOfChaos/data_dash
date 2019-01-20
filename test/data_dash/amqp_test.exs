defmodule DataDash.AmqpTest do
  @moduledoc false
  use ExUnit.Case
  doctest DataDash

  test "connects to the RabbitMQ instance"do
    with {:ok, %AMQP.Connection{pid: pid}} <-
      AMQP.Connection.open(System.get_env("AMQP_URI"))
    do
      assert is_pid(pid)
    end
  end

end
