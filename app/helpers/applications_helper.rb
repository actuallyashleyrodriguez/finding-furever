module ApplicationsHelper

    def app_created(obj)
        obj.created_at.strftime("%B %eth, %Y at %l:%M %p")
    end
end
