class AmazonApi
  def self.item_search(book)
    request = Vacuum.new
    request.associate_tag = ENV["ASSOCIATE_TAG"]
    response = request.item_search(query: { "Keywords"=>book.title, "SearchIndex"=>"Books" })
    results = response.parse["ItemSearchResponse"]["Items"]["Item"].try(:first)
    if results.nil?
      return
    end
    book.amazon_itemid = results["ASIN"]
    book.amazon_url = results["DetailPageURL"]
    book.update_attributes(image_lookup(results["ASIN"]))
  end

  def self.image_lookup(asin)
    request = Vacuum.new
    request.associate_tag = ENV["ASSOCIATE_TAG"]
    response = request.item_lookup(query: { "ItemId"=>asin, "ResponseGroup"=>"Images" })
    { small_image: response.parse["ItemLookupResponse"]["Items"]["Item"]["SmallImage"]["URL"],
      medium_image: response.parse["ItemLookupResponse"]["Items"]["Item"]["MediumImage"]["URL"] }
  end

  def self.similarity_lookup(asin)
    request = Vacuum.new
    request.associate_tag = ENV["ASSOCIATE_TAG"]
    response = request.similarity_lookup(query: { "ItemId" => asin }).parse
    results = response["SimilarityLookupResponse"]["Items"]["Item"]
    if results.nil?
      return results
    end
    books = {}
    results.each do |item|
      books[item["ASIN"]] = { title: item["ItemAttributes"]["Title"] }
    end
    images = request.item_lookup(
      query: { "ItemId"=>books.keys.join(','), "ResponseGroup"=>"Images" }
      ).parse["ItemLookupResponse"]["Items"]["Item"]
    images.each do |image|
      books[image["ASIN"]][:image_url] = image["MediumImage"]["URL"]
    end
    books.values
  end
end
