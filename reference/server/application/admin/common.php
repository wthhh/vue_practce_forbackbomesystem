<?php

function getTree($data = [])
{
    if (empty($data)) {
        return [];
    }
    $arr = [];
    foreach ($data as $key => &$value) {
        $value['checked'] = false;
        if ($value['pid'] == 0) {
            $value['meta']['title'] = $value['title'];
            $value['meta']['icon'] = $value['icon'];
            array_push($arr, $value);
            unset($value);
        }
    }

    foreach ($data as $key => &$value) {
        if ($value['pid'] != 0) {
            unset($value['redirect']);
            $value['meta']['title'] = $value['title'];
            $value['meta']['icon'] = $value['icon'];
            foreach ($arr as $k => &$v) {
                if ($v['id'] == $value['pid']) {
                    if (isset($v['children'])) {
                        array_push($v['children'], $value);
                    } else {
                        $v['children'] = [];
                        array_push($v['children'], $value);
                    }
                }
            }
            unset($value);
        }
    }
    return $arr;
}

function getRules($data = [])
{
    $arr = [];
    foreach ($data as $key => $value) {
        if ($value['op']) {
            array_push($arr, $value['op']);
        }
    }
    return $arr;
}

function checkFields($fields, $data)
{
    if (is_array($fields)) {
        $keys = array_keys(array_intersect_key($fields, $data));
        $result = [];
        foreach ($keys as $key) {
            $result[$key] = $data[$key];
        }
        return $result;
    }
    return [];
}
