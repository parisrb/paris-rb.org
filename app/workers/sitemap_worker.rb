class SitemapWorker
  include SuckerPunch::Job

  def perform
    ApplicationRecord.connection_pool.with_connection do
      SitemapService.call
    end
  end
end
