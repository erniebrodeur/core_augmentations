require 'core_augmentations/String/to_human'

describe String do
  describe "#to_human" do
    it "Will turn a CamelCase word into words with spaces." do
      expect("CamelCasedWord".to_human).to eq "camel cased word"
    end
    it "Will transform underscored words into words with spaces." do
      expect("underscored_words".to_human).to eq "underscored words"
    end
  end
end
