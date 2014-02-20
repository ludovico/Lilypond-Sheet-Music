\version "2.14.2"
\include "deutsch.ly"

#(set-global-staff-size 17)

\header {
  title     = \markup \bold \italic "Rondo in e-moll"
  subtitle  = "- Transponiert nach h-moll für drei Cellostimmen -"
  composer  = "Wolfgang Amadeus Mozart (1756-1791)"
  arranger  = "arr.: Viktor Dekoj"
  enteredby = "cellist (2013-12-19)"
  piece     = "(KV 495)"
}

voiceconsts = {
  \key g \minor
  \time 6/8
%  \clef "treble"
  \clef "tenor"
  %\numericTimeSignature
  \compressFullBarRests
  \set tupletSpannerDuration = #(ly:make-moment 1 4)
  \tempo "Allegro " 4.=100
}

%minstr = "harpsichord"
mihi = "clarinet"
%minstr = "accordion"
milo = "bassoon"

boxa = \mark \markup \box "A"
boxb = { \bar "||" \mark \markup \box "B" }
boxc = { \bar "||" \mark \markup \box "C" }
boxd = { \bar "||" \mark \markup \box "D" }
boxe = { \bar "||" \mark \markup \box "E" }
boxf = \mark \markup \box "F"
boxg = { \bar "||" \mark \markup \box "G" }
boxh = { \bar "||" \mark \markup \box "H" }
boxi = { \bar "||" \mark \markup \box "I" }
boxj = { \bar "||" \mark \markup \box "J" }
boxk = { \bar "||" \mark \markup \box "K" }
boxl = { \bar "||" \mark \markup \box "L" }
boxm = { \bar "||" \mark \markup \box "M" }

solo = \markup \italic "solo"

\include "v1.ily"
\include "v2.ily"
\include "v3.ily"

music = \new StaffGroup <<
      \new Staff {
	\set Staff.midiInstrument = \mihi
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello I" }
	\transpose g h, { \va }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello II" }
	\transpose g h, { \vb }
      }

      \new Staff {
	\set Staff.midiInstrument = \milo
	\set Staff.instrumentName = \markup \center-column { "Violon-" "cello III" }
	\transpose g h, { \vc }
      }
>>

\book {
  \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}
