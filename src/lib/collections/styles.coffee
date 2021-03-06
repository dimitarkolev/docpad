# Necessary
_ = require('underscore')

# Local
ElementsCollection = require(__dirname+'/elements')

# Styles Collection
class StylesCollection extends ElementsCollection

	# Add an element to the collection
	# Right now we just support strings
	add: (values,options) ->
		# Ensure array
		values = [values]  unless _.isArray(values)

		# Convert urls into script element html
		for value,key in values
			if _.isString(value) and /^\</.test(value) is false
				# convert url to script tag
				values[key] = """
					<link rel="stylesheet" href="#{value}" />
					"""

		# Call the super with our values
		super(values,options)


# Export
module.exports = StylesCollection
