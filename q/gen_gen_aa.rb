#!/usr/bin/env ruby

s = [
"                 xxxx                                           xxxx   ",
"                 xxxx                                                  ",
"                 xxxx                                                  ",
"    xxxxxxxxx    xxx xxxxxx       xxxxx   xxxx       xxxx      xxxxx   ",
"   xxxxx  xxxx   xxxxxxxxxxx    xxxxxxxx   xxxx     xxxx     xxxxxxxx  ",
"   xxxx          xxxx         xxxx   xxxx   xxxx   xxxx    xxxx   xxxx ",
"     xxxxxxxxx   xxxx         xxx     xxx    xxxx xxxx     xxx    xxxx ",
"        xxxxxxx  xxxx         xxx  xxxx       xxxxxxx      xxx  xxxx   ",
"    xxx    xxxx  xxxx         xxxxxx           xxxxx       xxxxxx      ",
"   xxxxxxxxxxx    xxxxxxxxx    xxxx  xxxx       xxx         xxxx  xxxx ",
"      xxxxxx        xxxxx       xxxxxxxx         x           xxxxxxxx  ",
]

encoded = s.map{|l|
  i = l.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
  i.to_s(36).dump()
}.join(', ')

puts <<-QUINE
eval($s=%w(
  s = %(eval($s=%w(\#{$s})*""));
  puts([
    #{encoded}
  ].map{|l|
    ((0..#{s[0].length-1}).map {|i|
      l.to_i(36)[i] > 0 ? s.slice!(0) : 32.chr
    } * "").rstrip
  })
)*"")
QUINE
