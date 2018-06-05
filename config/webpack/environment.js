const { environment } = require('@rails/webpacker')
const coffee = require('./loaders/coffee')
const stylus = require('./loaders/stylus')

environment.loaders.append('coffee', coffee)
environment.loaders.append('stylus', stylus)
module.exports = environment
