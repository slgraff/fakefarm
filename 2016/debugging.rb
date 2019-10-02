# I’m calling a method, but I don’t know where it goes

_By [@tenderlove](twitter.com/tenderlove). Full post [I am puts debugger](https://tenderlovemaking.com/2016/02/05/i-am-a-puts-debuggerer.html)_

In the case where I’m calling a method, but I don’t know where that method is implemented, I’ll use the `method` method along with the `source_location` method. For example, I have an action in a controller that calls `render` and I want to find that method:

```ruby
def show
  render params[:id]
end
```

I’ll change the above code to this:

```ruby
def index
  p method(:render).source_location
  render params[:id]
end
```

Run this:

`$ curl http://localhost:3000/users/xxxx
`
Then in the logs I see this:
```
Processing by UsersController#show as */*
  Parameters: {"id"=>"xxxx"}
["/Users/aaron/git/rails/actionpack/lib/action_controller/metal/instrumentation.rb", 40]
Completed 500 Internal Server Error in 35ms (ActiveRecord: 0.0ms)
```
Now I know that the `render` method is in [instrumentation.rb on line 40](https://github.com/rails/rails/blob/6fcc3c47eb363d0d3753ee284de2fbc68df03194/actionpack/lib/action_controller/metal/instrumentation.rb#L40).
