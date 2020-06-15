      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '546',
          width: '971',
          videoId: '',
          playerVars: {rel: 0},
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      
      function onPlayerReady(event) {
    	var videoid = $()
    	event.target.loadVideoById(videoid,0, "default");

        event.target.pauseVideo();
      }

      function onPlayerStateChange(event) {
        if (event.data.getPlayerState()==0) {
          event.target.stopVideo();
          event.target.clearVideo();
        }
      }
