public func quickSort(inout array: [Int], start: Int, end: Int, view: ArrayStackView, inout iterations: Int) {
    if start < end {
        let p = partition(&array, start: start, end: end, view: view, iterations: &iterations)
        quickSort(&array, start: start, end: p-1, view: view, iterations: &iterations)
        quickSort(&array, start: p+1, end: end, view: view, iterations: &iterations)
    }
}

func partition(inout array: [Int], start: Int, end: Int, view: ArrayStackView, inout iterations: Int) -> Int {
    let pivotIndex = choosePivot(array, start: start, end: end)
    let pivotValue = array[pivotIndex]
    swap(&array[pivotIndex], &array[end])
    
    var storeIndex = start
    
    for index in start..<end {
        if array[index] < pivotValue {
            swap(&array[index], &array[storeIndex++])
            view.values = array
            view.captureView("View")
        }
        iterations++
    }
    
    swap(&array[end], &array[storeIndex])
    view.values = array
    view.captureView("View")
    
    return storeIndex
}

func choosePivot(array: [Int], start: Int, end: Int) -> Int {
    let first = array[start]
    let last = array[end]
    let mid = array[(end - start) / 2 + start]
    
    return [(first, start), (mid, (end - start) / 2 + start), (last, end)].sort{$0.0 < $1.0}[1].1
}