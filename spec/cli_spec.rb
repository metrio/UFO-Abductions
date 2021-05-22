describe HangmanLogic do

    let(:dummy_class) {Class.new {extend HangmanLogic}}

    it 'Returns a partially revealed Code Word when letter is correct' do
        word = "codecademy"
        letters = ["e", "a"]

        expect(dummy_class.check_word(word, letters)).to eq '___e_a_e__'
    end

    it "Returns blank letters if no letter is correct" do
        word = "codecademy"
        letters = ["f", "z"]

        expect(dummy_class.check_word(word, letters)).to eq '__________'
    end

end