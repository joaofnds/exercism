require 'minitest/autorun'
require_relative 'hamming'

# Common test data version: 2.2.0 4c453c8
class HammingTest < Minitest::Test
  def test_empty_strands
    assert_equal 0, Hamming.compute('', '')
  end

  def test_single_letter_identical_strands
    assert_equal 0, Hamming.compute('A', 'A')
  end

  def test_single_letter_different_strands
    assert_equal 1, Hamming.compute('G', 'T')
  end

  def test_long_identical_strands
    assert_equal 0, Hamming.compute('GGACTGAAATCTG', 'GGACTGAAATCTG')
  end

  def test_long_different_strands
    assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  end

  def test_disallow_first_strand_longer
    assert_raises(ArgumentError) do
      Hamming.compute('AATG', 'AAA')
    end
  end

  def test_disallow_second_strand_longer
    assert_raises(ArgumentError) do
      Hamming.compute('ATA', 'AGTG')
    end
  end
end

if defined?(Minitest)
  describe :Hamming do

    expected = 'some custom message'

    describe :DifferentLengthStrandsError do
      describe 'must honor expected conventions' do
        it 'must accept a custom message on demand' do
          actual = Hamming::DifferentLengthStrandsError.new('some custom message').message

          assert_equal actual, expected
        end
      end
    end

    describe :InvalidDNANucleotideError do
      describe 'must honor expected conventions' do
        it 'must accept a custom message on demand' do
          actual = Hamming::InvalidDNANucleotideError.new('some custom message').message

          assert_equal actual, expected
        end
      end
    end
  end
end
