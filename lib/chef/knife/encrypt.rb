require "chef/knife"

class Chef
  class Knife
    class Encrypt < Knife
      banner "knife encrypt DATA (options)"

      def run
        if @name_args.empty?
          show_usage
          ui.fatal "You must specify data to encrypt"
          exit 1
        end

        decrypted_value = eval @name_args[0]
        initialization_vector = @name_args[1]
        secret = Chef::EncryptedDataBagItem.load_secret
        encrypted_value = if Chef::EncryptedDataBagItem.methods.include? :encrypt_value
                            Chef::EncryptedDataBagItem.encrypt_value(decrypted_value, secret)
                          else
			    Chef::EncryptedDataBagItem::Encryptor.new(decrypted_value, secret, initialization_vector).for_encrypted_item
                          end
        puts encrypted_value
      end
    end
  end
end
