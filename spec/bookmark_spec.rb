require 'bookmark'
describe 'Bookmark' do
  describe '#all' do
    it "returns a list of bookmarks" do
      expect(Bookmark.all).to eq ["Makers Academy","Google","Yahoo"]
    end
  end
end
