class RenamePropetyNameColumnToRentalProperties < ActiveRecord::Migration[5.0]
  def change
     rename_column :rental_properties, :propety_name, :property_name
  end
end
