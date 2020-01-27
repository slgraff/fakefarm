%{a: thing, b: foo, c: blah } = [1,2,3]
%{a: thing } = {1,2,3}
%{a: thing } = %{1,2,3}


uuid = 'abc'
uuid2 = 'abcd'
data = %{"id"=> uuid2}
%{"id"=> uuid} = data
%{"id"=> uuid} = %{"id"=> uuid2}

my_map = %{1 => {"Fake", "Farm", "hay@fakefarm.com"}, 2 => {"And", "Or.at", "http://and.or.at"}}
other_map = %{:names => ["Abraham", "Isaac", "Jacob"], israel: true }
another = %{{:ok, 1} => true, {:ok, 2} => false}

%{{:ok, 1} => boom } = another
=> boom == true
%{{:ok, 1} => boom } = another

%{:names => blah, israel: 'real' } = other_map



%{{:ok, 1} => booxm, {:ok, 2} => vase} == another