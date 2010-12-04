require 'kramdown'
require 'pdfkit'

source = ARGV[0] || 'proposal.md'
output = source.sub(/\.md$/, '.pdf')

home = File.join(File.dirname(__FILE__), '..')

markdown = File.read(File.join(home, 'src', source))

html = Kramdown::Document.new(markdown).to_html

kit = PDFKit.new(html, :page_size => 'Letter')

kit.to_file(File.join(home, 'doc', output))

fork do
  system("open #{File.join(home, 'doc', output)}")
end
