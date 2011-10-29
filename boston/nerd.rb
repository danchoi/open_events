http://microsoftcambridge.com/DesktopModules/SIG-NERD_Events/RSSFeed.ashx?link=http://microsoftcambridge.com/Events/tabid/57/ctl/57/Default.aspx&OLink=http://microsoftcambridge.com:80/Default.aspx?TabId=57&eventid=47&Pid=0&DURL=57&path=http://microsoftcambridge.com/DesktopModules/SIG-NERD_Events

{
  format: :xml,
  title: 'Microsoft NERD',
  categories: %w(tech software),
  locations: ['Kendall Square'],
  nodes: -> {
    @doc.search('item')
  },
  date: ->(n) { n.at('description').inner_text[%r/<br \/>([^|]+\|[^|]+)/,1] },
  link: ->(n) { n.search('link')[-1].inner_text.strip },
  title: ->(n) { n.at('title').inner_text.strip },
  description: ->(n) { }
}
