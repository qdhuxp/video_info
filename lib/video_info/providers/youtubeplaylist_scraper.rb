require 'oga'

class VideoInfo
  module Providers
    module YoutubePlaylistScraper
      def date
        nil
      end

      def duration
        nil
      end

      def keywords
        nil
      end

      def videos
        raise(NotImplementedError, 'To access videos, you must provide an API key to VideoInfo.provider_api_keys')
      end

      def view_count
        nil
      end

      def thumbnail_small
        thumbnail_medium.sub('mqdefault.jpg', 'default.jpg')
      end

      def thumbnail_medium
        'https:' + data.css('div.pl-header-thumb img').attr('src')[0].value
      end

      def thumbnail_large
        thumbnail_medium.sub('mqdefault.jpg', 'hqdefault.jpg')
      end

      private

      def available?
        !data.css('div#page').attr('class')[0].value.include?('oops-content')
      end
    end
  end
end
