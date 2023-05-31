require 'digest'

# Note: Using MD5 to hash (uniqueness) and then encoding in Base-62
# to make hash the correct size (and allow for greater uniqueness than
# just truncating the hash).

class UrlConverter
    # Use "self" so that you can call methods without having
    # to create an actual instance of the class.
    # TODO: Do I need to call ".to_s" on "url"?
    def self.encode(url)
        # Hexdigest so encoding is better.
        hash = Digest::MD5.hexdigest url
        return url
    end

    def self.decode(url)
        return url
    end

    private

end