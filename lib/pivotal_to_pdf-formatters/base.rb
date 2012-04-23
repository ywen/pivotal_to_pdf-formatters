module PivotalToPdf
  module Formatters
    class Base
      attr_reader :stories
      private :stories
      def initialize(stories)
        @stories = stories
        p stories.size
      end
    end
  end
end
