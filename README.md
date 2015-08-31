# Phoenix Template Engine for React

Inspired by [reactjs/react-rails](https://github.com/reactjs/react-rails "reactjs/react-rails")

## Usage

1. Add `{:react_phoenix, github: "mizchi/react_phoenix"}` to your deps in `mix.exs`.
2. Import `ReactPhoenix.Utils` and call `react_component`

page_view.ex

```
defmodule YourApp.PageView do
  use HelloPhoenix.Web, :view
  import ReactPhoenix.Utils
end
```

page.eex

```elixir
<%= react_component("HelloComponent", %{propA: 1, propB: 2}) %>
# => <div data-react-class="Hello" data-react-props='{\"a\":1}'></div>
```

## Prerender

if react_compoent's option, `prerender: true`, ReactPhoenix compiles react component in server side.

```elixir
ReactPhoenix.JSContext.load_javascript """
  var Hello = React.createClass({render: function(){return React.createElement('div', {}, "hello")}})
"""

# or

ReactPhoenix.JSContext.load_file "components.js" # expect precompiled javascripts

...

```elixir
<%= react_component("Hello", %{}, prerender: true) %>
# => <div data-react-class="Hello" data-react-props='{}'>hello</div>
```

## Optional: Client Side Rendering with react-ssr-mounter

```
npm install @mizchi/react-ssr-mounter --save
```

```js
window.Hello = React.createClass({
  render(){return <div><h1>hello</h1></div>;}
});

let {initComponents} = require('@mizchi/react-ssr-mounter');
window.addEventListener("load", () => {
  var components = initComponents();
});
```

## TODO

- [x] react_compoent prerender: false
- [x] react_compoent prerender: true
- [ ] Use v8 context pool
- [ ] .js renderer
- [ ] .jsx renderer
- [ ] .jade renderer for react-jade
- [ ] Cache by filename
- [ ] Reload renderer when template files change
