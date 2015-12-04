defmodule KV.Bucket do
  def start_link do
    Agent.start_link(&HashDict.new/0)
  end

  def get(pid, key) do
    Agent.get(pid, &HashDict.get(&1, key))
  end

  def put(pid, key, val) do
    Agent.update(pid, &HashDict.put(&1, key, val))
  end

  def delete(pid, key) do
    Agent.get_and_update(pid, &HashDict.pop(&1, key))
  end
end
