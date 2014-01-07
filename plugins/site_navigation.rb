module Jekyll

  class SiteNavigation < Jekyll::Generator
    safe true
    priority :lowest

    def find_page(page, pages)
      pages.each do |p|
        return p if p['url'] == page
      end
      return nil
    end

    def generate(site)
      root = nil

      # First grab all o fthe pages
      pages = site.pages.map { |page|
        if page.dir =~ /\A\/dev\/docs.*/
          {'label' => page.data['name'], 'url' => page.url.gsub('/index.html', '.html').gsub('.html', '/'), 'order' => (page.data['order'] || 0).to_i}
        end
      }.compact

      # Sort them into a hierarchy
      pages.each do |page|
        # put each page in its parent node
        parent_url = page['url'].split('/')[0..-2].join('/') + '/'
        parent = find_page(parent_url, pages)
        if parent.nil?
          # This is the root element
          root = page
        else
          parent['list'] ||= []
          parent['list'] << page
          parent['list'].sort_by!{ |x| [x['order'], x['url']] }
        end
      end

      # Access this in Liquid using: site.dev_api_navigation
      site.config["dev_api_navigation"] = root['list']
    end
  end
end
