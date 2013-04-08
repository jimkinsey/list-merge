global.chai = require("chai")
global.should = chai.should()
{mergeLists} = require('../main/list-merge')

describe 'mergeLists', ->

  it 'should produce an empty list when both lists are empty', ->
    mergeNumberLists([], []).should.deep.equal []

  it 'should return the right list when the left list is empty', ->
    mergeNumberLists([], [1]).should.deep.equal [1]
    
  it 'should return the left list when the right list is empty', ->
    mergeNumberLists([2], []).should.deep.equal [2]
    
  it 'should merge the items when they are the same on both sides', ->
    mergeNumberLists([3], [3]).should.deep.equal [3]
    
  it 'should include items from right which are not in left', ->
    mergeNumberLists([1,3],[1,2,3]).should.deep.equal [1,2,3]
    
  it 'should include items from left which are not in right', ->
    mergeNumberLists([4,5],[5,6]).should.deep.equal [4,5,6]
    
  it 'should produce a list sorted according to the comparator', ->
    mergeNumberLists([10,8],[9,1]).should.deep.equal [1,8,9,10]

  compareNums = (a, b) ->
    if (a == b) then 0 else (a - b) / Math.abs(a - b)

  mergeNums = (a, b) -> a

  mergeNumberLists = mergeLists(compareNums, mergeNums)