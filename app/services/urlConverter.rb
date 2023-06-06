# Note: Encoding in base-62.

# TODO: Change model so short isn't saved...
class UrlConverter

    @@base = 62
    @@string62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    # Use "self" so that you can call methods without having
    # to create an actual instance of the class.

    # TODO: Do I need to call ".to_i" on "id"? Change this func
    # so it takes in an id and not a url...
    def self.encode(id)
        url = to_base_62(id)
        url.map! {|elt| @@string62[elt]}
        return url
    end

    def self.decode(url)
        return url
    end

    ##################################
    private

    def to_base_62(n)
        digits = []

        while n > 0
            digits.push(n % @@base)
            n = n / @@base
        end

        return digits.reverse!

    end

end
