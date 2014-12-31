def hello_world(**kwargs)
  name = kwargs[:name] || "Bob"
  "Hello World, #{name}!"
end
