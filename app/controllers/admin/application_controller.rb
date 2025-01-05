class Admin::ApplicationController < ApplicationController
  include Authentication
  layout "admin"
end
