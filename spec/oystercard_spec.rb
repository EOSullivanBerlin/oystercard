require 'oystercard'
describe Oystercard do
  it{is_expected.to respond_to(:balance)}
  
  describe '#balance' do
    it "shows the balance of card" do
       expect(subject.balance).to eq 0    
    end
   end
   
  describe "#top_up" do
      it "receives credit" do
        expect(subject.top_up(100)).to eq 100
        end
        
      it "cedits the cards balance" do
          subject.top_up(100)
          expect(subject.balance).to eq 100
      end
    end
end