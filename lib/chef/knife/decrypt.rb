require "chef/knife"

class Chef
  class Knife
    class Decrypt < Knife
      def run
        encrypted_value = @name_args[0]
        secret = Chef::EncryptedDataBagItem.load_secret
        decrypted_value = Chef::EncryptedDataBagItem.decrypt_value encrypted_value, secret
        puts decrypted_value.inspect
      end
    end
  end
end
