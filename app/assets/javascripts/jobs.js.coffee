$ ->
  $jobsList = $('#jobsList')

  numberOfDays = (rubyDate) ->
    dateToday = new Date()
    date = new Date(rubyDate)
    timeDiff = Math.abs(dateToday.getTime() - date.getTime());
    diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));



  if $jobsList.length > 0
    $.get 'https://jobs.rubyparis.org/en/job_offers.json', (jobs) ->
      job_links = $.map jobs, (job) ->
        if(numberOfDays(job.updated_at) > 300)
          return


        """
          <div class="job col-sm-3">
            <a class="job-link" href="https://jobs.rubyparis.org/en/job_offers/#{job.slug}">
              <strong>#{job.title}</strong><br/>
              Employeur : #{job.company_name}
            </a>
          </div>
        """
      $jobsList.append(job_links.join(''))
