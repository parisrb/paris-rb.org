module DateMonkeypatch
  def first_tuesday_of_the_month
    # 2 is tuesday because wday starts at 0 (sunday)

    date = beginning_of_month
    date += (2 - date.wday) % 7
  end
end

Date.include DateMonkeypatch
