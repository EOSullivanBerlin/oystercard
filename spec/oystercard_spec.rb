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
        expect(subject.top_up(90)).to eq 90
        end
        
      it "cedits the cards balance" do
         expect{subject.top_up 90 }.to change{ subject.balance }.by 90 
  
     end
     it 'raise an error if the max credit is exceded' do
       max_balance = Oystercard::MAXBALANCE
       expect{subject.top_up 100}.to raise_error "Max balance of #{max_balance} exceeded"
     end
     
    end
end