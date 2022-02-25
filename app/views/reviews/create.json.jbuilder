if @review.persisted?
  json.inserted_item json.partial!("reviews/review.html.erb", review: @review)
  json.form json.partial!("reviews/form.html.erb", planet: @planet, review: Review.new)
else
  json.form json.partial!("reviews/form.html.erb", planet: @planet, review: @review)
end
