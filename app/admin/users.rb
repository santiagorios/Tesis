ActiveAdmin.register User do

  menu false

  filter :email
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    column :email, :sortable => :name do |user|
      link_to user.name, [:admin, user]
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.buttons
  end

  controller do
    def create
      @user = User.new(params[:user])
      @user.save(:validate => false)
      render active_admin_template('index')
    end

    def update
      @user = User.find(params[:id])
      @user.update_attributes(params[:user])
      @user.save(:validate => false)
      render active_admin_template('index')
    end

    def scoped_collection
      User.where('email not like "%@espe.edu.ec%"')
    end

  end




end
