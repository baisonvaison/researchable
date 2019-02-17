module ApplicationHelper
    #これかけばresource_nameとresourceに関するエラーが取り除ける。http://hajimete-ruby.jugem.jp/?cid=19
    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
end
