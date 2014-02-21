class SitemapWorker
  include SuckerPunch::Job

  def perform
    ActiveRecord::Base.connection_pool.with_connection do
      SitemapService.call
    end
  end
end
