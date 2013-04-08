defaultComparator = (a,b) ->
  if (a > b) then 1
  else if (a == b) then 0
  else -1

mergeLists = (comparator = defaultComparator, mergeFunction = (a,b) -> a) ->
  (left, right) ->
    mergeSorted = (left, right) ->
      if (right.length == 0) then return left else if (left.length == 0) then return right
      if (comparator(right[0], left[0]) == 0) 
        [mergeFunction(right[0], left[0])].concat(mergeSorted(right[1..], left[1..]))
      else if (comparator(right[0], left[0]) < 0) 
        [right[0]].concat(mergeSorted(right[1..], left))
      else 
        [left[0]].concat(mergeSorted(right, left[1..]))
    mergeSorted(left.sort(comparator), right.sort(comparator))
    
root = exports ? window
root.mergeLists = mergeLists