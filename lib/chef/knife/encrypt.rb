require "chef/knife"

class Chef
  class Knife
    class Encrypt < Knife
      def run
        decrypted_value = eval @name_args[0]
        secret = Chef::EncryptedDataBagItem.load_secret
        encrypted_value = Chef::EncryptedDataBagItem.encrypt_value decrypted_value, secret
        puts encrypted_value
      end
    end
  end
end
