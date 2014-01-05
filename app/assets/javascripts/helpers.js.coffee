window.hasUppercaseCharacter = (string) -> /[A-Z]/.test string

window.underscore = ->
  _.forEach arguments, (item) ->
    for key, value of item when hasUppercaseCharacter key
      item[key.underscore()] = value 
      delete item[key]
  if arguments.length == 1 then arguments[0]