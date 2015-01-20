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
    results.map! do |item|
      if item["ItemAttributes"]["ProductGroup"] == "Book"
        { title: item["ItemAttributes"]["Title"],
          image_url: AmazonApi.image_lookup(item["ASIN"])[:medium_image] }
      end
    end
    results.compact!.take(5)
  end
end
