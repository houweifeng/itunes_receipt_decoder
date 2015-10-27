##
# ItunesReceiptDecoder
module ItunesReceiptDecoder
  ##
  # ItunesReceiptDecoder::Decode
  module Decode
    ##
    # ItunesReceiptDecoder::Decode::Base
    class Base
      ##
      # The raw receipt, i.e. not base64 encoded
      attr_reader :raw_receipt, :options

      ##
      # Initializes with a raw (base64 decoded receipt)
      #
      # ==== Arguments
      #
      # * +raw_receipt+ - the raw receipt, i.e. not base64 encoded
      def initialize(raw_receipt, options = {})
        @raw_receipt = raw_receipt
        @options = options
      end

      ##
      # Returns the receipt receipt properties
      def receipt
        decode && @receipt
      end

      ##
      # Returns true if the receipt is created in the Production environment
      def production?
        environment == 'Production'
      end

      ##
      # Returns true if the receipt is +not+ created in Production
      def sandbox?
        !production?
      end
    end
  end
end
