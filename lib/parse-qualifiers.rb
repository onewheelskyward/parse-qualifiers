class String
	def parse_qualifiers()
		# This should probably move to someplace more common, but it's not used anywhere else.
		valid_operators = %w(eq gt gte lt lte ne contains)

		parsed_qualifiers = []
			qualifiers = self.split /,/
			qualifiers.each do |qualifier|
				matchdata = /([^;]+);([^;]+);+([^;]+)/.match(qualifier)
				if matchdata && valid_operators.include?(matchdata[2])
					# Three legged qualification
					parsed_qualifiers.push([matchdata[1], matchdata[2], matchdata[3]])
				end
			end
		parsed_qualifiers
	end
end
