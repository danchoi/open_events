require 'open-uri'
module CachedHtml

  CACHE_DIR = 'html_cache'
  `mkdir -p #{CACHE_DIR}`

  def filename(url)
    File.join(CACHE_DIR, munge(url))
  end

  def munge(url)
    url.sub("http://", '').sub(/\W$/, '').gsub('/', '.').gsub(/\W/, '-')
  end

  def cached_html(url)
    if File.size?(filename(url))
      File.read(filename(url))
    else
      puts "Fetching #{url}"
      res  = open(url)
      html = res.read
      File.open(filename(url), 'w') {|f| f.write html}
      puts "Cached html to #{filename(url)}"
      html
    end
  end
end
