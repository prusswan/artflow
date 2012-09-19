require 'deadweight'

Deadweight::RakeTask.new do |dw|
  dw.stylesheets = ["/assets/application.css",
                    "/assets/normalize.css",
                    "/assets/layout.css",
                    "/assets/sidebar.css",
                    "/assets/navigation.css",
                    "/assets/notifications.css",
                    "/assets/creations.css"]

  dw.mechanize = true

  dw.pages = [
    proc {
      fetch('/designers/sign_in')
      form = agent.page.forms.first
      form['designer[email]'] = 'spade@artflowme.com'
      form['designer[password]'] = 'testtest'
      agent.submit(form)
    }
  ]

  urls = ["/creations",
          "/creations/1"]
  dw.pages.concat urls.each { |page| proc { fetch page } }
end
