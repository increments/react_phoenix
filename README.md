# Phoenix Template Engine for React

Inspired by [reactjs/react-rails](https://github.com/reactjs/react-rails "reactjs/react-rails")

WIP: It is not ready to prerender in server side because of [this issue](https://github.com/strange/erlang-v8/issues/1 "Build failed on Mac · Issue #1 · strange/erlang-v8"). Now it only provides `react_component` utils.

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

```
<%- raw react_component("HelloComponent", %{propA: 1, propB: 2}, %{prerender: false}) %>
# => <div data-react-class="Hello" data-react-props='{\"a\":1}'></div>
```

## Client Side Rendering with react-ssr-mounter

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
