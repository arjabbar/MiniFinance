module ActiveRecordExtension

  extend ActiveSupport::Concern

  module ClassMethods

    def random numRecords = 1
      return self.all.sample if numRecords == 1
      Array.new(numRecords) { |i| self.all.sample }
    end

  end

end

ActiveRecord::Base.send :include, ActiveRecordExtension