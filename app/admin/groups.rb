ActiveAdmin.register Group do
  before_filter do
    Group.class_eval do
      def to_param
        id.to_s
      end
    end
  end
end
