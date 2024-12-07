# https://adventofcode.com/2024/day/7

(def input-sample
```
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
```)


'(:or (+ 27 (:or (+ 81 40)
                 (* 81 40)))
      (* 27 (:or (+ 81 40)
                 (* 81 40))))

'(:or (+ 20 (:or (+ 16 (:or (+ 11 6)
                            (* 11 6)))
                 (* 16 (:or (+ 11 6)
                            (* 11 6)))))
      (* 20 (:or (+ 16 (:or (+ 11 6)
                            (* 11 6)))
                 (* 16 (:or (+ 11 6)
                            (* 11 6))))))

(defn parse [txt]
  (peg/match
   '{:main (some :line)
     :line (group (* :num ":" (some (* " " :num)) :eol))
     :num (number :d+)
     :eol (+ "\n" -1)}
   txt))

(defn calibrated? [[res & numbers]]
  (cond
    (> res (* ;numbers)) false
    (= res (* ;numbers)) true
    (= res (+ ;numbers)) true
    (let [ops (generate-ops numbers)]
      (truthy? (some |(= res (eval $)) ops))
      )))

# (((11 6) 16) 20)
# (
# (+ ((11 6) 16) 20))
# 
# (* ((11 6) 16) 20))
#  



(defn solve-part-1 [equations]
  )

(let [equations (parse input-sample)]
  (pp equations))
