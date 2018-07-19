module JSONAPI
  module RSpec
    module Meta
      ::RSpec::Matchers.define :have_meta do |val|
        match do |actual|
          actual.key?('meta') &&
            (!val || actual['meta'] == val)
        end
      end

      ::RSpec::Matchers.define :contain_meta do |val|
        match do |actual|
          return false unless actual.key?('meta')
          return true if actual['meta'] == val

          if [actual['meta'], val].all?{|i| i.respond_to?(:to_a)}
            (val.to_a - actual['meta'].to_a).empty?
          else
            false
          end
        end
      end
    end
  end
end
