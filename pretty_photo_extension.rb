# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PrettyPhotoExtension < Spree::Extension
  version "1.0"
  description "This extension adds prettyPhoto lightbox for full image size view."
  url "http://www.gravastar.cz"

  # Please use pretty_photo/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    Spree::BaseHelper.class_eval do
      # image_style will typically be one of :mini, :small, :product, :large, :original
      def product_image_path(product, image_style=:original)
        if product.images.empty?
          image_path "noimage/#{image_style.to_s}.jpg"
        else
          image_path product.images.first.attachment.url(image_style)
        end
      end
    end

    # Add your extension tab to the admin.
    # Requires that you have defined an admin controller:
    # app/controllers/admin/yourextension_controller
    # and that you mapped your admin in config/routes

    #Admin::BaseController.class_eval do
    #  before_filter :add_yourextension_tab
    #
    #  def add_yourextension_tab
    #    # add_extension_admin_tab takes an array containing the same arguments expected
    #    # by the tab helper method:
    #    #   [ :extension_name, { :label => "Your Extension", :route => "/some/non/standard/route" } ]
    #    add_extension_admin_tab [ :yourextension ]
    #  end
    #end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
