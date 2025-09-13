module DiaryEntriesHelper
  # 気分ごとのラベル（日本語）と絵文字
  def mood_label(mood)
    case mood&.to_sym
    when :good    then "🙂 いい感じ"
    when :normal  then "😌 ふつう"
    when :bad     then "🥲 いまいち"
    when :excited then "🤩 わくわく"
    when :tired   then "😪 つかれた"
    else               "😶 未選択"
    end
  end

  # 気分ごとのバッジ色（Tailwind）
  def mood_badge_class(mood)
    base = "inline-flex items-center rounded-full px-2 py-0.5 text-xs font-medium"
    case mood&.to_sym
    when :good    then "#{base} bg-green-100 text-green-700"
    when :normal  then "#{base} bg-gray-100 text-gray-700"
    when :bad     then "#{base} bg-rose-100 text-rose-700"
    when :excited then "#{base} bg-yellow-100 text-yellow-800"
    when :tired   then "#{base} bg-blue-100 text-blue-700"
    else               "#{base} bg-gray-100 text-gray-500"
    end
  end
end
