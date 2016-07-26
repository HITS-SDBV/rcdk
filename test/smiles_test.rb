require 'test_helper'
require 'rcdk'
require 'rcdk/util'
require 'pathname'

jrequire 'org.openscience.cdk.templates.MoleculeFactory'

# A very simple test suite. Woefully incomplete. Just exercises the API.
class BasicTest < Minitest::Test
  include RCDK::Util
  include Org::Openscience::Cdk::Templates
  
  OUTPUT_DIR = "tmp"

  def setup
    @benzene =
"c1ccccc1
JME 2004.10 Thu Jun 01 18:20:16 EDT 2006

  6  6  0  0  0  0  0  0  0  0999 V2000
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
    0.0000    0.0000    0.0000 C   0  0  0  0  0  0  0  0  0  0  0  0
  1  2  2  0  0  0  0
  1  3  1  0  0  0  0
  2  4  1  0  0  0  0
  3  5  2  0  0  0  0
  4  6  2  0  0  0  0
  5  6  1  0  0  0  0
M  END"
    @chlorbenzene_smiles = 'Clc1ccccc1'
    @output_folder = Pathname.new(OUTPUT_DIR)
    unless @output_folder.exist?
      @output_folder.mkdir
    end
  end

  def test_output_folder
    assert @output_folder.exist?
  end

  def test_smiles_to_png
    output_file = @output_folder.join('chlorobenzene.png').to_path
    Image.smiles_to_png(@chlorbenzene_smiles, output_file, 200, 200)
    assert File.exists?(output_file)
  end

  def test_smiles_to_jpg
    output_file = @output_folder.join('chlorobenzene.jpg').to_path
    Image.smiles_to_jpg(@chlorbenzene_smiles, output_file, 200, 200)
    assert File.exists?(output_file)
  end
end

