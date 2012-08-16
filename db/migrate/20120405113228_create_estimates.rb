#---
# Excerpted from "The Rails View",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/warv for more book information.
#---
class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :hours
      t.decimal :rate, precision: 10, scale: 2

      t.timestamps
    end
  end
end
