module PivotalToPdf
  module Formatters
    class Teaser < Base
      def write_to(destination)
        p stories.map(&:formatted_name)
      end
    end
  end
end

