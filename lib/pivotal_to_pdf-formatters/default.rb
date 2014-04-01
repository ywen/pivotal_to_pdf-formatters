require 'rubygems'
require 'prawn'
require 'rainbow'

module PivotalToPdf
  module Formatters
    class Default < Base
      def write_to(destination)
        Prawn::Document.generate("#{destination}.pdf",
                                 :page_layout => :landscape,
                                 :margin      => [25, 25, 50, 25],
                                 :page_size   => [302, 432]) do |pdf|

          setup_font(pdf)

          stories.each_with_index do |story, index|
            padding = 10
            pdf.stroke_color = story.story_color
            pdf.stroke_bounds
            width = 370
            pdf.line_width=6
            # --- Write content
            pdf.bounding_box [pdf.bounds.left+padding, pdf.bounds.top-padding], :width => width do
              pdf.text story.formatted_name, :size => 14, :inline_format => true
              pdf.fill_color "52D017"
              pdf.text story.formatted_labels, :size => 8
              pdf.text "\n", :size => 14
              pdf.fill_color "444444"
              pdf.text story.formatted_description || "", :size => 10, :inline_format => true
              pdf.fill_color "000000"
            end
            pdf.line(pdf.bounds.bottom_left, pdf.bounds.bottom_right)
            pdf.stroke_bounds

            pdf.text_box story.points, :size => 12, :at => [12, 50], :width => width-18 unless story.points.nil?
            pdf.text_box "Owner: " + (story.respond_to?(:owned_by) ? story.owned_by : "None"),
              :size => 8, :at => [12, 18], :width => width-18

            pdf.fill_color "999999"
            pdf.text_box story.story_type.capitalize,  :size => 8,  :align => :right, :at => [12, 18], :width => width-18
            pdf.fill_color "000000"
            pdf.start_new_page unless index == stories.size - 1
          end
          # pdf.number_pages "<page>/<total>", {:at => [pdf.bounds.right - 16, -28]}

          puts Rainbow(">>> Generated PDF file in '#{destination}.pdf'").foreground(:green)
                                 end
      rescue Exception
        puts Rainbow("[!] There was an error while generating the PDF file... What happened was:").foreground(:red)
        raise
      end

      private
      def setup_font(pdf)
      end
    end
  end
end
