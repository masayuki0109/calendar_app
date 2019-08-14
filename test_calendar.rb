RSpec.describe 'カレンダーテスト' do

  it '月がのラベルがあるか' do
    expect(Calendar.new.day_of_weeks).to include '月' 
  end

  it '曜日ラベルは７つあるか' do
    expect(Calendar.new.day_of_weeks(3).size).to eq 7
  end

  it '日曜スタートになっているか' do
    expect(Calendar.new.day_of_weeks.first).to eq '日'
  end

  it '月曜日スタートになっているか' do
    expect(Calendar.new.day_of_weeks(1).first).to eq '月'
  end

  it '木曜日スタートになっているか' do
    expect(Calendar.new.day_of_weeks(4).first).to eq '木'
  end
end
