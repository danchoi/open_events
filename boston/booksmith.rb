http://www.brooklinebooksmith.com/events/mainevent.html

{
  title: 'Brookline Booksmith',
  categories: %w(books speakers),
  locations: %w(coolidge-corner),
  events: {
    items: ->(doc) {
      doc.search('a').
      select {|x| x['href'] =~ %r{^http://www.brooklinebooksmith-shop.com/event/}}.
      map {|x| x.ancestors.detect {|y| y.name == 'tr'}}
    },
    date: ->(x) { x.xpath('./td[2]/p[1]/text()[1]').text },
    link: ->(x) { x.at('a')['href'] },
    title: ->(x) { x.at('strong').inner_text.strip },
    description: ->(x) { next ; x.xpath('.//p[last()]').inner_text }
  }
}

__END__


{"date"=>" Wednesday, October 26 at 6pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/jeff-lindsay-double-dexter-tickets-required", "title"=>"Jeff Lindsay Double Dexter"}
{"date"=>" Thursday, October 27th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/jen-and-john-yates-wreck-halls-cake-wrecks-gets-festive", "title"=>"Jen and John Yates Wreck the Halls: Cake Wrecks Gets \"Festive\""}
{"date"=>" Friday, October 28th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/common-issue-2-launch-ft-daniel-tobin-katia-kapovich-philip-nikolayev-and-jennifer-acker", "title"=>"The Common Issue 2 Launch ft. Daniel Tobin, Katia Kapovich, Philip Nikolayev, Jennifer Acker, & John Hennessy"}
{"date"=>" Monday, October 31 at 6pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/meir-shalev-my-russian-grandmother-and-her-american-vacuum-cleaner", "title"=>"Meir Shalev My Russian Grandmother and Her American Vacuum Cleaner"}
{"date"=>" Tuesday, November 1st at 6pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/gregory-maguire-out-oz-coolidge-corner-theatre-tickets-required", "title"=>"Gregory Maguire Out of Oz"}
{"date"=>" Wednesday, November 2nd at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/ha-jin-nanjing-requiem", "title"=>"Ha Jin Nanjing Requiem"}
{"date"=>" Friday, November 4th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/amos-oz-scenes-village-life-tickets-required", "title"=>"Amos Oz - on sale 10/3 Scenes from Village Life"}
{"date"=>" Monday, November 7th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/rosalind-barnett-caryl-rivers-truth-about-girls-and-boys", "title"=>"Rosalind Barnett & Caryl Rivers The Truth about Girls and Boys"}
{"date"=>" Wednesday, November 9th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/peter-berger-adventures-accidental-sociologist", "title"=>"Peter L. Berger Adventures of an Accidental Sociologist: How to Explain the World Without Becoming A Bore"}
{"date"=>" Thursday, November 10th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/jay-wexler-odd-clauses", "title"=>"Jay Wexler The Odd Clauses: Understanding the Constitution Through Ten of Its Most Curious Provisions"}
{"date"=>" Tuesday, November 15 at 6pm ", "link"=>"http://www.brooklinebooksmith-shop.com/event/john-hodgman-all", "title"=>"John Hodgman That Is All"}
{"date"=>" Wednesday, November 16th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/larry-doyle-deliriously-happy-and-other-bad-thoughts", "title"=>"Larry Doyle Deliriously Happy and Other Bad Thoughts"}
{"date"=>" Thursday, November 17th from 5-8pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/brookline-authors-reading-first-light-festival", "title"=>"Brookline Authors Reading Part of the First Light Festival"}
{"date"=>" Friday, November 18, 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/breakwater-reading-series-10", "title"=>"Breakwater Reading Series"}
{"date"=>" Tuesday, November 29th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/michael-holley-war-room-legacy-bill-belichick-and-art-building-perfect-team", "title"=>"Michael Holley War Room: The Legacy of Bill Belichick and the Art of Building the Perfect Team"}
{"date"=>" Wednesday, November 30th at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/staff-recommendations-grown-ups", "title"=>"Staff Recommendations for Grown-Ups"}
{"date"=>" Thursday, December 1st at 7pm", "link"=>"http://www.brooklinebooksmith-shop.com/event/staff-recommendations-kids", "title"=>"Staff Recommendations for Kids"}
