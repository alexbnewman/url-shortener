# NOTES: Encoding in base-62.

# TODO: Change model so short isn't saved...
class UrlConverter

    @@base = 62
    @@string62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    # NOTES: Use "self" so that you can call methods without having
    # to create an actual instance of the class.
    # Ruby recognizes the ID as an int bc ActiveRecord
    # assumes it is an int (bc from DB row) -- so don't have to do
    # id.to_i.
    def self.encode(id)
        url = to_base_62(id)
        url.map! {|elt| @@string62[elt]}
        url = url.join
        return url
    end

    def self.decode(url)
        return url
    end

    ##################################
    private

    def self.to_base_62(n)
        digits = []

        while n > 0
            digits.push(n % @@base)
            n = n / @@base
        end

        return digits.reverse!

    end

end
