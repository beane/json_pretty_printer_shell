require 'json'

describe 'pretty_printer' do
  let!(:empty_output) { `echo '' | ./pretty_printer`.strip }

  it 'is executable' do
    expect(empty_output).to be_empty
  end

  # if you want to see something yourself in the shell:
  # ruby -e 'require "json"; puts({this: :that, the: [:other, :thing], be: [1,2,3, [4,5,6], [7,"four five six",{a: :b, c: [:d,:f]}]]}.to_json)' | ./pretty_printer`
  it 'parses json' do
    expect(`ruby -e 'require "json"; puts({this: :that, the: [:other, :thing], be: [1,2,3, [4,5,6], [7,"four five six",{a: :b, c: [:d,:f]}]]}.to_json)' | ./pretty_printer`.strip).to eq(%Q{
{
    "this": "that",
    "the": [
        "other",
        "thing"
    ],
    "be": [
        1,
        2,
        3,
        [
            4,
            5,
            6
        ],
        [
            7,
            "four five six",
            {
                "a": "b",
                "c": [
                    "d",
                    "f"
                ]
            }
        ]
    ]
}
}.strip)
  end
end
