require 'open-uri'
require 'json'

puts "Destroying lessons..."
Lesson.destroy_all

puts "Seeding 1 lessons..."

lesson = Lesson.new(
  name: "Introduction to Algebra", 
  content: "# Introduction to Algebra

## What is Algebra?

Algebra is the part of mathematics that helps represent problems or situations in the form of mathematical expressions.  In algebra, we use numbers like 2, −7, 0.068 etc., which have a definite or fixed value. In algebra we use variables like x, y, and z along with numbers.

## Signs used in algebra 

Mathematical operations like multiplication (×), division (÷), addition (+), and subtraction (−) are used to form a meaningful mathematical expression.

There are other signs and symbols that are also frequently used in algebra.

equal to (=), not equal to (≠), less than (<), greater than (＞), less than equal to(≤), greater than equal to ( ≥).",
  transcripts: []
)
lesson.save!

puts "Done!"
