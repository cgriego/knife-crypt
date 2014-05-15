require "chef/knife"

class Chef
  class Knife
    class Decrypt < Knife
      banner "knife decrypt DATA (options)"

      def run
        if @name_args.empty?
          show_usage
          ui.fatal "You must specify data to decrypt"
          exit 1
        end

        encrypted_value = @name_args[0]
        secret = Chef::EncryptedDataBagItem.load_secret
        decrypted_value = if Chef::EncryptedDataBagItem.methods.include?(:decrypt_value)
                            Chef::EncryptedDataBagItem.decrypt_value encrypted_value, secret
                          else
                            Chef::EncryptedDataBagItem::Decryptor.for(encrypted_value, secret).for_decrypted_item
                          end
        puts decrypted_value.inspect
      end
    end
  end
end
