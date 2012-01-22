module MongoModel
  class Base
    include Mongoid::Document
    include Mongoid::Timestamps
  end
end
