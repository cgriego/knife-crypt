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

module Encryption
  class PlainEncrypt < Chef::Knife
    banner "knife plain_encrypt DATA (options)"

    def run
      if @name_args.empty?
	show_usage
	ui.fatal "You must specify data to encrypt"
	exit 1
      end

      secret = Chef::EncryptedDataBagItem.load_secret
      decrypted_value = eval @name_args[0]

      d = OpenSSL::Cipher.new(Chef::EncryptedDataBagItem::ALGORITHM)
      d.encrypt
      d.pkcs5_keyivgen(secret)

      enc_data = d.update(decrypted_value)
      enc_data << d.final
      puts Base64.encode64(enc_data)
    end
  end
end
