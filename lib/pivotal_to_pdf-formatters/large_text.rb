require 'rubygems'
require 'prawn'
require 'rainbow'
require_relative 'default'

module PivotalToPdf
  module Formatters
    class LargeText < Default # same as Default but larger text and no description

      def write_to(destination)
        Prawn::Document.generate("#{destination}.pdf",
                                 :page_layout => :landscape,
                                 :margin => [25, 25, 50, 25],
                                 :page_size => [302, 432]) do |pdf|

          setup_font(pdf)

          stories.each_with_index do |story, index|
            next if story.story_type == 'release' # save some trees

            padding = 10
            pdf.stroke_color = story.story_color
            pdf.stroke_bounds
            width = 370
            pdf.line_width=6
            # --- Write content
            pdf.bounding_box [pdf.bounds.left+padding, pdf.bounds.top-padding], :width => width do
              pdf.text max_len_str(story.formatted_name, 120), :size => 28, :inline_format => true
              pdf.fill_color "52D017"
              pdf.text story.formatted_labels, :size => 16
              pdf.text "\n", :size => 28
              pdf.fill_color "444444"
            end
            pdf.line(pdf.bounds.bottom_left, pdf.bounds.bottom_right)
            pdf.stroke_bounds

            pdf.text_box story.points, :size => 24, :at => [12, 30], :width => width-18 unless story.points.nil?
            pdf.fill_color "999999"
            pdf.text_box story.story_type.capitalize, :size => 16, :align => :right, :at => [12, 18], :width => width-18
            pdf.fill_color "000000"
            pdf.start_new_page unless index == stories.size - 1
          end

          puts Rainbow(">>> Generated PDF file in '#{destination}.pdf'").foreground(:green)
        end
      rescue Exception
        puts Rainbow("[!] There was an error while generating the PDF file... What happened was:").foreground(:red)
        raise
      end

      private

      def max_len_str(str, max_len)
        str.length <= max_len ? str : str[0...max_len-1] + '…'
      end

    end
  end
end
