class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_date, :end_date, presence: true
  #上記、登録時の設定

  validate :end_date_after_start_date

  private

  def end_date_after_start_date #カレンダーの終了日を開始日以前で設定出来なくする

    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "は開始日より後の日付でなければなりません")
    end
    
  end

end
