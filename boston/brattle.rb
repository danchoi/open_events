{
  title: 'Brattle Theater Special Events',
  url: 'http://brattlefilm.org/category/calendar-2/special-events/',
  categories: %w(movies),
  locations: %w(harvard-square),
  events: {
    items: ->(doc) { doc.at('#calendarframe').xpath('./div') },
    date: ->(x) { if (x = x.at('.entry-meta'))
        x.inner_text
      else
        @res.last && @res.last[:date]
      end
    },
    title: ->(x) { x.at('.entry-title').inner_text },
    link: ->(x) { x.at('.entry-title a')['href'] },
    description: ->(x) {}
  }
}

__END__


{"date"=>" Fri, Oct 28", "link"=>"http://brattlefilm.org/2011/10/28/harvard-book-store-presents-chris-van-allsburg/", "title"=>" Harvard Book Store Presents Chris Van Allsburg "}
{"date"=>" Sat, Oct 29", "link"=>"http://brattlefilm.org/2011/10/29/harvard-book-store-presents-glenn-greenwald/", "title"=>" Harvard Book Store Presents Glenn Greenwald "}
{"date"=>nil, "link"=>"http://brattlefilm.org/2011/10/29/tanya-donelly/", "title"=>" Tanya Donelly "}
{"date"=>" Tue, Nov 1", "link"=>"http://brattlefilm.org/2011/11/01/harvard-book-store-presents-jim-lehrer/", "title"=>" Harvard Book Store Presents Jim Lehrer "}
{"date"=>nil, "link"=>"http://brattlefilm.org/2011/11/01/robert-todd/", "title"=>" Balagan Presents: Robert Todd’s Master Plan "}
{"date"=>" Sun, Nov 6", "link"=>"http://brattlefilm.org/2011/11/06/mom-dad-i-have-something-to-tell-you/", "title"=>" Mom & Dad: I Have Something to Tell You "}
{"date"=>" Mon, Nov 7", "link"=>"http://brattlefilm.org/2011/11/07/cinecache-presents-the-descendants/", "title"=>" CineCache Presents: The Descendants "}
{"date"=>" Tue, Nov 8", "link"=>"http://brattlefilm.org/2011/11/08/harvard-book-store-presents-lisa-randall/", "title"=>" Harvard Book Store Presents Lisa Randall "}
{"date"=>" Wed, Nov 9", "link"=>"http://brattlefilm.org/2011/11/09/harvard-book-store-presents-jonathan-lethem/", "title"=>" Harvard Book Store Presents Jonathan Lethem "}
{"date"=>nil, "link"=>"http://brattlefilm.org/2011/11/09/they-live/", "title"=>" They Live "}
{"date"=>" Thu, Nov 10", "link"=>"http://brattlefilm.org/2011/11/10/harvard-book-store-presents-adam-gopnik/", "title"=>" Harvard Book Store Presents Adam Gopnik "}
{"date"=>nil, "link"=>"http://brattlefilm.org/2011/11/10/boston-asian-american-film-festival-presents-almost-perfect/", "title"=>" Boston Asian American Film Festival Presents: Almost Perfect "}
{"date"=>" Fri, Nov 11", "link"=>"http://brattlefilm.org/2011/11/11/the-tobolowsky-files-live/", "title"=>" The Tobolowsky Files Live "}
{"date"=>" Sat, Nov 12", "link"=>"http://brattlefilm.org/2011/11/12/the-toboloswky-files-live/", "title"=>" The Tobolowsky Files Live "}
{"date"=>" Sun, Nov 13", "link"=>"http://brattlefilm.org/2011/11/13/the-tobolowsky-files-live-2/", "title"=>" The Tobolowsky Files Live "}
{"date"=>" Mon, Nov 14", "link"=>"http://brattlefilm.org/2011/11/14/new-england-folk-music-archives-benefit-concert/", "title"=>" New England Folk Music Archives Benefit Concert "}
{"date"=>" Tue, Nov 15", "link"=>"http://brattlefilm.org/2011/11/15/balagan-presents-the-observers/", "title"=>" Balagan Presents: The Observers "}
{"date"=>" Mon, Nov 21", "link"=>"http://brattlefilm.org/2011/11/21/cinecache-presents-green/", "title"=>" CineCache Presents: Green "}
{"date"=>" Tue, Nov 29", "link"=>"http://brattlefilm.org/2011/11/29/balagan-presents-bruce-baillie-and-the-early-canyon-cinema-years/", "title"=>" Balagan Presents: Bruce Baillie and the Early Canyon Cinema Years "}
{"date"=>" Wed, Nov 30", "link"=>"http://brattlefilm.org/2011/11/30/harvard-book-store-presents-errol-morris/", "title"=>" Harvard Book Store Presents Errol Morris "}
{"date"=>" Sun, Dec 4", "link"=>"http://brattlefilm.org/2011/12/04/threepenny-opera/", "title"=>" Threepenny Opera "}
