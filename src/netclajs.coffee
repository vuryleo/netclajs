request = require 'request'
url = require 'url'
urls = require './urls'

class NetClajs
  constructor: (@username, @password) ->
    @cookies = request.jar()
    @request = request.defaults jar: @cookies, followRedirect: false
  login: (callback) ->
    data =
      i_user: @username
      i_pass: @password
    @request.post urls.login, form: data, (err, res, body) =>
      callback err if err
      redirectUrl = url.parse res.headers.location, true
      if redirectUrl.query.status is 'SUCCESS'
        @request.get res.headers.location, (err, res, body) ->
          callback null
      else
        callback new Error 'login failed'
      console.log @cookies
  checkLogin: (callback, next) ->
    @request.get urls.dashboard, (err, res, body) =>
      if res.statusCode is 302
        @login (err) ->
          if err
            callback err
          else
            next()
      else
        next()
  courselist: (callback) ->
    @checkLogin callback, () =>
      @request.get urls.courselist, (err, res, body) =>
        callback err, body

module.exports = NetClajs

