# Webpacker + CoffeeScript + Stylus + ActionCable sample app

This is a sample app using Rails 5.2 and these libraries.

## [Webpacker](https://github.com/rails/webpacker) (no sprockets)

```shell
rails new myapp --webpack --skip-sprockets
rails webpacker:install
```

## [CoffeeScript](https://github.com/rails/webpacker#coffeescript)

```shell
rails webpacker:install:coffee
```

## [Stylus](http://stylus-lang.com/) for precompiling CSS

[This StackOverflow question](https://stackoverflow.com/questions/47452077/how-to-configure-the-webpacker-to-work-with-stylus-so-i-can-use-vuetify?rq=1) helped me setting up Stylus by pointing me to the [Vuetify documentation](https://vuetifyjs.com/en/style/theme#stylus-guide) on how to add a Stylus Webpack loader.

This resulted in me adding `config/webpack/loaders/stylus.js` and calling it in `config/webpack/environment.js`:

```javascript
const stylus = require('./loaders/stylus')
environment.loaders.append('stylus', stylus)
```

I also had to add `.styl` to the list of webpacker extensions and add `app/assets` to the resolved_paths in `config/webpacker.yml`.

## [ActionCable](http://guides.rubyonrails.org/action_cable_overview.html)

[This blog post](https://evilmartians.com/chronicles/evil-front-part-3) helped me a lot trying to make ActionCable play nice with Webpacker, especially without sprockets.

This told me I had to install the actioncable package:

```shell
yarn add actioncable
```

And then use it as a module instead of a global variable:

```coffee
import ActionCable from 'actioncable'
```

To make it work locally, I also had to change the `config/initializers/content_security_policy.rb` and add `ws://localhost:3000` to the list of acceptable urls, along with the paths used by webpacker's live reload.

```ruby
policy.connect_src :self, :https, 'http://localhost:3035', 'ws://localhost:3035', 'ws://localhost:3000' if Rails.env.development?
```
