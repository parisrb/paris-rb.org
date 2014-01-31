$ ->
  vimeo_url = $('#video_vimeo_url')

  extract_details = (video) ->
    data = video.description.split(' - ')
    {
      event_date: data[1]
      description: data[0].replace(/<br \/>/g, '')
    }

  $(document).on 'blur', '#video_vimeo_url', ->
    if match = $(this).val().match(/\d+$/)
      id = match[0]
      $.getJSON "http://vimeo.com/api/v2/video/#{id}.json?callback=?", (json) ->
        video = json[0]

        $('#video_title').val(video.title)
        $('#video_vimeo_thumbnail').val(video.thumbnail_large)

        details = extract_details(video)
        $('#video_description').val(details.description)
        $('#video_event_date_field').find('input').val(details.event_date)
