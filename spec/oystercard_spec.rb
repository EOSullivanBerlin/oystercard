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
       subject.top_up(max_balance)
       expect{subject.top_up 1}.to raise_error "Max balance of #{max_balance} exceeded"
     end
     
    end
    describe '#deduct' do
      it 'deducts the fare from the balance' do
        expect{subject.deduct(1)}.to change{ subject.balance }.by -1
      end
    end
    
    describe '#touch_in' do
      it 'allows you to start a journey' do
        subject.touch_in
        expect(subject).to be_in_journey
    end
  end
  
    describe '#touch_out' do
      it 'allows the card to stop a journey' do
     
        subject.touch_out
        expect(subject).not_to be_in_journey
      end
    end
  
end