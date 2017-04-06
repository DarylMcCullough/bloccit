module ApplicationHelper
    def form_group_tag(errors, &block)
        css_class = 'form-group'
        css_class << ' has-error' if errors.any?
        content_tag :div, capture(&block), class: css_class
    end
    
    def not_a_moderator?
        current_user && ! current_user.moderator?
   end
end
