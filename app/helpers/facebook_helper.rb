module FacebookHelper

  def fb_init(async=true)
    if async
      <<-CODE
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=#{FB_APP_ID}";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
      CODE
    else
      <<-CODE
      <div id="fb-root"></div>
      <script src="http://connect.facebook.net/en_US/all.js"></script>
      <script>
          FB.init({ 
              appId:'#{FB_APP_ID}', cookie:true, 
              status:true, xfbml:true, oauth:true
          });
      </script>
      CODE
    end
  end
end