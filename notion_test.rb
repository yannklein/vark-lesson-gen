require 'notion_api'
# https://blog.dan-murphy.com/notion-ruby/#getting-started

def init_notion
  @client = NotionAPI::Client.new("ya8TJH-klWi8yyV4yeA_3ErmzGmMq38wwJk5KhQ77IKMjnxLsS-UYpPYx8DiPE9ty7a8QF7hxfN68HKqxD43Krpi5Gz-GF5jU9ol4Eq7Xr6SZtBV6sRQ-mwuNcK132kGp-6G")
  url =  "https://www.notion.so/yannklein/Rails-Gems-JS-plugins-and-useful-APIs-d21ea4b8bea14655806d0bed68dd69ed"
  page = @client.get_page(url)
  @title = page.title
  # page.create(NotionAPI::TextBlock, "Hiya!")
  page.title
end

