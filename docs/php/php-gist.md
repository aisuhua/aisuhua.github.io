# PHP Gist

## 二维数组排序

```php
function array_sort_by_column(&$arr, $col, $dir = SORT_ASC) {
    $sort_col = array();
    foreach ($arr as $key => $row) {
        $sort_col[$key] = $row[$col];
    }

    array_multisort($sort_col, $dir, $arr);
}

array_sort_by_column($array, 'order');
```

- https://stackoverflow.com/a/2699153/6693877
