require_relative "default"
module PivotalToPdf
  module Formatters
    class Asian < Default

      private

      def setup_font(pdf)
        pdf.font "#{Prawn::BASEDIR}/data/fonts/gkai00mp.ttf"
      end
    end
  end
end
