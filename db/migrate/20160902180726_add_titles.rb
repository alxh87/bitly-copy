class AddTitles < ActiveRecord::Migration
	def change
		add_column :urls, :title, :string, default: ""
	end
end
