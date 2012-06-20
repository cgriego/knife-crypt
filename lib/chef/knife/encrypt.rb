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
        secret = Chef::EncryptedDataBagItem.load_secret
        encrypted_value = Chef::EncryptedDataBagItem.encrypt_value decrypted_value, secret
        puts encrypted_value
      end
    end
  end
end
