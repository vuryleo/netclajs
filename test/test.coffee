assert = require 'assert'
NetClajs = require '../src/netclajs'
config = require './config'

describe 'NetClajs', () ->
  describe 'Login with correct account', () ->
    it 'should login without error', (done) ->
      netclajs = new NetClajs config
      netclajs.login done
  describe 'Login with incorrect account', () ->
    it 'should throw error', () ->
      netclajs = new NetClajs {
        username: 'wrong'
        username: 'fault'
      }
      netclajs.login (err) ->
        assert err is Error 'login failed'

