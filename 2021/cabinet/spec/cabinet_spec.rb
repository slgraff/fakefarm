# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Cabinet do
  it 'print out readme' do
    expect(subject.tmp).to eq("I am in projects\n")
  end

  it 'print out every readme' do
    output = ["I am in code\n", "I am in scripts\n", "I am in projects\n", "I am in money\n",
              "I am learning about Torah and want to make comments in it.\n\nAnd sometimes I forget that I am using md, or that iA Writer starts files with .txt", '', "I am in writing\n"]
    expect(subject.readme).to eq(output)
  end

  it 'metadata' do
    metadata = [{ path: './spec/fixtures/projects/code', dir: 'code', readme: true },
                { path: './spec/fixtures/projects/code/scripts', dir: 'scripts', readme: true },
                { path: './spec/fixtures/projects/money', dir: 'money', readme: true },
                { path: './spec/fixtures/projects/writing', dir: 'writing', readme: true },
                { path: './spec/fixtures/projects/writing/bible', dir: 'bible', readme: false },
                { path: './spec/fixtures/projects/writing/bible/commentary',
                  dir: 'commentary',
                  readme: true },
                { path: './spec/fixtures/projects/writing/bible/prophets', dir: 'prophets', readme: true },
                { path: './spec/fixtures/projects/writing/bible/torah', dir: 'torah', readme: false }]
    expect(subject.metadata).to eq(metadata)
  end

  it 'print out readme with titles'
  it 'list out directories'
  it 'list out sub directories'
  it 'list out TODOs'
  it 'list out deadlines'
  it 'list out priorities'
  it 'last updated'
  it 'latest touched'
  it 'search for terms'
  it 'table of contents for a directory'
end
