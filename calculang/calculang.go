package main

import (
	"fmt"
)

func main() {
	h := &Heap{vars: make(map[rune]int)}
	h.set('a', 2)
	h.set('b', h.get('a'))
	h.add('b', 3)
	h.print('b')
}


type item struct {
	typ itemType
	val string
}

type itemType int
const (
	itemError itemType = iota
	itemEOF
	item
)



type Heap struct {
	vars map[rune]int
}

func (h *Heap) Get(letter rune) (int) {
	val, ok := h.vars[letter]
	if !ok {
		h.vars[letter] = 0;
		val = 0
	}

	return val
}

func (h *Heap) Set(letter rune, val int) {
	h.vars[letter] = val
}

func (h *Heap) Print(letter rune) {
	val := h.Get(letter)

	fmt.Println(val)
}

func (h *Heap) Add(letter rune, val int) {
	h.vars[letter] += val
}
