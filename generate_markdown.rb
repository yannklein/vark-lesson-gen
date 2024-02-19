require 'redcarpet'
require 'redcarpet/render_strip'

def generate_markdown(text)
  #Initializes a Markdown parser
  # text.gsub!('\n', "<br>")
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  markdown.render(text)
end