vb = \relative c' {
  \voiceconsts
  \clef "bass"
  
  \repeat volta 2 {
    <g h d>2\arpeggio a4
    h2.
    c
    h
    a
    g

    d'4 h g
    d' \breathe d,8( c' h a)
    h2 a4
    g( h) g
    c2.
    h4 c8( h a g)
    a2 fis4

    g2 h4(
    c) d( d,)
    g2( g,4)
  }

  \repeat volta 2 {
    g'2.(
    fis)
    e4 g e
    a2( a,4)

    a'2.
    h4( d) cis(
    d) fis,( a)
    d \breathe d, c'?
    << { h( d) } \\ h2 >> h4
    << { c( e) } \\ c2 >> c4
    h a g

    d'2 r4
    d,2 fis4
    e( g) fis(
    g) h,( d)
    g d g,
  }
}