
num getAvrageRating(List<dynamic> reviews) {
  num totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length as num;
}
