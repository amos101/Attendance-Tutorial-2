class Attendance < ApplicationRecord
  belongs_to :user
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  
 
  
   # 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  
  validate :started_at_than_finished_at_fast_if_invalid
  
  

  def finished_at_is_invalid_without_a_started_at
    if ( !started_at.blank? && finished_at.blank?) || ( started_at.blank? && !finished_at.blank?)
      errors.add(:started_atm,'必須です') 
    end
    
   
    # if !started_at.blank? && started_at.present?
    #   errors.add(:started_at, "が必要です") if !started_at.present? 
    # end
  end
  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_atm,"より早い退勤時間は無効です") if started_at > finished_at
    end 
  end 
end