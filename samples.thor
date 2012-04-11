require 'pygments'

class Samples < Thor
  desc 'highlight', 'highlights example code in the samples directory'
  def highlight
    Dir.glob('./samples/*css').each do |sample|
      html = Pygments.highlight(File.read(sample), lexer: :css)
      File.open "samples/highlighted/#{File.basename(sample)}.html", "w" do |f|
        f.write html
      end
    end
  end

  desc 'highlight_css', 'outputs the basic css for highlighting'
  def highlight_css
    puts Pygments.css('.highlight', style: :murphy)
  end
end
