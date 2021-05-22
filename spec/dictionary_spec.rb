describe Dictionary_Methods do

    let(:dummy_class) {Class.new {extend Dictionary_Methods}}

    it 'Returns a partially revealed Code Word when letter is correct' do
        word = "codecademy"

        expect(dummy_class.similar_words(word)).to eq '___e_a_e__'
    end

    it "Returns blank letters if no letter is correct" do
        word = "codecademy"
        

        expect(dummy_class.similar_words(word)).to eq '__________'
    end

end