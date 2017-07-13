class LineItem < ActiveRecord::Base
  validates :valor, numericality: {greater_than: 0.00}
  belongs_to :presente
  has_many :orders, dependent: :destroy

 before_create :update_total

  protected

  def update_total
  	@item = Presente.find(self.presente_id)
  	@item.total += self.valor
  	@item.save
  end

end
