-- https://duckduckgo.com/

function main(splash, args)
    -- splash:set_user_agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36")
    --[[
    headers = {
      ['User-Agent'] = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36"
    }
    --]]
    splash:on_request(function(request)
        request:set_header('User-Agent', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36')
    end)
    splash:set_custom_headers(headers)
    url = args.url
      assert(splash:go(url))
    assert(splash:wait(1))
    
    input_box = assert(splash:select("#search_form_input_homepage"))
    input_box:focus()
    input_box:send_text("my user agent")
    assert(splash:wait(0.5))
    --[[
    btn = assert(splash:select("#search_button_homepage"))
    btn:mouse_click()
    --]]
    
    input_box:send_keys("<Enter>")
    assert(splash:wait(5))
    
    splash:set_viewport_full()
    return {
      image = splash:png(),
      html = splash:html()
    }
  end