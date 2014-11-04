require 'rails_admin/config/actions/lineup'

RailsAdmin.config do |config|
  config.actions do
    dashboard
    lineup
    index
    new
    export
    history_index
    bulk_delete
    show
    edit
    delete
    history_show
    show_in_app
  end

  config.main_app_name = ['Paris.rb', 'Admin']
  config.authenticate_with { warden.authenticate! scope: :user }
  config.current_user_method(&:current_user)
  config.default_items_per_page = 30

  config.model 'Talk' do
    list do
      field :happened do
        formatted_value do
          if bindings[:object].happened?
            bindings[:view].content_tag(:span, class: 'label label-success') { I18n.t('yes') }
          else
            bindings[:view].content_tag(:span, class: 'label label-important') { I18n.t('no') }
          end
        end
      end
      field :title
      field :speaker_name
      field :duration
      field :slides do
        formatted_value do
          if bindings[:object].slides?
            bindings[:view].content_tag(:span, class: 'label label-success') { I18n.t('yes') }
          else
            bindings[:view].content_tag(:span, class: 'label label-important') { I18n.t('no') }
          end
        end
      end
      field :video_slug do
        formatted_value do
          if bindings[:object].video_url?
            bindings[:view].content_tag(:span, class: 'label label-success') { I18n.t('yes') }
          else
            bindings[:view].content_tag(:span, class: 'label label-important') { I18n.t('no') }
          end
        end
      end
    end
  end
end
