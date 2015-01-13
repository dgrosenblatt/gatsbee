class AmazonApi
  def self.item_search(book)
    request = Vacuum.new
    request.associate_tag = ENV["ASSOCIATE_TAG"]
    response = request.item_search(
      query: { "Keywords"=>book.title, "SearchIndex"=>"Books" }
    )
    results = response.parse["ItemSearchResponse"]["Items"]["Item"].first #array
    book.amazon_url = results["DetailPageURL"]
    book.update_attributes(image_lookup(results["ASIN"]))
  end

  def self.image_lookup(asin)
    request = Vacuum.new
    request.associate_tag = ENV["ASSOCIATE_TAG"]
    response = request.item_lookup(
      query: { "ItemId"=>asin, "ResponseGroup"=>"Images" }
    )
    { small_image: response.parse["ItemLookupResponse"]["Items"]["Item"]["SmallImage"]["URL"],
      medium_image: response.parse["ItemLookupResponse"]["Items"]["Item"]["MediumImage"]["URL"]}
  end
end
